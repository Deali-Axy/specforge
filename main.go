// specforge: 项目文档规格体系生成工具
//
// 从嵌入的模板生成 docs/ 目录结构，支持交互式配置项目信息和技术栈。
// 用法: specforge [-o output-dir]
package main

import (
	"embed"
	"flag"
	"fmt"
	"os"
	"path/filepath"
	"strconv"
	"strings"
	"time"
)

//go:embed all:docs
var templatesFS embed.FS

// ── 终端颜色 ──────────────────────────────────────────────────────────────────

const (
	green  = "\033[92m"
	yellow = "\033[93m"
	red    = "\033[91m"
	gray   = "\033[90m"
	white  = "\033[97m"
	reset  = "\033[0m"
)

func color(text, c string) string {
	return c + text + reset
}

// ── 交互函数 ──────────────────────────────────────────────────────────────────

var reader = os.Stdin

func ask(prompt, defaultVal string) string {
	if defaultVal != "" {
		fmt.Printf("%s [%s]: ", prompt, color(defaultVal, gray))
	} else {
		fmt.Printf("%s: ", prompt)
	}
	answer := readLine()
	if answer == "" {
		return defaultVal
	}
	return answer
}

func askYesNo(prompt string, defaultYes bool) bool {
	hint := "[Y/n]"
	if !defaultYes {
		hint = "[y/N]"
	}
	fmt.Printf("%s %s: ", prompt, hint)
	answer := readLine()
	if answer == "" {
		return defaultYes
	}
	answer = strings.ToLower(answer)
	return answer == "y" || answer == "yes"
}

// multiSelectOpt 表示多选框中的一个选项。
type multiSelectOpt struct {
	name string
	desc string
}

// askMultiSelect 显示多选框，用户输入编号切换选中状态，回车确认。
func askMultiSelect(prompt string, opts []multiSelectOpt, defaults []bool) []bool {
	selected := make([]bool, len(defaults))
	copy(selected, defaults)

	for {
		// 渲染
		fmt.Printf("\n%s\n", color("── "+prompt+" ──", yellow))
		fmt.Println("  输入编号切换选中状态，直接回车确认。")
		fmt.Println()
		for i, opt := range opts {
			mark := "[ ]"
			label := opt.name
			if selected[i] {
				mark = color("[x]", green)
				label = color(opt.name, white)
			}
			fmt.Printf("  %s %d. %-24s — %s\n", mark, i+1, label, color(opt.desc, gray))
		}
		fmt.Println()

		// 显示当前选择
		chosen := []string{}
		for i, s := range selected {
			if s {
				chosen = append(chosen, strconv.Itoa(i+1))
			}
		}
		hint := "无"
		if len(chosen) > 0 {
			hint = strings.Join(chosen, ",")
		}
		fmt.Printf("  当前选择: %s > ", color(hint, white))

		answer := readLine()
		if answer == "" {
			// 回车确认
			return selected
		}

		// 解析逗号或空格分隔的编号
		answer = strings.ReplaceAll(answer, ",", " ")
		for _, part := range strings.Fields(answer) {
			idx, err := strconv.Atoi(part)
			if err == nil && idx >= 1 && idx <= len(selected) {
				selected[idx-1] = !selected[idx-1]
			}
		}
	}
}

func readLine() string {
	buf := make([]byte, 0, 256)
	tmp := make([]byte, 1)
	for {
		n, err := reader.Read(tmp)
		if n > 0 {
			b := tmp[0]
			if b == '\n' {
				break
			}
			if b == '\r' {
				// Windows \r\n
				continue
			}
			buf = append(buf, b)
		}
		if err != nil {
			break
		}
	}
	return strings.TrimSpace(string(buf))
}

// ── 模板处理 ──────────────────────────────────────────────────────────────────

// replacePlaceholders 替换内容中的 {{KEY}} 占位符。
func replacePlaceholders(content string, replacements map[string]string) string {
	for key, value := range replacements {
		content = strings.ReplaceAll(content, "{{"+key+"}}", value)
	}
	return content
}

// templateEntry 表示一个模板文件的映射关系。
type templateEntry struct {
	src string // 嵌入文件路径 (docs/xxx.tpl)
	dst string // 输出文件路径 (docs/xxx.md)
}

