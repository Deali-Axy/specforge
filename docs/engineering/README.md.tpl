---
title: "工程文档索引"
type: reference
status: active
date: {{DATE}}
description: |
  汇总 {{PROJECT_NAME}} 的 API 合约、测试体系与 Monorepo 配置等工程契约。
---

# 工程文档索引

本目录承载 API、测试与工程配置等关注域文档。

## 文档列表

| 文档 | 定位 | 什么时候读 |
|------|------|------------|
| [api-contract-design.md](./api-contract-design.md) | API 合约设计 | 修改 HTTP API、前后端通信、类型安全合约 |
| [testing.md](./testing.md) | 测试策略 | 查看测试分层、运行方式与测试隔离策略 |
| [monorepo-config.md](./monorepo-config.md) | 工程配置契约 | 新增或调整 workspace、tsconfig、scripts、exports |

## 默认阅读顺序

1. 改 HTTP API：读 `api-contract-design.md`
2. 改测试：读 `testing.md`
3. 改 workspace 或构建配置：读 `monorepo-config.md`