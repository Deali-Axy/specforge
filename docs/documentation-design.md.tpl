---
title: "文档体系设计"
type: design
status: active
date: {{DATE}}
description: |
  说明 {{PROJECT_NAME}} 的 docs 分层原则、入口设计与关注域收纳规则，
  让 AI 与团队成员能快速定位权威文档。
---

# 文档体系设计

## 一、为什么需要分层

文档的目标不是“写得越多越好”，而是让 AI 和团队在进入任务时能快速找到正确入口。

如果把所有内容都堆在顶层，会出现三个问题：

1. 默认阅读路径过长，AI 容易分散注意力。
2. 主线规格、局部优化、长期决策混在一起，难以判断该修改哪一层。
3. 聊天中形成的重要结论没有稳定归档位置，容易丢失。

## 二、设计依据

### 2.1 Spec-Driven Development with AI

SDD with AI 强调将开发拆成 Specify → Plan → Tasks → Implement。对应到 docs，意味着不同文档承载不同阶段的工程制品，而不是所有文档都叫 spec。

### 2.2 Harness Engineering

Harness Engineering 提供三条直接影响文档结构的原则：

1. Repository as System of Record
2. Plans as First-Class Artifacts
3. Progressive Disclosure

也就是说：

1. 设计意图必须进入 Repo。
2. 局部变更计划不能只停留在对话里。
3. 入口文档应短而稳定，深层内容按需展开。

### 2.3 ADR

ADR 用于沉淀已经稳定下来的长期约束，避免重要规则永远停留在 phase 文档或临时变更计划中。

## 三、目标结构

```text
docs/
├── README.md                    # 文档总导航，默认阅读入口
├── CONVENTIONS.md               # 文档治理规则与命名规范
├── documentation-design.md      # 文档体系设计与理论依据
├── product-design.md            # 产品权威来源
├── tech-design.md               # 技术选型与架构边界
├── frontend/                    # 前端契约（按需启用）
├── engineering/                 # API / 测试 / Monorepo 工程契约（按需启用）
├── phase/                       # 主线阶段规格
├── changes/
│   ├── README.md                # Change Plans 索引与使用规则
│   ├── active/                  # 正在推进的局部变更计划
│   └── completed/               # 已完成的局部变更计划
├── adr/
│   └── README.md                # ADR 索引与使用规则
└── research/                    # 调研与背景材料
```

## 四、各层职责

### 4.1 顶层设计文档

用于记录长期稳定的系统级真相：

1. 产品定位与核心能力
2. 技术选型与架构边界
3. 文档体系本身的规则

### 4.2 Phase 文档

`phase/` 只承载主线阶段规格。它回答“这个里程碑要交付什么，以及按什么顺序落地”。

### 4.3 Change Plans

`changes/` 承载不适合提升为新 Phase、但值得追踪的局部演化，例如：

1. 检索策略优化
2. Prompt / tool loop 调整
3. 小范围机制重构

### 4.4 ADR

`adr/` 承载已经稳定的长期决策，例如：

1. 约束规则
2. 分层原则
3. 默认架构选择

### 4.5 关注域子目录

当某类文档只服务于一个明确关注域，并且数量增长到会干扰顶层导航时，应收纳到二级目录，并通过该目录下的 `README.md` 提供二级入口。

推荐做法：

1. `frontend/`：承载前端架构、页面接入、前端测试等文档
2. `engineering/`：承载 API 合约、测试体系、Monorepo 配置等工程契约

## 五、使用规则

1. 调整 docs 结构前，先更新本文档，再改目录与索引。
2. 顶层只保留默认入口必须知道的文档。
3. 新增文档时，优先判断它属于顶层、phase、changes、adr，还是某个关注域子目录。