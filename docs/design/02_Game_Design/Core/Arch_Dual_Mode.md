# ---
title: 双模式架构设计 (Dual Mode Architecture)
version: 2.1.0
date: 2026-02-03
author: System Architect
status: Approved
---

# 双模式架构设计 (Dual Mode Architecture)

> **文档版本**：v2.1.0  
> **最后更新**：2026-02-03

---

## 一、架构概述

### 1.1 设计理念

《徒踪-V2.0》采用创新的**双模式架构**，将两种截然不同的游戏体验整合在同一个游戏框架中：

**休闲探索模式**（Casual Exploration Mode）

- 基于大湾区文化背景的轻松消除玩法
- 目标玩家：休闲玩家、文化爱好者、收集向玩家
- 核心乐趣：照片收集、文化探索、爽快消除

**生存挑战模式**（Survival Challenge Mode）

- 基于真实户外风险的硬核生存挑战
- 目标玩家：硬核玩家、策略向玩家、挑战爱好者
- 核心乐趣：资源管理、极限生存、风险决策

### 1.2 架构优势

**1. 扩大玩家覆盖面**

- 满足不同玩家群体需求
- 休闲玩家和硬核玩家都能找到适合的玩法

**2. 延长游戏生命周期**

- 两种模式提供不同体验
- 玩家可以根据心情选择模式

**3. 增强长期养成价值**

- 两种模式共享成长系统
- 在一个模式的投入可以惠及另一个模式

**4. 降低开发风险**

- 两种模式相对独立
- 一个模式的问题不会严重影响另一个

---

## 二、架构设计

### 2.1 核心架构图

```
                  《徒踪-V2.0》游戏
                        │
      ┌─────────────────┴─────────────────┐
      │                                   │
 休闲探索模式                      生存挑战模式
 (大湾区文化)                     (全国高风险路线)
      │                                   │
      │              共享层                │
      └─────────────────┬─────────────────┘
                        │
      ┌─────────────────┼─────────────────┐
      │                 │                 │
  货币系统          角色系统          装备系统
(环保值/爬升值)    (3个角色)       (通用+专属)
      │                 │                 │
      └─────────────────┼─────────────────┘
                        │
                    成就系统
```

### 2.2 模式独立性设计

**各模式独立的内容**：

| 系统 | 休闲探索模式 | 生存挑战模式 |
| --- | --- | --- |
| **核心玩法** | 卡牌消除、连击系统 | 属性管理、生存决策 |
| **路线设计** | 大湾区10条路线 | 全国10条高风险路线 |
| **关卡进度** | 独立进度系统 | 独立进度系统 |
| **难度曲线** | 轻松休闲，容错率高 | 硬核挑战，容错率低 |
| **UI风格** | 明亮温暖、文化气息 | 冷峻严肃、危机感 |

### 2.3 模式共享层设计

**两种模式共享的内容**：

| 系统 | 共享内容 | 共享原因 |
| --- | --- | --- |
| **货币系统** | 环保值、爬升值、徒步数 | 增强长期养成价值 |
| **角色系统** | 3个角色（探险家、摄影师、环保卫士） | 角色成长通用两种模式 |
| **装备系统** | 基础装备池 | 降低理解成本 |
| **成就系统** | 全部成就 | 跨模式挑战激励 |
| **照片卡收集** | 收集进度 | 收集系统的连续性 |

---

## 三、模式切换机制

### 3.1 切换时机

**允许切换**：

- ✅ 主界面（游戏大厅）
- ✅ 选择路线前
- ✅ 结算界面

**禁止切换**：

- ❌ 关卡进行中
- ❌ 商店界面
- ❌ 战斗/消除进行时

### 3.2 切换流程

```
玩家在主界面 → 点击模式切换按钮 
    ↓
显示模式选择界面
    ↓
┌───────────────────┬───────────────────┐
│  休闲探索模式      │  生存挑战模式      │
│  [预览图]         │  [预览图]         │
│  已通关: 3/10     │  已通关: 2/10     │
└───────────────────┴───────────────────┘
    ↓
确认选择 → 切换至对应模式主界面
```

