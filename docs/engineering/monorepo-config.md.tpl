---
title: "Monorepo 配置指南"
type: reference
status: planning
date: {{DATE}}
tags:
  - monorepo
  - {{MONOREPO_TOOL_TAG}}
description: |
  Workspace 配置契约：package 命名、workspace 引用、tsconfig 策略、
  scripts、exports、lint/format 与新增包检查清单。
---

# Monorepo 配置指南

<!-- GUIDE: 如果你的项目使用 monorepo，本文档是 workspace 配置的权威参考。 -->

本文档只管 workspace 配置，不重复技术架构。模块职责和依赖边界见 [`tech-design.md`](../tech-design.md)。

## 1. Workspace 命名

<!-- GUIDE: workspace 包的命名规则 -->

```json
{ "name": "@{{SCOPE}}/web" }
{ "name": "@{{SCOPE}}/api" }
{ "name": "@{{SCOPE}}/core" }
```

跨包依赖统一写：

```json
{
  "dependencies": {
    "@{{SCOPE}}/core": "workspace:*"
  }
}
```

## 2. Workspace 配置

<!-- GUIDE: monorepo 工具的 workspace 配置 -->

```yaml
# pnpm-workspace.yaml / turbo.json 等
{{WORKSPACE_CONFIG}}
```

新增 workspace 时确认：

- 目录位于约定的目录下
- package.json 名称符合命名规范
- 需要被其他包引用时，使用 `workspace:*`

## 3. TypeScript 配置策略

<!-- GUIDE: 不同类型包的 tsconfig 策略 -->

| 包类型 | tsconfig 策略 |
|--------|---------------|
| 应用（apps/*） | {{APPS_TSCONFIG}} |
| 库（packages/*） | {{PACKAGES_TSCONFIG}} |

## 4. Scripts 约定

<!-- GUIDE: 根级和包级 scripts 的命名约定 -->

| Script | 用途 |
|--------|------|
| `dev` | 本地开发 |
| `build` | 构建 |
| `test` | 测试 |
| `lint` | 代码检查 |

## 5. Exports 模式

<!-- GUIDE: packages 的 exports 字段规范 -->

```json
{
  "exports": {
    ".": {
      "types": "./src/index.ts",
      "import": "./src/index.ts"
    }
  }
}
```

## 6. 新增 Workspace 检查清单

<!-- GUIDE: 新增一个 workspace 时需要完成的所有步骤 -->

- [ ] 创建目录和 `package.json`
- [ ] 配置 `tsconfig.json`
- [ ] 更新 `pnpm-workspace.yaml`（如需要）
- [ ] 更新 turbo pipeline（如需要）
- [ ] 配置 exports（如需要被其他包引用）
- [ ] 运行 `pnpm install` 验证