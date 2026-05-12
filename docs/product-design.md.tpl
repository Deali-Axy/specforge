---
title: "产品设计"
type: design
status: planning
date: {{DATE}}
tags:
  - product
  - design
description: |
  核心产品文档：问题背景、产品定位、核心能力、领域模型、设计原则。
---

# {{PROJECT_NAME}} 产品设计

<!-- GUIDE: 本文档是项目的"灵魂"，AI 和团队成员通过它理解产品是什么、为什么做、做什么。请认真填写每一节。 -->

> **一句话定位**：{{ONE_LINE_TAGLINE}}

---

## 一、问题与背景

<!-- GUIDE: 描述你要解决的问题。越具体越好——谁在什么场景下遇到什么痛点？ -->

**目标用户**：{{TARGET_USER}}

**当前痛点**：

1. {{PAIN_POINT_1}}
2. {{PAIN_POINT_2}}
3. {{PAIN_POINT_3}}

**核心问题**：{{CORE_PROBLEM_STATEMENT}}

---

## 二、产品定位

<!-- GUIDE: 这个产品是什么、不是什么。帮助团队建立边界感。 -->

这是一个{{PRODUCT_TYPE}}。

它不是{{WHAT_IT_IS_NOT}}。

**核心差异化**：

- {{DIFFERENTIATOR_1}}
- {{DIFFERENTIATOR_2}}

---

## 三、核心能力

<!-- GUIDE: 列出产品的核心能力模块。每个能力包含：做什么、MVP 范围、后续演进方向。 -->

### 能力 1：{{CAPABILITY_1_NAME}}

**概述**：{{CAPABILITY_1_DESCRIPTION}}

**MVP 范围**：

- {{MVP_ITEM_1}}
- {{MVP_ITEM_2}}

**后续演进**：

- {{FUTURE_ITEM_1}}

### 能力 2：{{CAPABILITY_2_NAME}}

**概述**：{{CAPABILITY_2_DESCRIPTION}}

**MVP 范围**：

- {{MVP_ITEM_1}}

---

## 四、领域模型

<!-- GUIDE: 描述核心业务实体及其关系。这是数据库设计和 API 设计的基础。 -->

### 核心实体

| 实体 | 说明 | 关键字段 |
|------|------|----------|
| {{ENTITY_1}} | {{ENTITY_1_DESC}} | {{ENTITY_1_FIELDS}} |
| {{ENTITY_2}} | {{ENTITY_2_DESC}} | {{ENTITY_2_FIELDS}} |

### 实体关系

<!-- GUIDE: 用文字或简单 ASCII 图描述实体间的关系 -->

```
{{ENTITY_1}} 1──N {{ENTITY_2}}
{{ENTITY_2}} N──1 {{ENTITY_3}}
```

---

## 五、设计原则

<!-- GUIDE: 产品层面的约束和原则，指导后续所有技术决策和产品决策。 -->

1. **{{PRINCIPLE_1_NAME}}**：{{PRINCIPLE_1_DESCRIPTION}}
2. **{{PRINCIPLE_2_NAME}}**：{{PRINCIPLE_2_DESCRIPTION}}
3. **{{PRINCIPLE_3_NAME}}**：{{PRINCIPLE_3_DESCRIPTION}}

---

## 六、长期愿景

<!-- GUIDE: 产品 1-2 年后的理想状态。不需要很具体，但要有方向感。 -->

{{LONG_TERM_VISION}}