// generateTemplate 从嵌入的 FS 读取模板，替换占位符，写入目标路径。
func generateTemplate(src, dst string, replacements map[string]string) error {
	data, err := templatesFS.ReadFile(src)
	if err != nil {
		return fmt.Errorf("读取模板 %s: %w", src, err)
	}

	content := replacePlaceholders(string(data), replacements)

	if err := os.MkdirAll(filepath.Dir(dst), 0o755); err != nil {
		return fmt.Errorf("创建目录 %s: %w", filepath.Dir(dst), err)
	}

	if err := os.WriteFile(dst, []byte(content), 0o644); err != nil {
		return fmt.Errorf("写入文件 %s: %w", dst, err)
	}

	// 显示相对路径
	display := dst
	if rel, err := filepath.Rel(".", dst); err == nil {
		display = rel
	}
	fmt.Printf("  %s %s\n", color("[OK]", green), filepath.ToSlash(display))
	return nil
}

// joinNonEmptyLines 将非空文本按换行拼接，便于生成可选文档索引片段。
func joinNonEmptyLines(lines ...string) string {
	parts := make([]string, 0, len(lines))
	for _, line := range lines {
		if strings.TrimSpace(line) == "" {
			continue
		}
		parts = append(parts, line)
	}
	return strings.Join(parts, "\n")
}

// ── 主流程 ────────────────────────────────────────────────────────────────────

