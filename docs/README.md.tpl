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

<!-- GUIDE: 工程/前端子索引是默认导航入口；若项目最终不需要某个关注域，可在落地时删掉对应目录与此处入口。 -->

| 文档 | 类型 | 什么时候读 |
|------|------|------------|
| [产品设计](./product-design.md) | 产品设计 | 需要理解产品定位、核心能力、长期愿景 |
| [技术架构](./tech-design.md) | 技术设计 | 需要确认技术选型、模块职责、架构边界 |
| [文档体系设计](./documentation-design.md) | 文档设计 | 调整 docs 结构、理解 phase / changes / adr 分层时阅读 |
| [工程文档索引](./engineering/README.md) | 工程契约 | 查询 API 合约、测试体系、Monorepo 配置等工程文档 |
| [Change Plans 索引](./changes/README.md) | 变更规划 | 查询非主线局部优化、机制调整、局部重构计划 |
| [ADR 索引](./adr/README.md) | 决策记录 | 查询长期有效的架构与治理决策 |
| [前端文档索引](./frontend/README.md) | 前端契约 | 查询前端架构、页面接入与前端规范 |
| [文档规范](./CONVENTIONS.md) | 文档治理 | 新增、重命名、归档文档，或维护 frontmatter |

## Change Plans

<!-- GUIDE: 记录当前活跃的局部变更计划；没有时可暂留空表。 -->

| 文档 | 状态 | 定位 |
|------|------|------|
| {{CHANGE_PLAN_1}} | {{CHANGE_PLAN_1_STATUS}} | {{CHANGE_PLAN_1_DESC}} |

## ADR

<!-- GUIDE: 记录已经生效的长期架构决策。 -->

| 文档 | 状态 | 定位 |
|------|------|------|
| {{ADR_1}} | {{ADR_1_STATUS}} | {{ADR_1_DESC}} |

## Phase 规格

<!-- GUIDE: 按项目实际阶段填写，状态用 emoji 标记 -->

| 文档 | 状态 | 定位 |
|------|------|------|
| [Phase 1 · {{PHASE1_KEYWORD}}](./phase/phase1-{{PHASE1_KEYWORD}}.md) | 📋 待实施 | {{PHASE1_DESCRIPTION}} |

## 默认阅读顺序

<!-- GUIDE: 根据实际文档调整阅读路径；保持入口短而稳定。 -->

- 改产品范围：读 `product-design.md`，再读对应 phase 文档。
- 改前端：先读 `frontend/README.md`，再读对应 feature 的 phase 文档。
- 改后端、数据层或整体架构：读 `tech-design.md`，再读对应 phase 文档。
- 改 API、测试或 Monorepo 配置：先读 `engineering/README.md`，再读对应工程文档。
- 改已有能力但不属于新 Phase：读 `documentation-design.md`，再读相关 `changes/` 文档。
- 需要确认长期决策：读 `adr/README.md`，再读对应 ADR。
- 改文档结构：先读 `documentation-design.md`，再读 `CONVENTIONS.md`。

## 文档分层

```text
README.md
  ├─ documentation-design.md      # 文档体系设计与理论依据
  ├─ product-design.md             # 产品权威来源
  ├─ tech-design.md                # 技术选型与架构边界
  ├─ engineering/                  # API 合约、测试体系、Monorepo 配置
  ├─ frontend/                     # 前端开发契约
  ├─ CONVENTIONS.md                # 文档治理
  ├─ phase/*.md                    # 阶段规格与完成定义
  ├─ changes/                      # 局部变更计划（active/completed）
  └─ adr/                          # 长期架构决策记录

research/                           # 背景归档，不是默认实现规范
```

## 设计决策速查

<!-- GUIDE: 记录项目中的关键设计决策及其来源，便于 AI 和新人快速理解决策背景 -->

| 问题 | 当前结论 | 主要来源 |
|------|----------|----------|
| {{QUESTION_1}} | {{ANSWER_1}} | {{SOURCE_1}} |
