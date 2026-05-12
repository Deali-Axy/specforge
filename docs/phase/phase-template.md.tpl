---
title: "Phase {{PHASE_NUM}} · {{PHASE_KEYWORD}} — {{PHASE_TITLE}}"
phase: {{PHASE_NUM}}
keyword: {{PHASE_KEYWORD}}
status: planning
type: plan
date: {{DATE}}
notes: ""
prereqs: {{PREREQS}}
tags:
  - {{TAG_1}}
description: |
  {{PHASE_DESCRIPTION}}
---

# Phase {{PHASE_NUM}} · {{PHASE_KEYWORD}}

<!-- GUIDE: 每个 Phase 是一个可独立交付的功能单元。本文档定义该阶段的完整规格。 -->

## 一、目标

<!-- GUIDE: 这个 Phase 要达成的核心目标，1-3 句话 -->

{{PHASE_GOAL}}

## 二、功能范围

<!-- GUIDE: 这个 Phase 包含哪些功能，不包含哪些功能 -->

### 包含

- {{SCOPE_INCLUDE_1}}
- {{SCOPE_INCLUDE_2}}

### 不包含

- {{SCOPE_EXCLUDE_1}}

## 三、数据库设计

<!-- GUIDE: 这个 Phase 新增或修改的数据库表 -->

### 新增表

```sql
-- {{TABLE_NAME}}
CREATE TABLE {{TABLE_NAME}} (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  {{COLUMN_1}} {{TYPE_1}},
  {{COLUMN_2}} {{TYPE_2}},
  created_at TEXT DEFAULT CURRENT_TIMESTAMP
);
```

### 表变更

<!-- GUIDE: 对已有表的 ALTER 操作 -->

## 四、API 设计

<!-- GUIDE: 这个 Phase 新增的 API 端点 -->

### HTTP API

| 方法 | 路径 | 说明 |
|------|------|------|
| {{METHOD_1}} | {{PATH_1}} | {{API_DESC_1}} |

### 合约定义

```typescript
// {{CONTRACT_FILE}}
{{CONTRACT_CODE}}
```

## 五、前端页面

<!-- GUIDE: 这个 Phase 新增或修改的前端页面 -->

### 页面清单

| 页面 | 路由 | 说明 |
|------|------|------|
| {{PAGE_1}} | {{ROUTE_1}} | {{PAGE_DESC_1}} |

### 页面设计

<!-- GUIDE: 页面的布局、组件、交互描述 -->

## 六、里程碑

<!-- GUIDE: 将 Phase 拆分为可验证的小里程碑 -->

| # | 里程碑 | 验收标准 | 状态 |
|---|--------|----------|------|
| 1 | {{MILESTONE_1}} | {{ACCEPTANCE_1}} | 📋 待实施 |
| 2 | {{MILESTONE_2}} | {{ACCEPTANCE_2}} | 📋 待实施 |
| 3 | {{MILESTONE_3}} | {{ACCEPTANCE_3}} | 📋 待实施 |

## 七、测试计划

<!-- GUIDE: 这个 Phase 的测试覆盖目标 -->

| 测试类型 | 覆盖范围 | 测试文件 |
|----------|----------|----------|
| 单元测试 | {{UNIT_SCOPE}} | {{UNIT_FILE}} |
| 集成测试 | {{INTEGRATION_SCOPE}} | {{INTEGRATION_FILE}} |

## 八、风险与待定项

<!-- GUIDE: 已知风险和需要后续确认的事项 -->

- {{RISK_1}}
- {{OPEN_QUESTION_1}}
