---
title: "前端文档索引"
type: reference
status: active
date: {{DATE}}
description: |
  汇总 {{PROJECT_NAME}} 的前端开发契约与默认阅读路径。
---

# 前端文档索引

本目录只承载前端关注域文档。默认入口短而稳定，具体实现规则按需深入。

## 文档列表

| 文档 | 定位 | 什么时候读 |
|------|------|------------|
| [frontend-design.md](./frontend-design.md) | 前端契约 | 修改前端架构、路由、布局、状态管理、页面接入 |
{{FRONTEND_TESTING_PLAN_ROW}}

## 默认阅读顺序

1. 改前端结构或页面接入：先读 `frontend-design.md`
2. 再回到对应 phase 文档，看该功能的范围与完成定义
{{FRONTEND_TESTING_PLAN_ORDER}}