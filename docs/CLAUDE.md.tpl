# {{PROJECT_NAME}} Agent Guide

## 项目定位

{{ONE_LINE_TAGLINE}}

当前默认阶段：Phase 1 · {{PHASE1_KEYWORD}} — {{PHASE1_DESCRIPTION}}

## 文档导航

进入任务前，优先按下面顺序找权威来源：

1. 产品范围、目标和能力：`docs/product-design.md`
2. 技术边界和模块职责：`docs/tech-design.md`
3. 当前阶段交付：`docs/phase/phase1-{{PHASE1_KEYWORD}}.md`
4. 局部优化计划：`docs/changes/README.md`
5. 长期决策：`docs/adr/README.md`
6. 完整入口与阅读顺序：`docs/README.md`

## 工作规则

1. 重要意图必须进入 Repo；聊天记录不是长期记忆。
2. 先改文档，再做大范围实现，避免“边写边猜规格”。
3. 主线能力进 `phase/`，局部演化进 `changes/`，稳定规则进 `adr/`。
4. 顶层文件保持简短，详细规则写进 `docs/`。

## 任务切入建议

1. 新功能：先读 phase 文档，再读 product / tech 设计。
2. 已有机制优化：先找对应 change plan，没有就新建一个。
3. 架构争议：先查 ADR，没有再从 change plan 演化。

## 维护要求

- 新增或移动文档时，更新 `docs/README.md` 和相关子目录 README。
- 完成重要决策后，及时把对话结论沉淀为文档。
- 不要让根 README 或本文件膨胀成百科全书。