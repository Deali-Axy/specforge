# {{PROJECT_NAME}}

{{ONE_LINE_TAGLINE}}

## 当前状态

- 当前默认阶段：Phase 1 · {{PHASE1_KEYWORD}} — {{PHASE1_DESCRIPTION}}
- 技术栈摘要：{{TECH_STACK_SUMMARY}}

## 先读什么

1. 读 [CLAUDE.md](./CLAUDE.md)，了解 AI / 团队协作时的最小导航与约束。
2. 读 [docs/README.md](./docs/README.md)，进入完整文档体系。
3. 补齐 [docs/product-design.md](./docs/product-design.md) 和 [docs/tech-design.md](./docs/tech-design.md) 中的占位符。
4. 按当前阶段完善 [docs/phase/phase1-{{PHASE1_KEYWORD}}.md](./docs/phase/phase1-{{PHASE1_KEYWORD}}.md)。

## 仓库约定

- 根 README 只放项目概览和最短阅读路径，不承载详细实现规范。
- 具体设计与规则统一沉淀到 `docs/`。
- 当 AI 或团队讨论得出稳定结论时，应同步更新 Repo，而不是只留在聊天记录里。

## 建议的启动动作

1. 明确产品问题、目标用户和成功标准，写入 `docs/product-design.md`
2. 明确模块边界、技术选型和约束，写入 `docs/tech-design.md`
3. 确定当前最小可交付里程碑，拆到 phase 文档
4. 若出现局部机制优化但不值得新建 Phase，写入 `docs/changes/`

## 文档入口

- 完整文档导航：[docs/README.md](./docs/README.md)
- 文档分层设计：[docs/documentation-design.md](./docs/documentation-design.md)
- 文档命名规范：[docs/CONVENTIONS.md](./docs/CONVENTIONS.md)