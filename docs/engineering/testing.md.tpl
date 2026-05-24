---
title: "测试策略"
type: reference
status: planning
date: {{DATE}}
tags:
  - testing
  - strategy
description: |
  测试体系总览：测试金字塔、各层测试覆盖、运行方式、测试隔离策略。
---

# 测试策略

<!-- GUIDE: 本文档定义项目的测试方法论。AI 在写测试时应参考本文档的约定。 -->

## 一、测试金字塔

```
        ╱ E2E ╲
       ╱────────╲
      ╱ 集成测试  ╲
     ╱──────────────╲
    ╱    单元测试      ╲
   ╱────────────────────╲
```

| 层级 | 工具 | 覆盖目标 | 运行命令 |
|------|------|----------|----------|
| 单元测试 | {{UNIT_TEST_TOOL}} | {{UNIT_TEST_TARGET}} | `{{UNIT_TEST_CMD}}` |
| 集成测试 | {{INTEGRATION_TEST_TOOL}} | {{INTEGRATION_TEST_TARGET}} | `{{INTEGRATION_TEST_CMD}}` |
| E2E 测试 | {{E2E_TEST_TOOL}} | {{E2E_TEST_TARGET}} | `{{E2E_TEST_CMD}}` |

## 二、各层测试详情

<!-- GUIDE: 按模块列出测试覆盖情况 -->

### 后端测试

| 模块 | 测试文件 | 测试内容 |
|------|----------|----------|
| {{BACKEND_MODULE_1}} | {{BACKEND_TEST_FILE_1}} | {{BACKEND_TEST_DESC_1}} |

### 前端测试

| 模块 | 测试文件 | 测试内容 |
|------|----------|----------|
| {{FRONTEND_MODULE_1}} | {{FRONTEND_TEST_FILE_1}} | {{FRONTEND_TEST_DESC_1}} |

## 三、测试隔离策略

<!-- GUIDE: 如何确保测试之间不互相干扰 -->

- {{ISOLATION_STRATEGY_1}}
- {{ISOLATION_STRATEGY_2}}

## 四、测试数据管理

<!-- GUIDE: 测试数据的创建和清理方式 -->

{{TEST_DATA_MANAGEMENT}}

## 五、CI 集成

<!-- GUIDE: 测试在 CI 中的运行方式和门禁规则 -->

```yaml
# CI 配置示例
{{CI_CONFIG}}
```

**门禁规则**：

- {{CI_GATE_1}}
- {{CI_GATE_2}}

## 六、测试优先级

<!-- GUIDE: 按优先级排列的测试覆盖目标 -->

| 优先级 | 模块 | 目标覆盖率 |
|--------|------|-----------|
| P0 | {{P0_MODULE}} | {{P0_COVERAGE}} |
| P1 | {{P1_MODULE}} | {{P1_COVERAGE}} |
| P2 | {{P2_MODULE}} | {{P2_COVERAGE}} |