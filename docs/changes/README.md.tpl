---
title: "Change Plans 索引"
type: reference
status: active
date: {{DATE}}
description: |
  说明 {{PROJECT_NAME}} 中什么样的工作应进入 changes/，以及 active/completed 的使用方式。
---

# Change Plans 索引

`docs/changes/` 用来承载非主线 Phase 的局部变更计划。它适用于：

1. 值得追踪的局部优化
2. 小范围机制调整
3. 不足以升级为新 Phase，但不能只留在聊天记录里的改动

## 目录约定

```text
changes/
├── README.md
├── active/        # 正在推进的 change plan
└── completed/     # 已完成的 change plan
```

## 什么时候使用 changes/

适合进入 `changes/` 的情况：

1. 调整已有能力的工具路由、检索策略、Prompt、排序规则
2. 修正跨多个文件的机制性问题
3. 需要几轮实现和验证、值得保留背景的局部演化

不适合进入 `changes/` 的情况：

1. 全新主线阶段能力：应进入 `phase/`
2. 已经稳定的长期规则：应进入 `adr/`
3. 一次性很小的文字修正：直接改文档即可

## 维护规则

1. 新计划先放到 `active/`
2. 完成后移到 `completed/`
3. 如果某个 change plan 演化成长期默认规则，再补充对应 ADR