func main() {
	outputDir := flag.String("o", ".", "输出目录（默认当前目录）")
	flag.Parse()

	fmt.Println()
	fmt.Println(color("═══════════════════════════════════════════════", green))
	fmt.Println(color("  specforge — 项目文档规格体系生成工具", green))
	fmt.Println(color("═══════════════════════════════════════════════", green))

	// ── 收集项目信息 ──────────────────────────────────────────────────────────

	fmt.Println()
	projectName := ask("项目名称", "")
	if projectName == "" {
		fmt.Println(color("错误：项目名称不能为空", red))
		os.Exit(1)
	}

	projectDesc := ask("项目简述 (一句话描述)", "")
	today := time.Now().Format("2006-01-02")

	// 技术栈
	fmt.Println()
	fmt.Println(color("── 技术栈配置 ──", yellow))

	backend := ask("后端框架", "如 NestJS, Express, FastAPI, 留空表示无后端")
	frontend := ask("前端框架", "如 React, Vue, Svelte, 留空表示无前端")
	database := ask("数据库", "如 SQLite, PostgreSQL, MongoDB, 留空表示无数据库")
	aiSdk := ask("AI/LLM SDK", "如 Vercel AI SDK, LangChain, 留空表示无 AI")

	hasFrontend := frontend != ""
	hasBackend := backend != ""
	hasApi := hasBackend && hasFrontend
	hasMonorepo := askYesNo("是否使用 Monorepo？", hasFrontend && hasBackend)

	techParts := []string{}
	for _, t := range []string{backend, frontend, database, aiSdk} {
		if t != "" {
			techParts = append(techParts, t)
		}
	}
	techStackSummary := strings.Join(techParts, " + ")

	// ── 可选模块（多选框）──────────────────────────────────────────────────

	var moduleOpts []multiSelectOpt
	var moduleKeys []string

	if hasFrontend {
		moduleOpts = append(moduleOpts, multiSelectOpt{"前端开发规范", "有前端应用时"})
		moduleKeys = append(moduleKeys, "frontend")
	}
	if hasApi {
		moduleOpts = append(moduleOpts, multiSelectOpt{"API 合约设计", "有前后端分离 API 时"})
		moduleKeys = append(moduleKeys, "api")
	}
	if hasMonorepo {
		moduleOpts = append(moduleOpts, multiSelectOpt{"Monorepo 配置指南", "使用 monorepo 时"})
		moduleKeys = append(moduleKeys, "monorepo")
	}
	moduleOpts = append(moduleOpts, multiSelectOpt{"测试策略", "需要测试规范时"})
	moduleKeys = append(moduleKeys, "testing")
	moduleOpts = append(moduleOpts, multiSelectOpt{"AI 工程实践指南", "AI 辅助开发方法论"})
	moduleKeys = append(moduleKeys, "methodology")

	defaults := make([]bool, len(moduleOpts))
	for i := range defaults {
		defaults[i] = true
	}

	selected := askMultiSelect("可选文档模块", moduleOpts, defaults)
	selectedKeys := map[string]bool{}
	for i, s := range selected {
		if s {
			selectedKeys[moduleKeys[i]] = true
		}
	}

	includeFrontend := selectedKeys["frontend"]
	includeApi := selectedKeys["api"]
	includeMonorepo := selectedKeys["monorepo"]
	includeTesting := selectedKeys["testing"]
	includeMethodology := selectedKeys["methodology"]

	// Phase 配置
	fmt.Println()
	phase1Keyword := ask("Phase 1 关键词", "如 scaffold, mvp, setup")
	if phase1Keyword == "" {
		phase1Keyword = "scaffold"
	}
	phase1Desc := ask("Phase 1 简述", "")
	if phase1Desc == "" {
		phase1Desc = "骨架搭建与基础功能"
	}

	// ── 准备替换映射 ──────────────────────────────────────────────────────────

	scopeVal := strings.ToLower(projectName)
	scopeVal = strings.ReplaceAll(scopeVal, "-", "")
	scopeVal = strings.ReplaceAll(scopeVal, "_", "")
	if len(scopeVal) > 8 {
		scopeVal = scopeVal[:8]
	}

	backendVal := backend
	if backendVal == "" {
		backendVal = "无"
	}
	frontendVal := frontend
	if frontendVal == "" {
		frontendVal = "无"
	}
	databaseVal := database
	if databaseVal == "" {
		databaseVal = "无"
	}
	aiVal := aiSdk
	if aiVal == "" {
		aiVal = "无"
	}

	replacements := map[string]string{
		"PROJECT_NAME":       projectName,
		"DATE":               today,
		"ONE_LINE_TAGLINE":   projectDesc,
		"TECH_STACK_SUMMARY": techStackSummary,
		"BACKEND_FRAMEWORK":  backendVal,
		"FRONTEND_FRAMEWORK": frontendVal,
		"DATABASE":           databaseVal,
		"AI_SDK":             aiVal,
		"PHASE1_KEYWORD":     phase1Keyword,
		"PHASE1_DESCRIPTION": phase1Desc,
		"PHASE_NUM":          "1",
		"PHASE_KEYWORD":      phase1Keyword,
		"PHASE_TITLE":        phase1Desc,
		"PHASE_DESCRIPTION":  phase1Desc,
		"PHASE_GOAL":         phase1Desc,
		"SCOPE":              scopeVal,
		"TECH_DETAIL_DOCS": joinNonEmptyLines(
			"- [前端文档索引](./frontend/README.md)",
			"- [工程文档索引](./engineering/README.md)",
			func() string {
				if !includeApi {
					return ""
				}
				return "- [API 合约设计](./engineering/api-contract-design.md)"
			}(),
			func() string {
				if !includeMonorepo {
					return ""
				}
				return "- [Monorepo 配置指南](./engineering/monorepo-config.md)"
			}(),
			func() string {
				if !includeTesting {
					return ""
				}
				return "- [测试策略](./engineering/testing.md)"
			}(),
		),
	}

	// ── 生成文档 ──────────────────────────────────────────────────────────────

	fmt.Println()
	fmt.Println(color("── 生成文档 ──", yellow))

	// 核心模板（必须）
	coreTemplates := []templateEntry{
		{"docs/CONVENTIONS.md.tpl", "docs/CONVENTIONS.md"},
		{"docs/README.md.tpl", "docs/README.md"},
		{"docs/documentation-design.md.tpl", "docs/documentation-design.md"},
		{"docs/product-design.md.tpl", "docs/product-design.md"},
		{"docs/tech-design.md.tpl", "docs/tech-design.md"},
		{"docs/changes/README.md.tpl", "docs/changes/README.md"},
		{"docs/adr/README.md.tpl", "docs/adr/README.md"},
	}

	for _, t := range coreTemplates {
		if err := generateTemplate(t.src, filepath.Join(*outputDir, t.dst), replacements); err != nil {
			fmt.Println(color("错误: "+err.Error(), red))
			os.Exit(1)
		}
	}

	changesActiveDir := filepath.Join(*outputDir, "docs", "changes", "active")
	if err := os.MkdirAll(changesActiveDir, 0o755); err != nil {
		fmt.Println(color("错误: "+err.Error(), red))
		os.Exit(1)
	}
	changesCompletedDir := filepath.Join(*outputDir, "docs", "changes", "completed")
	if err := os.MkdirAll(changesCompletedDir, 0o755); err != nil {
		fmt.Println(color("错误: "+err.Error(), red))
		os.Exit(1)
	}

	// 可选模板
	if err := generateTemplate("docs/frontend/README.md.tpl", filepath.Join(*outputDir, "docs/frontend/README.md"), replacements); err != nil {
		fmt.Println(color("错误: "+err.Error(), red))
		os.Exit(1)
	}
	if err := generateTemplate("docs/engineering/README.md.tpl", filepath.Join(*outputDir, "docs/engineering/README.md"), replacements); err != nil {
		fmt.Println(color("错误: "+err.Error(), red))
		os.Exit(1)
	}
	if includeFrontend {
		if err := generateTemplate("docs/frontend/frontend-design.md.tpl", filepath.Join(*outputDir, "docs/frontend/frontend-design.md"), replacements); err != nil {
			fmt.Println(color("错误: "+err.Error(), red))
			os.Exit(1)
		}
	}
	if includeApi {
		if err := generateTemplate("docs/engineering/api-contract-design.md.tpl", filepath.Join(*outputDir, "docs/engineering/api-contract-design.md"), replacements); err != nil {
			fmt.Println(color("错误: "+err.Error(), red))
			os.Exit(1)
		}
	}
	if includeMonorepo {
		if err := generateTemplate("docs/engineering/monorepo-config.md.tpl", filepath.Join(*outputDir, "docs/engineering/monorepo-config.md"), replacements); err != nil {
			fmt.Println(color("错误: "+err.Error(), red))
			os.Exit(1)
		}
	}
	if includeTesting {
		if err := generateTemplate("docs/engineering/testing.md.tpl", filepath.Join(*outputDir, "docs/engineering/testing.md"), replacements); err != nil {
			fmt.Println(color("错误: "+err.Error(), red))
			os.Exit(1)
		}
	}

	// Phase 模板
	phaseDst := filepath.Join(*outputDir, "docs", "phase", "phase1-"+phase1Keyword+".md")
	generateTemplate("docs/phase/phase-template.md.tpl", phaseDst, replacements)

	// 方法论文档
	if includeMethodology {
		if err := generateTemplate(
			"docs/research/ai-engineering-practice-guide.md",
			filepath.Join(*outputDir, "docs/research/ai-engineering-practice-guide.md"),
			replacements,
		); err != nil {
			fmt.Println(color("错误: "+err.Error(), red))
			os.Exit(1)
		}
	}

	// ── 输出摘要 ──────────────────────────────────────────────────────────────

	fmt.Println()
	fmt.Println(color("═══════════════════════════════════════════════", green))
	fmt.Println(color("  生成完成！", green))
	fmt.Println(color("═══════════════════════════════════════════════", green))
	fmt.Println()
	fmt.Printf("  项目：%s\n", color(projectName, white))
	fmt.Printf("  技术栈：%s\n", color(techStackSummary, white))
	fmt.Println()
	fmt.Println(color("  生成的文档：", white))
	fmt.Println(color("    docs/README.md              (导航索引)", gray))
	fmt.Println(color("    docs/CONVENTIONS.md         (文档规范)", gray))
	fmt.Println(color("    docs/documentation-design.md (文档体系设计)", gray))
	fmt.Println(color("    docs/product-design.md      (产品设计)", gray))
	fmt.Println(color("    docs/tech-design.md         (技术架构)", gray))
	fmt.Println(color("    docs/changes/README.md      (变更计划索引)", gray))
	fmt.Println(color("    docs/adr/README.md          (架构决策索引)", gray))
	fmt.Println(color("    docs/frontend/README.md     (前端文档索引)", gray))
	fmt.Println(color("    docs/engineering/README.md  (工程文档索引)", gray))
	if includeFrontend {
		fmt.Println(color("    docs/frontend/frontend-design.md (前端规范)", gray))
	}
	if includeApi {
		fmt.Println(color("    docs/engineering/api-contract-design.md (API 合约)", gray))
	}
	if includeMonorepo {
		fmt.Println(color("    docs/engineering/monorepo-config.md (Monorepo 配置)", gray))
	}
	if includeTesting {
		fmt.Println(color("    docs/engineering/testing.md (测试策略)", gray))
	}
	fmt.Println(color("    docs/phase/phase1-"+phase1Keyword+".md   (Phase 1 规格)", gray))
	if includeMethodology {
		fmt.Println(color("    docs/research/ai-engineering-practice-guide.md (方法论)", gray))
	}
	fmt.Println()
	fmt.Println(color("  下一步：", yellow))
	fmt.Println("    1. 填写 docs/product-design.md 中的占位符")
	fmt.Println("    2. 填写 docs/tech-design.md 中的技术选型")
	fmt.Println("    3. 按 README.md 的阅读顺序完善其他文档")
	fmt.Println()
}
