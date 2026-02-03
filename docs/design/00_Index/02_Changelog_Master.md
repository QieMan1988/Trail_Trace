---
title: 项目变更日志 (Project Changelog)
version: 1.0.0
date: 2026-02-03
author: Project Manager
status: Approved
---

# 🔄 项目变更日志 (Project Changelog)

## v2.1.0 (2026-02-03)
**状态**: Approved  
**变更人**: Documentation Assistant

### 📝 文档重构
- **[GDD_Master.md]**: 
  - 升级版本至 v2.1.0。
  - 移除了冗余的 Chapter 7 UI/UX 细节，改为指向 `UI_UX_Spec.md` 的索引。
  - 更新了文档元数据 (YAML Header)。
- **[UI_UX_Spec.md]**:
  - 重命名自 `UI-UX设计规范.md`。
  - 合并了 `PC_UI_Layout_Blueprints.md` 的内容。
  - 增加了 YAML Header。
- **[00_Doc_Management_Standard.md]**:
  - 新增文件，定义了目录结构、命名规范和版本控制标准。

### 📂 目录结构调整
- 创建了 `00_Index`, `01_Project_Management/Reports`, `04_Data_Config` 目录。
- 归档了旧版本文档至 `00_Index/Archive`。
- 统一了文件名命名规范 (e.g., `Sys_Economy_Design.md`, `PM_Execution_Plan.md`).

### 🔧 系统/数据
- 集中了 `Config_Cards.csv` 和 `Config_Attributes.json` 到 `04_Data_Config`。
- 确认了 `CurrencyData` 类的 6 属性 + 3 货币的实现逻辑。

---

## v2.0.0 (2026-02-01)
**状态**: Legacy  
**变更人**: Team
- 项目启动，确定双模式架构。
- 完成 GDD 初稿。
