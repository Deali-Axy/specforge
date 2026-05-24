---
title: "前端测试计划"
type: reference
status: planning
date: {{DATE}}
tags:
  - frontend
  - testing
description: |
  前端测试的落地计划：页面级集成测试、组件测试、E2E 与 Mock 策略。
---

# 前端测试计划

本文档聚焦前端关注域，不重复整个项目的测试哲学。整体测试分层与运行方式请先看 [`../engineering/testing.md`](../engineering/testing.md)。

## 一、目标

前端测试的重点不是“测所有细节”，而是覆盖最容易回归的用户路径：

1. 页面级数据加载与交互
2. 关键组件状态切换
3. 路由与布局装配
4. 关键跨页面流程

## 二、推荐分层

| 层级 | 覆盖对象 | 工具建议 |
|------|----------|----------|
| 组件测试 | 交互复杂但边界清晰的组件 | Vitest + Testing Library |
| 页面集成测试 | 页面加载、查询、提交、错误态 | Vitest + Testing Library + MSW |
| E2E 测试 | 用户主流程与跨页面联动 | Playwright |

## 三、优先覆盖路径

1. 首屏加载是否正确呈现 loading / empty / success / error
2. 表单提交与校验错误提示
3. 列表筛选、分页、搜索、排序
4. 从列表跳详情、从详情返回或编辑

## 四、Mock 策略

- API 层优先在边界 mock，不直接 mock 组件内部实现。
- 页面测试优先 mock 网络请求或合约客户端，而不是 mock 每个子组件。
- E2E 测试只 mock 难以稳定复现的第三方依赖。

## 五、测试文件组织

```text
src/
├── features/
│   └── <feature>/
│       ├── components/
│       ├── pages/
│       └── __tests__/
└── test/
    ├── setup/
    ├── mocks/
    └── fixtures/
```

## 六、落地检查清单

- [ ] 是否先确认了这个页面最关键的用户路径
- [ ] 是否优先写页面级行为测试，而不是实现细节测试
- [ ] 是否避免对内部实现做过度 mock
- [ ] 是否把脆弱的测试数据收敛到 fixtures
- [ ] 是否给前端测试保留了独立运行命令