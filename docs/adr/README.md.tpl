---
title: "ADR 索引"
type: reference
status: active
date: {{DATE}}
description: |
  说明 {{PROJECT_NAME}} 中 ADR 的职责、命名方式与使用时机。
---

# ADR 索引

ADR（Architecture Decision Record）用于记录已经生效的长期决策。

## 什么时候写 ADR

适合写入 ADR 的情况：

1. 会影响多个模块的长期约束
2. 未来会被反复追问“为什么这么做”的选择
3. 已从局部变更演化为默认规则的决策

## 命名规范

文件名格式：`adr-0001-topic.md`

示例：

- `adr-0001-docs-layering.md`
- `adr-0002-api-contract-source-of-truth.md`

## 推荐结构

1. 背景（Context）
2. 决策（Decision）
3. 影响（Consequences）
4. 备选方案（Alternatives Considered）

## 维护规则

1. ADR 一旦生效，应保持稳定，只在必要时新增后续 ADR 修正。
2. 不要把临时讨论记录直接当 ADR。
3. 若 Phase 或 Change Plan 里出现长期规则，应提炼到 ADR。