### 3.3 切换确认机制

**首次切换**：

- 显示模式介绍和玩法说明
- 提示两种模式的差异
- 提供新手教程选项

**后续切换**：

- 直接切换，无需确认
- 显示该模式当前进度概况

---

## 四、数据继承规则

### 4.1 完全共享的数据

**货币与资源**：

- 环保值（Eco Points）
- 爬升值（Climbing Points）
- 徒步数（Hiking Distance）

**角色数据**：

- 角色等级
- 角色经验值
- 角色天赋解锁状态
- 角色属性点分配

**装备与道具**：

- 所有装备（基础+专属）
- 所有消耗品
- 装备升级等级
- 装备槽位解锁状态

**收集进度**：

- 照片卡收集进度（50张）
- 路线图鉴解锁状态

**成就系统**：

- 成就完成进度

### 4.2 独立的数据

**关卡进度**：

- 各模式路线通关进度独立
- 各模式星级评价独立
- 各模式最高纪录独立

**模式特定数据**：

- 休闲模式：连击最高纪录、照片卡获取记录
- 挑战模式：最长生存时间、极限挑战纪录

**临时数据**：

- 当前关卡状态
- 商店刷新状态
- 随机事件触发记录

### 4.3 数据转换规则

某些系统在不同模式下会有不同表现，但共享底层数据：

**装备系统**：

```jsx
// 基础装备：两种模式都能使用，效果相同
登山杖(Lv5)
  休闲模式: 负重+4.5kg, 乱石路消耗-22.5%
  挑战模式: 负重+4.5kg, 乱石路体能消耗-22.5%

// 专属装备：仅在对应模式生效
专业相机(摄影师专属)
  休闲模式: 照片卡获取概率+30%
  挑战模式: 无效果（但仍可携带）
```

**角色天赋**：

```jsx
// 角色天赋在两种模式都生效，但适配各自机制
探险家 - 经验丰富
  休闲模式: 地形卡穿越连击时间+1秒
  挑战模式: 地形体能消耗-10%
```

---

## 五、技术实现建议

### 5.1 Godot 4.6 架构设计

**模式管理器（ModeManager）**：

```
# 模式管理单例
class_name ModeManager extends Node

enum GameMode { CASUAL, SURVIVAL }

var current_mode: GameMode = GameMode.CASUAL
var mode_data: Dictionary = {}

# 模式切换
func switch_mode(new_mode: GameMode) -> void:
    # 保存当前模式数据
    save_mode_data(current_mode)
    
    # 切换模式
    current_mode = new_mode
    
    # 加载新模式数据
    load_mode_data(new_mode)
    
    # 触发模式切换信号
    mode_switched.emit(new_mode)

# 获取当前模式配置
func get_mode_config() -> Dictionary:
    match current_mode:
        GameMode.CASUAL:
            return CasualModeConfig.get_config()
        GameMode.SURVIVAL:
            return SurvivalModeConfig.get_config()
    return {}
```

### 5.2 数据存储结构

**存档数据结构**：

```json
{
  "player_data": {
    "currencies": {
      "eco_points": 5000,
      "climbing_points": 120,
      "hiking_distance": 15000
    },
    "characters": [
      {
        "id": "explorer",
        "level": 15,
        "exp": 8500,
        "talents_unlocked": ["quick_recovery", "explorer_intuition"]
      }
    ],
    "equipment": [
      {"id": "hiking_pole", "level": 5, "durability": 80}
    ],
    "photo_cards": {
      "collected": [1, 5, 8, 12, 15],
      "total": 50
    }
  },
  "casual_mode_data": {
    "routes_progress": {
      "phoenix_mountain": {"completed": true, "stars": 3},
      "dameisha": {"completed": false, "stars": 0}
    },
    "highest_combo": 68
  },
  "survival_mode_data": {
    "routes_progress": {
      "aotai_line": {"completed": true, "survival_days": 5},
      "langta": {"completed": false, "survival_days": 0}
    },
    "longest_survival": 8
  }
}
```

