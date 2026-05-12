---
title: "{{PROJECT_NAME}} 文档目录"
type: reference
status: active
date: {{DATE}}
description: |
  {{PROJECT_NAME}} 项目当前开发文档的总索引。只列默认需要读取的活文档；
  research/ 作为归档背景材料，不进入默认 AI 阅读路径。
---

# {{PROJECT_NAME}} 文档目录

本文档只维护当前开发需要的入口。`docs/research/` 内容默认不列入 AI/团队成员的任务阅读路径；除非任务明确要求调研背景，否则不要先读它们。

## 活文档

<!-- GUIDE: 根据项目实际启用的文档，保留对应行，删除不适用的行 -->

| 文档 | 类型 | 什么时候读 |
|------|------|------------|
| [产品设计](./product-design.md) | 产品设计 | 需要理解产品定位、核心能力、长期愿景 |
| [技术架构](./tech-design.md) | 技术设计 | 需要确认技术选型、模块职责、架构边界 |
| [API 合约设计](./api-contract-design.md) | 技术设计 | 修改 HTTP API、前后端通信、合约定义 |
| [前端开发规范](./frontend-design.md) | 前端开发契约 | 修改前端代码、路由、布局、状态管理 |
| [测试策略](./testing-strategy.md) | 测试参考 | 查看如何运行测试、各层测试覆盖内容 |
| [Monorepo 配置指南](./monorepo-config.md) | 工程配置契约 | 新增/调整 workspace、tsconfig、package scripts |
| [文档规范](./CONVENTIONS.md) | 文档治理 | 新增、重命名、归档文档，或维护 frontmatter |

## Phase 规格

<!-- GUIDE: 按项目实际阶段填写，状态用 emoji 标记 -->

| 文档 | 状态 | 定位 |
|------|------|------|
| [Phase 1 · {{PHASE1_KEYWORD}}](./phase/phase1-{{PHASE1_KEYWORD}}.md) | 📋 待实施 | {{PHASE1_DESCRIPTION}} |

## 默认阅读顺序

<!-- GUIDE: 根据实际文档调整阅读路径 -->

1. 改产品范围：读 `product-design.md`，再读对应 phase 文档。
2. 改前端：读 `frontend-design.md`，再读对应 feature 的 phase 文档。
3. 改后端、API 层：读 `tech-design.md`，再读对应 phase 文档。
4. 改 workspace 配置：读 `monorepo-config.md`。
5. 查看或扩展测试：读 `testing-strategy.md`。
6. 改文档结构：读 `CONVENTIONS.md`。

## 文档分层

```text
README.md
  ├─ product-design.md             # 产品权威来源
  ├─ tech-design.md                # 技术选型与架构边界
  ├─ api-contract-design.md        # HTTP 合约规范
  ├─ frontend-design.md            # 前端开发契约
  ├─ testing-strategy.md           # 测试体系
  ├─ monorepo-config.md            # workspace 配置契约
  ├─ CONVENTIONS.md                # 文档治理
  └─ phase/*.md                    # 阶段规格与完成定义

research/                           # 背景归档，不是默认实现规范
```

## 设计决策速查

<!-- GUIDE: 记录项目中的关键设计决策及其来源，便于 AI 和新人快速理解决策背景 -->

| 问题 | 当前结论 | 主要来源 |
|------|----------|----------|
| {{QUESTION_1}} | {{ANSWER_1}} | {{SOURCE_1}} |
