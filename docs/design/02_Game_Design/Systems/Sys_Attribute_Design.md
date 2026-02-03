---
title: 属性系统设计 (Attribute System Design)
version: 2.1.0
date: 2026-02-03
author: System Designer
status: Approved
---

# 属性系统设计 (Attribute System Design)

> **文档版本**：v2.1.0  
> **最后更新**：2026-02-03

---

## 📌 文档说明

本文档详细描述了《徒踪-V2.0》的属性系统设计。完整的属性系统设计请参考：

**主要参考文档**：
- [游戏设计文档（GDD）](../Core/GDD_Master.md) - 第2章2.6节：属性系统
- [休闲探索模式设计](../Modes/Mode_Casual.md) - 第二章：5属性管理系统
- [生存挑战模式设计](../Modes/Mode_Survival.md) - 第三章：6属性管理系统

本文档提供属性系统的快速参考和对比说明。

---

## 一、属性系统概述

### 1.1 双模式属性差异

《徒踪-V2.0》的两种模式使用不同的属性系统：

| 模式 | 属性数量 | 核心差异 | 设计理念 |
| --- | --- | --- | --- |
| **休闲探索模式** | 5属性 | 使用**心率**（运动强度） | 轻松管理，容错率高 |
| **生存挑战模式** | 6属性 | 使用**心智**（精神压力） | 硬核管理，容错率低 |

### 1.2 共同属性（5个）

两种模式都包含以下5个基础属性：

1. **体能（Stamina）**：体力值，归零死亡
2. **饥饿（Hunger）**：饥饿度，达100死亡
3. **口渴（Thirst）**：口渴度，达100死亡
4. **体温（Temperature）**：体温，过高/过低死亡
5. **心率（Heart Rate）**：心跳速度，过快死亡

---

## 二、休闲模式属性系统（5属性）

### 2.1 属性定义

