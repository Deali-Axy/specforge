---
title: "文档命名与元数据规范"
type: reference
status: active
date: {{DATE}}
description: |
  {{PROJECT_NAME}} 文档库的统一命名规则与 YAML frontmatter 规范。
---

# 文档命名与元数据规范

本规范适用于 `docs/` 目录下的所有文档，包含文件命名规则和 YAML frontmatter 要求。

---

## 文件命名规则

### 1.1 通用规则

- 全部小写，单词之间用 `-` 连接（kebab-case）
- 不含日期前缀（日期写入 frontmatter `date` 字段）
- 不含项目名前缀
- 英文名称更推荐用于技术文档

**目录结构约定**

```
docs/
├── adr/                           # 架构决策记录（长期规则）
├── changes/                       # 局部变更计划（active/completed）
├── engineering/                   # API / 测试 / Monorepo 工程契约（按需启用）
├── frontend/                      # 前端契约（按需启用）
├── phase/                         # Phase 开发规格
│   ├── phase1-{keyword}.md        ✅ phase{n}-{keyword}
│   └── ...
├── research/                      # 背景调研归档，不列入 README 默认阅读路径
├── CONVENTIONS.md                 ✅ 全大写用于规范类顶层文档
├── README.md                      ✅ 当前开发文档索引
├── documentation-design.md        ✅ 文档体系设计
├── product-design.md              ✅ 产品设计文档
├── tech-design.md                 ✅ 技术架构文档
└── ...
```

### 1.2 Phase 文档（`docs/phase/`）

格式：`phase{n}-{keyword}.md`

- `n`：阶段序号（1, 2, 3…）
- `keyword`：该阶段核心交付物的英文关键词，简短（1–2 个单词），全小写

### 1.3 其他文档

| 类型 | 目录 | 命名模式 | 示例 |
|------|------|---------|------|
| 产品/技术设计 | `docs/` | `{topic}.md` 或 `{topic}-design.md` | `product-design.md` |
| 文档体系设计 | `docs/` | `documentation-design.md` | `documentation-design.md` |
| 前端契约 | `docs/frontend/` | `{topic}.md` 或 `{topic}-design.md` | `frontend-design.md` |
| 工程契约 | `docs/engineering/` | `{topic}-design.md` / `{topic}-config.md` / `{topic}.md` | `api-contract-design.md`、`testing.md` |
| Phase 规格 | `docs/phase/` | `phase{n}-{keyword}.md` | `phase1-scaffold.md` |
| Change Plan | `docs/changes/active/` 或 `docs/changes/completed/` | `{domain}-{topic}.md` | `chat-retrieval-optimization.md` |
| ADR | `docs/adr/` | `adr-{编号}-{topic}.md` | `adr-0001-docs-layering.md` |
| 规范/约定 | `docs/` | `CONVENTIONS.md`（全大写） | — |
| 调研归档 | `docs/research/` | `{topic}-research.md` | 不列入默认索引 |

> **不允许**：日期前缀（`2026-01-01-…`）、项目名前缀、下划线（`my_doc.md`）。

---

## YAML Frontmatter 规范

所有文档**必须**在文件开头包含 YAML frontmatter 块。

### 2.1 通用字段

```yaml
---
title: "文档标题"          # 必填
type: spec                 # 必填，见 §2.3
status: planning           # 必填，见 §2.4
date: {{DATE}}             # 必填，首次创建日期（ISO 8601）
tags:                      # 可选
  - tag1
  - tag2
description: |             # 可选但推荐
  这是文档的简要说明。
---
```

### 2.2 Phase 文档专属字段

```yaml
---
# 通用字段之外，phase 文档额外需要：
phase: 1                   # 必填，阶段序号
keyword: scaffold          # 必填，与文件名 keyword 一致
notes: "补充说明"          # 可选，当前状态备注
prereqs:                   # 可选，前置 phase 列表
  - phase1-scaffold
---
```

### 2.3 `type` 枚举值

| 值 | 用途 |
|----|------|
| `spec` | 开发规格，描述"要做什么、怎么做" |
| `plan` | 实施规划，描述"为什么这样做、任务拆解" |
| `design` | 产品/技术设计，偏决策与架构 |
| `research` | 调研与分析 |
| `roadmap` | 多阶段路线图 |
| `reference` | 规范、约定、速查表 |
| `archive` | 历史存档 |

### 2.4 `status` 枚举值

| 值 | 含义 |
|----|------|
| `planning` | 规划中 |
| `in-progress` | 进行中 |
| `completed` | 已完成 |
| `active` | 持续维护中（非 phase 类长期文档） |
| `deprecated` | 已废弃 |

### 2.5 `title` 格式约定

| 文档类型 | 格式 | 示例 |
|---------|------|------|
| Phase 文档 | `"Phase {n} · {Keyword} — {中文说明}"` | `"Phase 1 · Scaffold — 骨架搭建"` |
| 设计文档 | `"{主题}"` | `"产品设计"` |
| 规范文档 | 直接描述 | `"文档命名与元数据规范"` |

---

## 三、文档编写规范

- 新增、重命名或删除 `docs/` 中的文档时，至少同步检查 `docs/README.md`、所在子目录的 `README.md` 与交叉引用路径。
- `docs/README.md` 只列当前开发需要的活文档和 phase 规格；`docs/research/` 默认不列入 AI 阅读路径。
- 局部优化、机制调整、小范围重构优先进入 `docs/changes/`，不要直接塞进 Phase 主线规格。
- 已稳定的长期规则应沉淀到 `docs/adr/`，不要长期停留在聊天记录或 change plan 中。
- Phase 文档的 `notes` 字段要及时更新，反映当前阶段的实际状态。
- 文档内部的交叉引用使用规范文件名，不用带日期前缀的旧路径。
- 修改历史依靠 git，frontmatter 中不需要 `updated` 字段。