### 5.3 模式配置系统

**休闲模式配置（CasualModeConfig）**：

```
class_name CasualModeConfig extends Resource

static func get_config() -> Dictionary:
    return {
        "mode_name": "休闲探索模式",
        "routes": CasualRoutes.get_all_routes(),
        "card_system": {
            "photo_card_probability": 0.15,
            "eco_card_probability": 0.20,
            "resource_card_probability": 0.20
        },
        "combo_system": {
            "base_time_window": 3.0,
            "cross_layer_time_window": 5.0
        },
        "difficulty_multiplier": 1.0,
        "ui_theme": "casual_bright"
    }
```

**挑战模式配置（SurvivalModeConfig）**：

```
class_name SurvivalModeConfig extends Resource

static func get_config() -> Dictionary:
    return {
        "mode_name": "生存挑战模式",
        "routes": SurvivalRoutes.get_all_routes(),
        "attribute_system": {
            "stamina_max": 100,
            "hunger_max": 100,
            "thirst_max": 100,
            "temperature_range": [-20, 40],
            "heart_rate_range": [60, 180],
            "sanity_max": 100
        },
        "weather_system": {
            "extreme_weather_probability": 0.30
        },
        "difficulty_multiplier": 1.5,
        "ui_theme": "survival_dark"
    }
```

### 5.3 属性系统适配

**属性管理差异**：

```jsx
# 休闲探索模式属性系统（5属性）
class CasualAttributes:
    stamina: float      # 体能 (0-100)
    hunger: float       # 饥饿 (0-100)
    thirst: float       # 口渴 (0-100)
    temperature: float  # 体温 (36-40°C)
    heart_rate: int     # 心率 (60-180 bpm)

# 生存挑战模式属性系统（5属性）
class SurvivalAttributes:
    stamina: float      # 体能 (0-100)
    hunger: float       # 饥饿 (0-100)
    thirst: float       # 口渴 (0-100)
    temperature: float  # 体温 (32-42°C)
    sanity: float       # 心智 (0-100)
```

### 5.4 跨模式系统适配

**装备效果适配器**：

```
class_name EquipmentAdapter extends Node

# 根据当前模式返回装备效果
static func get_equipment_effect(equipment: Equipment, mode: GameMode) -> Dictionary:
    var base_effect = equipment.base_effect
    
    # 专属装备检查
    if equipment.exclusive_mode != null and equipment.exclusive_mode != mode:
        return {} # 专属装备在其他模式无效
    
    # 通用装备效果适配
    match mode:
        GameMode.CASUAL:
            return adapt_to_casual(base_effect)
        GameMode.SURVIVAL:
            return adapt_to_survival(base_effect)
    
    return base_effect

static func adapt_to_casual(effect: Dictionary) -> Dictionary:
    # 将属性消耗转换为连击时间加成等
    var adapted = effect.duplicate()
    if adapted.has("stamina_reduction"):
        adapted["combo_time_bonus"] = adapted["stamina_reduction"] * 0.1
    return adapted
```

---

## 六、平衡性考虑

### 6.1 模式间平衡

**时间投入产出比**：

- 休闲模式：单局10-15分钟，获得300-500环保值
- 挑战模式：单局20-30分钟，获得500-800环保值
- **目标**：时间效率相近，挑战模式回报略高

**难度与回报**：

- 休闲模式：容错率高（70%），适度奖励
- 挑战模式：容错率低（30%），高额奖励
- **目标**：鼓励玩家尝试挑战模式，但不强制

### 6.2 货币获取平衡