**详细设计请参考**：[休闲探索模式设计 - 第二章](../Modes/Mode_Casual.md#二、5属性管理系统)

| 属性 | 取值范围 | 初始值 | 危险阈值 | 消耗速度 |
| --- | --- | --- | --- | --- |
| 体能 | 0-100 | 100 | <20 | 慢 |
| 饥饿 | 0-100 | 100 | <30 | 中 |
| 口渴 | 0-100 | 100 | <20 | 快 |
| 体温 | 35-39°C | 36.5°C | <35.5或>38.5 | 取决于天气 |
| 心率 | 60-150 bpm | 75 bpm | <50或>140 | 取决于活动 |

### 2.2 心率属性（休闲模式特有）

**设计理念**：反映运动强度，而非精神压力

**变化规则**：
- 消除卡牌：心率+2 bpm
- 连击：心率+5 bpm/次
- 休息：心率-10 bpm/秒（逐渐恢复到75）

**影响**：
- 心率>120：体能恢复-50%
- 心率>140：体能恢复停止，体能消耗+20%

---

## 三、生存模式属性系统（6属性）

### 3.1 属性定义

**详细设计请参考**：[GDD第4章4.3节](../Core/GDD_Master.md#4.3)

| 属性 | 正常范围 | 危险阈值 | 致命阈值 | 恢复方式 |
| --- | --- | --- | --- | --- |
| 体能 | 80-100 | <50 | =0 | 休息、食物 |
| 饥饿 | 0-20 | >50 | =100 | 食物 |
| 口渴 | 0-20 | >50 | =100 | 饮水 |
| 体温 | 36-37°C | <35°C或>39°C | <30°C或>42°C | 防寒/防暑装备 |
| 心率 | 60-100 | >120 | >150 | 休息、药物 |
| **心智** | 80-100 | <50 | =0 | 休息、娱乐 |

### 3.2 心智属性（生存模式特有）

**设计理念**：反映精神压力和决策能力

**变化规则**：
- 孤独：-5/小时
- 疲劳：-10/小时（体能<50时）
- 恐怖事件：-30（一次性）
- 队友死亡：-50（一次性）

**影响**：
- 心智<80：决策错误概率+10%
- 心智<50：决策错误概率+30%
- 心智<30：决策错误概率+50%
- 心智=0：精神崩溃死亡

---

## 四、属性相互影响

### 4.1 影响关系图

**详细关系图请参考**：[GDD第4章4.3.2节](../Core/GDD_Master.md#4.3.2)

**核心影响链**：
1. 饥饿/口渴 → 体能消耗 → 心率 → 游戏结果
2. 体温 → 体能消耗 → 心率 → 游戏结果
3. 心智 → 决策准确率 → 游戏结果（仅生存模式）

### 4.2 正反馈循环（危险）

```
体能下降 → 休息减少 → 饥饿/口渴增加 
    → 体能消耗增加 → 体能进一步下降
```

### 4.3 负反馈循环（安全）

```
休息 → 体能恢复 → 饥饿/口渴减少 
    → 体能消耗减少 → 体能进一步恢复
```

---

## 五、属性数据结构

### 5.1 休闲模式属性类

```gdscript
## 休闲模式属性数据类
class_name CasualStatsData
extends Resource

@export var stamina: float = 100.0       # 体能
@export var hunger: float = 100.0        # 饥饿（100=饱）
@export var thirst: float = 100.0        # 口渴（100=不渴）
@export var temperature: float = 36.5    # 体温（°C）
@export var heart_rate: int = 75         # 心率（bpm）

## 检查是否健康
func is_healthy() -> bool:
    return (stamina > 20 and
            hunger > 30 and
            thirst > 20 and
            temperature > 35.5 and temperature < 38.5 and
            heart_rate > 50 and heart_rate < 140)

## 获取状态
func get_status() -> String:
    if not is_healthy():
        return "WARNING"
    return "NORMAL"
```

### 5.2 生存模式属性类

```gdscript
## 生存模式属性数据类
class_name SurvivalStatsData
extends Resource

@export var stamina: float = 100.0       # 体能
@export var hunger: float = 0.0          # 饥饿（0=不饿，100=极度饥饿）
@export var thirst: float = 0.0          # 口渴（0=不渴，100=极度口渴）
@export var temperature: float = 36.5    # 体温（°C）
@export var heart_rate: int = 70         # 心率（bpm）
@export var mental: float = 100.0        # 心智（精神状态）

## 检查是否存活
func is_alive() -> bool:
    if stamina <= 0:
        return false
    if hunger >= 100:
        return false
    if thirst >= 100:
        return false
    if temperature < 30 or temperature > 42:
        return false
    if heart_rate > 150:
        return false
    if mental <= 0:
        return false
    return true

## 获取生存状态
func get_status() -> String:
    if not is_alive():
        return "DEAD"
    if stamina < 50 or hunger > 50 or thirst > 50:
        return "CRITICAL"
    if stamina < 80 or hunger > 20 or thirst > 20:
        return "WARNING"
    return "NORMAL"
```

---

## 六、属性管理器

### 6.1 PlayerStats单例

```gdscript
## 玩家属性管理器（全局单例）
extends Node

## 当前属性数据
var current_stats: Resource = null

## 属性变化信号
signal stats_changed(stat_name: String, old_value: float, new_value: float)
signal stats_warning(stat_name: String)
signal stats_critical(stat_name: String)

## 初始化
func _ready() -> void:
    # 根据当前模式初始化属性
    match ModeManager.current_mode:
        GameMode.MODE_CASUAL:
            current_stats = CasualStatsData.new()
        GameMode.MODE_SURVIVAL:
            current_stats = SurvivalStatsData.new()

## 更新属性
func update_stat(stat_name: String, delta: float) -> void:
    var old_value = current_stats.get(stat_name)
    current_stats.set(stat_name, old_value + delta)
    var new_value = current_stats.get(stat_name)
    
    stats_changed.emit(stat_name, old_value, new_value)
    
    # 检查警告
    check_warnings(stat_name, new_value)

## 检查警告
func check_warnings(stat_name: String, value: float) -> void:
    # 根据不同属性检查不同阈值
    match stat_name:
        "stamina":
            if value < 50:
                stats_warning.emit(stat_name)
            if value < 20:
                stats_critical.emit(stat_name)
        "hunger":
            if value < 30:  # 休闲模式
                stats_warning.emit(stat_name)
            if value > 50:  # 生存模式
                stats_warning.emit(stat_name)
        # ... 其他属性检查
```

---

## 七、属性UI显示

### 7.1 属性条组件

```gdscript
## 属性条显示组件
extends ProgressBar

@export var stat_name: String = "stamina"
@export var warning_threshold: float = 50.0
@export var critical_threshold: float = 20.0

func _ready() -> void:
    # 连接属性变化信号
    PlayerStats.stats_changed.connect(_on_stats_changed)
    update_display()

func update_display() -> void:
    var value = PlayerStats.current_stats.get(stat_name)
    self.value = value
    
    # 根据值更新颜色
    if value < critical_threshold:
        modulate = Color.RED
    elif value < warning_threshold:
        modulate = Color.ORANGE
    else:
        modulate = Color.GREEN

func _on_stats_changed(changed_stat: String, old_val: float, new_val: float) -> void:
    if changed_stat == stat_name:
        update_display()
        play_change_animation(new_val - old_val)
```

---

## 八、属性消耗公式

### 8.1 体能消耗

**详细公式请参考**：[GDD第6章6.1.2节](../Core/GDD_Master.md#612-体能消耗公式)

```
体能消耗 = 基础消耗 × 天气修正 × 装备修正 × 状态修正
```

### 8.2 饥饿增加

```
饥饿增加 = 基础增加 + 运动消耗 × 天气修正
```

### 8.3 体温变化

```
体温变化 = (环境温度 - 当前体温) × 隔热修正 × 时间修正 / 隔热系数
```

---

## 九、常见问题

### Q1：休闲模式和挑战模式的属性系统有什么区别？

**A**：主要区别在第5/6个属性：
- **休闲模式**：使用**心率**，反映运动强度
- **挑战模式**：使用**心智**，反映精神压力

其他4个属性（体能、饥饿、口渴、体温）两种模式都有，但数值范围和消耗速度不同。

### Q2：属性如何影响游戏？

**A**：属性影响：
- **体能**：归零立即死亡（挑战模式）或无法继续（休闲模式）
- **饥饿/口渴**：影响体能消耗速度
- **体温**：过高/过低影响体能和心率
- **心率**：过快影响体能恢复
- **心智**：影响决策准确率（仅挑战模式）

### Q3：如何有效管理属性？

**A**：管理策略：
1. **优先级**：体能 > 口渴 > 体温 > 饥饿 > 心率/心智
2. **预防性管理**：属性低于50%时就开始补充
3. **资源规划**：根据路线长度携带足够资源
4. **装备选择**：根据天气携带对应装备

---

## 十、技术实现要点

### 10.1 属性更新频率

- **实时更新**：每帧检查属性状态
- **定时消耗**：每秒/每回合消耗属性
- **事件触发**：特定事件立即影响属性

### 10.2 属性同步

**跨场景同步**：
- 使用全局单例PlayerStats
- 场景切换时自动保存
- 关卡结束时同步到存档

---

## 十一、相关文档

**详细设计请参考**：
- [游戏设计文档（GDD）](../Core/GDD_Master.md) - 第2章2.6节、第4章4.3节
- [休闲探索模式设计](../Modes/Mode_Casual.md) - 5属性系统
- [生存挑战模式设计](../Modes/Mode_Survival.md) - 6属性系统
- [数值平衡设计](Sys_Balance_Tech.md) - 属性消耗公式

---

**文档结束**

完整的属性系统设计（包括属性定义、消耗公式、相互影响等）请查阅上述参考文档。
