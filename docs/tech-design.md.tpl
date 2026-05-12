---
title: "技术架构"
type: design
status: planning
date: {{DATE}}
tags:
  - tech
  - architecture
description: |
  技术选型决策、模块职责、关键架构边界与阶段规格入口。
---

# {{PROJECT_NAME}} 技术架构

<!-- GUIDE: 本文档是技术决策的权威来源。AI 通过它理解代码库的组织方式和约束。 -->

> 技术栈：{{TECH_STACK_SUMMARY}}

---

## 一、技术约束与决策

<!-- GUIDE: 记录关键技术选型的约束条件和结论，帮助 AI 理解"为什么这么选" -->

| 约束 | 结论 |
|------|------|
| {{CONSTRAINT_1}} | {{DECISION_1}} |
| {{CONSTRAINT_2}} | {{DECISION_2}} |
| {{CONSTRAINT_3}} | {{DECISION_3}} |

**关键决策记录**：

- {{DECISION_REASON_1}}

---

## 二、完整技术栈

<!-- GUIDE: 列出项目使用的所有关键技术，按层次组织 -->

```
{{PROJECT_NAME}}/
{{WORKSPACE_STRUCTURE}}
```

| 层次 | 技术 | 说明 |
|------|------|------|
| **后端框架** | {{BACKEND_FRAMEWORK}} | {{BACKEND_NOTE}} |
| **数据库** | {{DATABASE}} | {{DATABASE_NOTE}} |
| **前端框架** | {{FRONTEND_FRAMEWORK}} | {{FRONTEND_NOTE}} |
| **AI/LLM** | {{AI_SDK}} | {{AI_NOTE}} |

---

## 三、模块职责与依赖边界

<!-- GUIDE: 明确每个模块的职责边界和允许的依赖关系，这是 AI 辅助编码时最重要的约束 -->

### 模块清单

| 模块 | 职责 | 可依赖 | 不可依赖 |
|------|------|--------|----------|
| {{MODULE_1}} | {{MODULE_1_DESC}} | {{MODULE_1_DEPS}} | {{MODULE_1_ANTI_DEPS}} |
| {{MODULE_2}} | {{MODULE_2_DESC}} | {{MODULE_2_DEPS}} | {{MODULE_2_ANTI_DEPS}} |

### 依赖规则

<!-- GUIDE: 用箭头表示允许的依赖方向 -->

```
{{DEPENDENCY_DIAGRAM}}
```

---

## 四、运行时配置

<!-- GUIDE: 环境变量、配置文件等运行时配置的管理方式 -->

| 配置项 | 说明 | 默认值 |
|--------|------|--------|
| {{CONFIG_1}} | {{CONFIG_1_DESC}} | {{CONFIG_1_DEFAULT}} |

---

## 五、阶段规格入口

<!-- GUIDE: 链接到各阶段的详细规格文档 -->

| Phase | 文档 | 状态 |
|-------|------|------|
| 1 | [Phase 1](./phase/phase1-{{PHASE1_KEYWORD}}.md) | 📋 待实施 |

---

## 六、详细设计文档索引

<!-- GUIDE: 链接到其他详细设计文档 -->

- [API 合约设计](./api-contract-design.md)
- [前端开发规范](./frontend-design.md)
- [Monorepo 配置指南](./monorepo-config.md)