| 货币类型 | 休闲模式获取 | 挑战模式获取 | 平衡系数 |
| --- | --- | --- | --- |
| 环保值 | 300-500/局 | 500-800/局 | 1:1.6 |
| 爬升值 | 5-10/局 | 10-20/局 | 1:2.0 |
| 徒步数 | 1000-1500/局 | 1500-2500/局 | 1:1.7 |

### 6.3 成长曲线平衡

**角色升级**：

- 两种模式获得经验值共享
- 升级速度保持一致
- 天赋解锁在两种模式都有意义

**装备获取**：

- 基础装备获取难度相近
- 专属装备需要在对应模式完成特定挑战
- 避免某个模式成为"刷装备"模式

---

## 七、玩家引导策略

### 7.1 新手引导

**首次游戏**：

1. 默认进入休闲探索模式
2. 完成新手教程（3-5分钟）
3. 完成第1关后解锁模式切换
4. 提示可以尝试生存挑战模式

**模式切换引导**：

```
首次切换至挑战模式时：
┌──────────────────────────────────┐
│  欢迎来到生存挑战模式！            │
│                                  │
│  这里的挑战更加严峻：             │
│  • 需要管理6种生存属性            │
│  • 面对极端天气和真实风险         │
│  • 容错率较低，需要谨慎决策       │
│                                  │
│  但回报也更加丰厚：               │
│  • 更多的环保值和爬升值           │
│  • 解锁专属装备和成就            │
│                                  │
│  [开始新手教程] [直接开始]       │
└──────────────────────────────────┘
```

### 7.2 模式推荐系统

**智能推荐**：

- 根据玩家游玩时长推荐
- 新手玩家（<5小时）：推荐休闲模式
- 熟练玩家（5-20小时）：提示尝试挑战模式
- 资深玩家（>20小时）：两种模式轮换推荐

**每日任务引导**：

- 设置跨模式每日任务
- 例如："今日挑战：在任意模式完成3关"
- 鼓励玩家体验两种模式

---

## 八、扩展性设计

### 8.1 第三模式预留

架构支持未来添加第三种模式：

```
enum GameMode { 
    CASUAL,      # 休闲探索模式
    SURVIVAL,    # 生存挑战模式
    ENDLESS,     # 无尽模式（预留）
    MULTIPLAYER  # 多人模式（预留）
}
```

### 8.2 模式特殊事件

**限时模式**：

- 节日主题模式（春节、国庆等）
- 特殊挑战模式（速通、极限等）
- 使用相同的架构框架

### 8.3 跨模式联动

**赛季系统**：

- 赛季任务可能要求在两种模式都有进展
- 赛季奖励在两种模式通用

**成就展示**：

- 游戏内成就系统完整记录两种模式的进展
- 个人数据面板展示跨模式统计

---

## 九、常见问题（FAQ）

### Q1：玩家是否必须玩两种模式？

A：不强制。玩家可以只玩一种模式，但会错过另一种模式的专属内容和成就。

### Q2：两种模式的难度差异有多大？

A：休闲模式容错率70%，挑战模式容错率30%。挑战模式难度约为休闲模式的2-3倍。

### Q3：切换模式会丢失进度吗？

A：不会。货币、装备、角色等级等核心进度完全保留。只有关卡进度独立。

### Q4：能否同时进行两种模式？

A：不能同时进行，但可以随时在主界面切换。

### Q5：为什么不做成一个模式内的难度选择？

A：两种模式的核心玩法完全不同（消除 vs 生存），强行合并会影响各自的纯粹性。

---

## 十一、相关文档

**详细设计请参考**：
- [游戏设计文档（GDD）](GDD_Master.md) - 第2章
- [休闲探索模式设计](../Modes/Mode_Casual.md) - 休闲模式细节
- [生存挑战模式设计](../Modes/Mode_Survival.md) - 生存模式细节
- [属性系统设计](../Systems/Sys_Attribute_Design.md) - 属性管理
- [经济系统设计](../Systems/Sys_Economy_Design.md) - 经济共享

**文档结束**
