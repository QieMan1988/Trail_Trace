#```
---
title: 卡牌系统设计 (Card System Design)
version: 2.1.0
date: 2026-02-03
author: System Designer
status: Approved
---

# 卡牌系统设计 (Card System Design)

> **文档版本**：v2.1.0  
> **最后更新**：2026-02-03

---

## 📌 文档说明

本文档详细描述了《徒踪-V2.0》的卡牌系统设计。完整的卡牌系统设计请参考：

**主要参考文档**：
- [游戏设计文档（GDD）](../Core/GDD_Master.md) - 第2章2.3节：卡牌系统

本文档提供卡牌系统的快速参考和补充说明。

---

## 一、卡牌系统概述

### 1.1 核心定位

卡牌是《徒踪-V2.0》的核心游戏元素，承载了：
- **游戏玩法**：点击消除的基本单位
- **资源获取**：消除卡牌获得资源
- **文化传递**：照片卡附带文化知识
- **视觉表现**：游戏的主要视觉元素

### 1.2 双模式差异

| 维度 | 休闲探索模式 | 生存挑战模式 |
| --- | --- | --- |
| **视觉风格** | 彩绘铅笔画，色彩鲜明 | 写实风格，色调偏冷 |
| **卡牌内容** | 大湾区景观、文化、环保 | 真实物资、天气、危机 |
| **卡牌功能** | 得分和收集价值 | 直接关联生存属性 |
| **策略性** | 较弱，以视觉特效为主 | 较强，影响属性值 |

---

## 二、卡牌类型系统

### 2.1 卡牌类型枚举

```gdscript
## 卡牌类型
enum CardType {
    SCENERY,          # 风景卡
    ENVIRONMENT,      # 环境卡
    RESOURCE,         # 资源卡
    EQUIPMENT,        # 装备卡
    EVENT,            # 事件卡
    SPECIAL           # 特殊卡
}
```

### 2.2 卡牌稀有度

```gdscript
## 卡牌稀有度
enum CardRarity {
    COMMON,           # 普通（白色）
    RARE,             # 稀有（蓝色）
    EPIC,             # 珍贵（紫色）
    LEGENDARY         # 传奇（金色）
}
```

### 2.3 卡牌视觉规范

| 稀有度 | 边框 | 背景 | 特效 |
| --- | --- | --- | --- |
| 普通（白色） | 2px白色细边框 | 浅灰色渐变 | 无 |
| 稀有（蓝色） | 3px蓝色发光边框 | 浅蓝色渐变 | 轻微光晕 |
| 珍贵（紫色） | 3px紫色发光边框 | 浅紫色渐变 | 光晕+粒子 |
| 传奇（金色） | 4px金色发光边框 | 金黄色渐变 | 全屏闪光 |

---

## 三、卡牌数据结构

### 3.1 CardData类

**核心属性**：
- `id`: String - 卡牌唯一ID
- `name`: String - 卡牌名称
- `type`: CardType - 卡牌类型
- `rarity`: CardRarity - 稀有度
- `value`: int - 基础值（得分/属性值）
- `effect_data`: Dictionary - 效果数据

### 3.2 卡牌效果系统

**效果数据格式**：

```json
{
  "effect_data": {
    "stamina": -10,      // 体能消耗
    "eco_points": 20,    // 环保值获取
    "special_effect": "combo_boost"  // 特殊效果
  }
}
```

---

## 四、休闲模式卡牌

### 4.1 卡牌类型分布

| 卡牌类型 | 出现概率 | 主要作用 |
| --- | --- | --- |
| 地形卡 | 70% | 消除前进，消耗体能 |
| 资源卡 | 20% | 获得环保值、补给 |
| 照片卡 | 10% | 收集照片，文化知识 |

### 4.2 地形卡详细设计


| 地形类型 | 图标 | 体能消耗 | 出现概率 |
| --- | --- | --- | --- |
| 平地 | 🟩 | 3 | 25% |
| 缓坡 | 🟨 | 4 | 20% |
| 陡坡 | 🟧 | 5 | 15% |
| 台阶 | ⬜ | 4 | 15% |
| 乱石 | 🟫 | 5 | 10% |

---

## 五、生存模式卡牌

### 5.1 卡牌类型分布

| 卡牌类型 | 出现概率 | 主要作用 |
| --- | --- | --- |
| 资源卡 | 40% | 获得水、食物、药物 |
| 地形卡 | 35% | 消除前进，消耗属性 |
| 天气卡 | 15% | 触发天气变化 |
| 危机卡 | 10% | 触发危机事件 |

### 5.2 资源卡详细设计


| 资源类型 | 效果 | 出现概率 |
| --- | --- | --- |
| 水 | 口渴-30 | 15% |
| 食物 | 饥饿-20~40 | 15% |
| 药物 | 体能+20，副作用 | 5% |
| 装备 | 永久效果 | 5% |

---

## 六、卡牌生成系统

### 6.1 卡牌池生成算法

