# 文档管理规范 (Document Management Standard)

**版本**: v1.0.0  
**日期**: 2026-02-03  
**状态**: 正式执行

---

## 1. 目录结构规范

项目文档统一存储于 `design` 目录下，采用以下层级结构：

```text
design/
├── 00_Index/               # 索引、指南、规范及归档
│   ├── Archive/            # 历史归档（仅读）
├── 01_Project_Management/  # 项目管理、计划、会议记录
│   ├── Reports/            # 评审报告、分析报告
├── 02_Game_Design/         # 游戏策划文档
│   ├── Core/               # 核心设计（GDD、架构）
│   ├── Modes/              # 模式专属设计
│   ├── Systems/            # 子系统详细设计
├── 03_Art_and_UI/          # 美术与界面规范
└── 04_Data_Config/         # 数据配置表（CSV/JSON）
```

## 2. 文件命名规范

采用 **英文 PascalCase** 或 **下划线命名法**，确保跨平台兼容性。

- **通用格式**: `[Category]_[Name]_[OptionalType].md`
- **示例**:
    - `GDD_Master.md` (核心设计)
    - `Sys_Economy_Design.md` (系统设计)
    - `PM_Execution_Plan.md` (项目管理)
    - `UI_UX_Spec.md` (UI规范)

## 3. 文档版本控制

所有 Markdown 文档必须在头部包含 **YAML Metadata**：

```markdown
---
title: 文档标题
version: 2.1.0
date: 2026-02-03
author: Game Designer
status: Draft | Review | Approved | Deprecated
---
```

## 4. 归档流程

1. **定版**: 确认内容无误，Status 改为 `Approved`。
2. **变更**: 每次重大修改需升级 Version (x.y.z)。
3. **废弃**: 旧版本文件移动至 `00_Index/Archive/`，并在文件名后追加 `_vX.X.X`。

## 5. 链接规范

- 使用 **相对路径** 进行文档间跳转。
- 禁止使用绝对路径（如 `D:\...`）。
- 引用格式: `[显示文本](../Folder/File.md)`

---
**执行人**: AI Assistant  
**审批**: User
