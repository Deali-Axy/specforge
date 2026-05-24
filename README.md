# specforge

为新项目一键生成完整的文档规格体系。

基于 iugam-memex 项目的实践经验，提取出可复用的文档模板，覆盖产品设计、技术架构、文档治理、Change Plans、ADR、API 契约、前端规范、测试策略等维度，配合 AI 辅助开发方法论，让项目从第一天就有清晰的规格骨架。

## 安装

### 从 Release 下载

从 [GitHub Release](https://github.com/Deali-Axy/specforge/releases) 下载对应平台的二进制文件。

### 从源码安装

```bash
go install github.com/Deali-Axy/specforge@latest
```

### 从源码构建

```bash
git clone https://github.com/Deali-Axy/specforge.git
cd specforge
task build          # 构建当前平台
task build-all      # 交叉编译所有平台
```

需要 [Task](https://taskfile.dev/)（`go install github.com/go-task/task/v3/cmd/task@latest`）。

## 使用

```bash
specforge
```

交互式填写项目信息和技术栈，工具会自动生成项目根入口文件 + 分层后的 `docs/` 目录结构：

```
README.md                         ← 仓库入口说明
CLAUDE.md                        ← AI / 团队开发导航

docs/
├── README.md                     ← 顶层导航索引
├── CONVENTIONS.md                ← 文档规范
├── documentation-design.md       ← 文档体系设计
├── product-design.md             ← 产品设计
├── tech-design.md                ← 技术架构
├── frontend/
│   ├── README.md                 ← 前端文档索引
│   ├── frontend-design.md        ← 前端规范（可选）
│   └── frontend-testing-plan.md  ← 前端测试计划（前端 + 测试时生成）
├── engineering/
│   ├── README.md                 ← 工程文档索引
│   ├── api-contract-design.md    ← API 合约（可选）
│   ├── monorepo-config.md        ← Monorepo 配置（可选）
│   └── testing.md                ← 测试策略（可选）
├── phase/
│   └── phase1-xxx.md             ← 阶段规格
├── changes/
│   ├── README.md                 ← 局部变更计划索引
│   ├── active/
│   └── completed/
├── adr/
│   ├── README.md                 ← ADR 索引
│   └── adr-0001-docs-layering.md ← 示例 ADR
└── research/
  └── ai-engineering-practice-guide.md  ← AI 工程方法论（可选）
```

指定输出目录：

```bash
specforge -o /path/to/your/project
```

### 交互流程示例

```
项目名称: MyProject
项目简述: 一个很棒的项目

── 技术栈配置 ──
后端框架: NestJS
前端框架: React
数据库: SQLite
AI/LLM SDK: Vercel AI SDK
是否使用 Monorepo？ [Y/n]:

── 可选文档模块 ──
  输入编号切换选中状态，直接回车确认。

  [x] 1. 前端开发规范        — 有前端应用时
  [x] 2. API 合约设计        — 有前后端分离 API 时
  [x] 3. Monorepo 配置指南   — 使用 monorepo 时
  [x] 4. 测试策略            — 需要测试规范时
  [x] 5. AI 工程实践指南     — AI 辅助开发方法论

  当前选择: 1,2,3,4,5 > 1,3    ← 输入编号切换，回车确认

Phase 1 关键词: scaffold
Phase 1 简述: 骨架搭建
```

## 模板清单

### 核心模板（每个项目都需要）

| 文件 | 说明 |
|------|------|
| `README.md` | 仓库入口说明，提供最短阅读路径与启动建议 |
| `CLAUDE.md` | AI / 团队开发导航，约束根入口职责与文档查找顺序 |
| `CONVENTIONS.md` | 文档命名规则与 YAML frontmatter 规范 |
| `docs/README.md` | 文档导航索引，AI 和团队的入口 |
| `documentation-design.md` | docs 分层原则、目录职责与收纳规则 |
| `product-design.md` | 产品设计：问题→定位→能力→领域模型→原则 |
| `tech-design.md` | 技术架构：选型→模块职责→架构边界 |
| `changes/README.md` | Change Plans 的使用规则与索引入口 |
| `adr/README.md` | ADR 的职责、命名方式与索引入口 |
| `adr/adr-0001-docs-layering.md` | 文档分层规则的示例 ADR |
| `frontend/README.md` | 前端关注域入口 |
| `engineering/README.md` | 工程关注域入口 |

### 可选模板（按项目需要选择）

| 文件 | 说明 | 何时需要 |
|------|------|----------|
| `frontend/frontend-design.md` | 前端开发契约 | 有前端应用时 |
| `frontend/frontend-testing-plan.md` | 前端测试计划 | 同时有前端和测试规范时 |
| `engineering/api-contract-design.md` | API 合约设计 | 有前后端分离 API 时 |
| `engineering/monorepo-config.md` | Monorepo 配置指南 | 使用 monorepo 时 |
| `engineering/testing.md` | 测试策略 | 需要测试规范时 |
| `phase/phase-template.md` | 阶段规格模板 | 按 Phase 规划开发时 |

### 方法论文档（直接复用）

| 文件 | 说明 |
|------|------|
| `research/ai-engineering-practice-guide.md` | 6 条核心原则 + 开发工作流 + 黄金原则 + 熵管理 |

## 文档体系设计思路

```
README.md / CLAUDE.md      ← 根入口：项目概览 + AI 导航
docs/
├── README.md              ← 入口：导航索引 + 阅读顺序
├── CONVENTIONS.md         ← 规范：文档治理规则
├── documentation-design.md ← 规则：docs 为什么这样分层
├── product-design.md      ← 灵魂：产品是什么、为什么做
├── tech-design.md         ← 骨架：技术怎么选、模块怎么分
├── frontend/              ← 前端关注域入口
├── engineering/           ← API / 测试 / Monorepo 关注域入口
├── phase/                 ← 执行：每个阶段要做什么
│   └── phase1-xxx.md
├── changes/               ← 局部变更计划
├── adr/                   ← 长期架构决策 + 示例 ADR
└── research/              ← 方法论：怎么用 AI 辅助开发
  └── ai-engineering-practice-guide.md
```

模板中使用 `{{PLACEHOLDER}}` 格式的占位符，工具会自动替换主要占位符。次要占位符（如 `{{PAIN_POINT_1}}`）需要手动填写。

## 技术实现

- Go 语言，使用 `//go:embed` 将模板文件嵌入二进制
- 单文件 ~2MB，零依赖
- 交叉编译支持 Windows / macOS / Linux

## 方法论来源

- **Spec-Driven Development with AI**（GitHub spec-kit）：先写规格，再实现
- **Harness Engineering**（OpenAI）：Agent-First 环境设计
- **iugam-memex 实践**：单人开发者 + AI 辅助的工程经验

## License

Apache License 2.0