```gdscript
## 卡牌池生成器
class_name CardPoolGenerator
extends Node

## 生成卡牌池
static func generate_card_pool(mode: GameMode, level_data: LevelData) -> Array[CardData]:
    var pool: Array[CardData] = []
    var total_cards = level_data.card_count
    
    match mode:
        GameMode.MODE_CASUAL:
            pool = generate_casual_pool(total_cards)
        GameMode.MODE_SURVIVAL:
            pool = generate_survival_pool(total_cards)
    
    return pool

## 生成休闲模式卡牌池
static func generate_casual_pool(count: int) -> Array[CardData]:
    var pool: Array[CardData] = []
    
    # 地形卡70%
    var terrain_count = int(count * 0.7)
    for i in range(terrain_count):
        pool.append(CardDatabase.get_random_terrain_card())
    
    # 资源卡20%
    var resource_count = int(count * 0.2)
    for i in range(resource_count):
        pool.append(CardDatabase.get_random_resource_card())
    
    # 照片卡10%
    var photo_count = count - terrain_count - resource_count
    for i in range(photo_count):
        pool.append(CardDatabase.get_random_photo_card())
    
    return pool

## 生成生存模式卡牌池
static func generate_survival_pool(count: int) -> Array[CardData]:
    var pool: Array[CardData] = []
    
    # 资源卡40%
    var resource_count = int(count * 0.4)
    for i in range(resource_count):
        pool.append(CardDatabase.get_random_survival_resource())
    
    # 地形卡35%
    var terrain_count = int(count * 0.35)
    for i in range(terrain_count):
        pool.append(CardDatabase.get_random_terrain_card())
    
    # 天气卡15%
    var weather_count = int(count * 0.15)
    for i in range(weather_count):
        pool.append(CardDatabase.get_random_weather_card())
    
    # 危机卡10%
    var crisis_count = count - resource_count - terrain_count - weather_count
    for i in range(crisis_count):
        pool.append(CardDatabase.get_random_crisis_card())
    
    return pool
```

---

## 七、卡牌渲染系统

### 7.1 卡牌场景结构

```
Card.tscn
├── CardBackground (Sprite2D)      # 背景
├── CardBorder (Sprite2D)          # 边框
├── CardIcon (Sprite2D)            # 图标
├── CardName (Label)               # 名称
├── CardValue (Label)              # 数值
├── RarityEffect (GPUParticles2D)  # 稀有度特效
└── AnimationPlayer                # 动画播放器
```

### 7.2 卡牌动画

**动画列表**：
- `idle`：待机动画（轻微浮动）
- `highlight`：高亮动画（可消除时）
- `eliminate`：消除动画（缩小+淡出）
- `special`：特殊效果动画（稀有卡牌）

---

## 八、卡牌数据库

### 8.1 CardDatabase单例

```gdscript
## 卡牌数据库（全局单例）
extends Node

## 卡牌数据缓存
var card_data_cache: Dictionary = {}

## 初始化
func _ready() -> void:
    load_all_cards()

## 加载所有卡牌数据
func load_all_cards() -> void:
    var card_files = DirAccess.get_files_at("res://data/cards/")
    for file in card_files:
        if file.ends_with(".json"):
            var card_data = load_card_from_file(file)
            card_data_cache[card_data.id] = card_data

## 获取卡牌数据
func get_card(card_id: String) -> CardData:
    return card_data_cache.get(card_id, null)

## 获取随机卡牌
func get_random_card(type: CardType, rarity: CardRarity = CardRarity.COMMON) -> CardData:
    var filtered_cards = []
    for card in card_data_cache.values():
        if card.type == type and card.rarity == rarity:
            filtered_cards.append(card)
    
    if filtered_cards.is_empty():
        return null
    
    return filtered_cards[randi() % filtered_cards.size()]
```

---

## 九、常见问题

### Q1：卡牌数据存储在哪里？

**A**：卡牌数据存储在`res://data/cards/`目录下的JSON文件中，格式如下：

```json
{
  "id": "card_scenery_001",
  "name": "凤凰山顶",
  "type": "SCENERY",
  "rarity": "RARE",
  "description": "香港第二高峰，以云海日出闻名",
  "texture_path": "res://assets/textures/cards/scenery_001.png",
  "effect_data": {
    "eco_points": 20,
    "stamina": -5
  },
  "value": 15
}
```

### Q2：如何添加新卡牌？

**A**：步骤如下：
1. 在`res://data/cards/`创建新的JSON文件
2. 按照格式填写卡牌数据
3. 准备卡牌图标（80×110像素）
4. 重启游戏，CardDatabase会自动加载

### Q3：卡牌的稀有度如何影响游戏？

**A**：稀有度影响：
- **得分加成**：稀有+50%，珍贵+100%，传奇+200%
- **视觉效果**：更华丽的边框和特效
- **掉落概率**：稀有度越高，掉落概率越低
- **收集价值**：稀有卡牌提供更高的属性加成

---

## 十、开发建议

### 10.1 性能优化
//todo

### 10.2 扩展性设计

**预留接口**：
- 支持未来添加新卡牌类型
- 支持动态效果系统
- 支持卡牌升级系统

---

## 十一、相关文档

**详细设计请参考**：
- [游戏设计文档（GDD）](../Core/GDD_Master.md) - 第2章2.3节
- [休闲探索模式设计](../Modes/Mode_Casual.md) - 消除玩法与卡牌
- [生存挑战模式设计](../Modes/Mode_Survival.md) - 资源管理与卡牌
- [数值平衡与技术规范](Sys_Balance_Tech.md) - 卡牌掉落与数值

**文档结束**


