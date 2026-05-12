---
title: "前端开发规范"
type: guide
status: planning
date: {{DATE}}
tags:
  - frontend
  - {{FRONTEND_FRAMEWORK_TAG}}
description: |
  前端开发契约：架构边界、路由、布局、状态管理、常见任务流程。
  面向 AI Agent 与团队成员。
---

# 前端开发规范

<!-- GUIDE: 本文档是前端代码的"宪法"，AI 写前端代码时必须遵守这些规则。 -->

本文档只记录前端的开发契约：代码放哪里、边界怎么守、改完怎么验证。产品功能范围请读 phase 文档。

## 1. 必守边界

<!-- GUIDE: 列出前端架构中最容易被违反的规则 -->

- {{BOUNDARY_1}}
- {{BOUNDARY_2}}
- {{BOUNDARY_3}}

## 2. 关键路径

<!-- GUIDE: 列出前端项目中最关键的文件/目录及其职责 -->

| 路径 | 职责 |
|------|------|
| `src/` | 源代码根目录 |
| `src/routes/` | 路由定义 |
| `src/components/` | 通用组件 |
| `src/features/` | 业务功能模块 |
| `src/lib/` | 工具库和配置 |

## 3. 文件命名

<!-- GUIDE: 文件命名规则，保持一致性 -->

- {{NAMING_RULE_1}}
- {{NAMING_RULE_2}}

## 4. 路由

<!-- GUIDE: 路由系统的使用方式和约束 -->

{{ROUTING_DESCRIPTION}}

**路由结构**：

```
src/routes/
├── __root.tsx
├── index.tsx
└── ...
```

**规则**：

- {{ROUTING_RULE_1}}
- {{ROUTING_RULE_2}}

## 5. 状态管理

<!-- GUIDE: 前端状态管理的方式和规则 -->

**服务端状态**：{{SERVER_STATE_TOOL}} — {{SERVER_STATE_RULE}}

**客户端状态**：{{CLIENT_STATE_TOOL}} — {{CLIENT_STATE_RULE}}

## 6. 常见任务流程

<!-- GUIDE: 列出前端开发中最常见的任务及其标准操作步骤 -->

### 新增页面

1. 在 `features/<feature>/pages/` 创建页面组件
2. 在 `routes/` 创建路由文件
3. {{ADDITIONAL_STEP}}

### 新增 API 调用

1. {{API_STEP_1}}
2. {{API_STEP_2}}

## 7. 反模式

<!-- GUIDE: 列出常见的错误做法，AI 和开发者应该避免 -->

| 反模式 | 正确做法 |
|--------|----------|
| {{ANTI_PATTERN_1}} | {{CORRECT_1}} |
| {{ANTI_PATTERN_2}} | {{CORRECT_2}} |

## 8. 验证命令

<!-- GUIDE: 修改前端后应该运行的验证命令 -->

```bash
{{VERIFY_COMMAND_1}}
{{VERIFY_COMMAND_2}}
```
