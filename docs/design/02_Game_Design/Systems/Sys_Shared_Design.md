# ---
title: 共享系统设计 (Shared System Design)
version: 2.1.0
date: 2026-02-03
author: System Designer
status: Approved
---

# 共享系统设计 (Shared System Design)

> **文档版本**：v2.1.0  
> **最后更新**：2026-02-03

---

## 一、角色系统

### 1.1 角色设计

《徒踪-V2.0》提供**3个可选角色**，每个角色有独特的天赋和属性加成，在两种模式都生效：

| 角色名称 | 定位 | 初始属性加成 | 核心天赋 |
| --- | --- | --- | --- |
| **探险家**
Explorer | 平衡型 | 体能上限+10
负重上限+2kg | 经验丰富：地形消耗-10% |
| **摄影师**
Photographer | 收集型 | 照片卡获取+20%
环保值获取+15% | 观察入微：照片卡稀有度提升 |
| **环保卫士**
Eco Guardian | 资源型 | 环保值获取+25%
道具效果+20% | 环保达人：环保行动奖励翻倍 |

### 1.2 角色解锁

**解锁方式**：

- 探险家：初始解锁
- 摄影师：通关任意模式3条路线
- 环保卫士：收集20张照片卡 或 使用100爬升值解锁

### 1.3 角色成长

**经验系统**：

- 通关获得经验：关卡层数×50（休闲）、路线距离×2（挑战）
- 升级需求：Level × 1000经验值
- 最高等级：50级

**属性点分配**：

- 每升1级获得3属性点
- 可分配属性：
    - 体能上限（+5/点）
    - 负重上限（+1kg/点）
    - 体能恢复速度（+5%/点）
    - 资源效率（道具效果+3%/点）

**天赋树**：

每个角色有独立的天赋树，包含15个天赋节点：

**探险家天赋树**：

```
                [经验丰富]
                地形消耗-10%
                    |
      +-------------+-------------+
      |                           |
[强健体魄]                   [轻装上阵]
体能上限+20                  负重不超限时移速+10%
      |                           |
[快速恢复]                   [持久耐力]
体能恢复+30%                 体能消耗-15%
```

**摄影师天赋树**：

```
                [观察入微]
              照片卡稀有度+1级
                    |
      +-------------+-------------+
      |                           |
[收藏家]                      [环保之眼]
照片卡获取+30%               环保卡出现率+50%
      |                           |
[完美主义]                   [资源嗅觉]
三星通关额外奖励+50%         补给卡出现率+40%
```

**环保卫士天赋树**：

```
               [环保达人]
             环保行动奖励×2
                    |
      +-------------+-------------+
      |                           |
[节约大师]                   [高效补给]
道具消耗-20%                 道具效果+30%
      |                           |
[绿色能量]                   [自然恩赐]
环保值获取+40%               自然恢复速度+50%
```

### 1.4 模式适配

角色天赋在不同模式有不同表现：

**探险家 - 经验丰富**：

- 休闲模式：地形卡消除时连击时间+1秒
- 挑战模式：地形体能消耗-10%

**摄影师 - 观察入微**：

- 休闲模式：照片卡稀有度+1级（普通→稀有，稀有→传说）
- 挑战模式：决策时显示更多信息（成功率、风险等级）

**环保卫士 - 环保达人**：

- 休闲模式：环保行动奖励×2
- 挑战模式：完成环保行动恢复心智+10

---

## 二、装备系统

### 2.1 装备分类

装备分为**基础装备**（两种模式通用）和**专属装备**（仅特定模式生效）：

#### 2.1.1 基础装备

| 装备名称 | 类型 | 效果 | 重量 |
| --- | --- | --- | --- |
| 登山杖 | 辅助 | 负重上限+3kg，地形消耗-15% | 0.5kg |
| 登山鞋 | 鞋类 | 陡坡/乱石消耗-20% | 1.0kg |
| 户外背包 | 背包 | 负重上限+8kg | 2.0kg |
| 冲锋衣 | 服装 | 体温下降-30%，防雨 | 0.7kg |
| 帐篷 | 装备 | 扎营必需 | 2.5kg |
| 睡袋 | 装备 | 扎营体能恢复+50% | 1.5kg |
| 头灯 | 工具 | 夜间行动无惩罚 | 0.1kg |
| GPS导航仪 | 工具 | 迷路概率-80% | 0.2kg |

#### 2.1.2 专属装备

**休闲模式专属**：

| 装备名称 | 效果 |
| --- | --- |
| 专业相机 | 照片卡获取概率+30% |
| 环保徽章 | 环保行动触发率+20% |
| 幸运手环 | 连击时间窗口+0.5秒 |

**挑战模式专属**：

| 装备名称 | 效果 |
| --- | --- |
| 羽绒服 | 极寒环境体温下降-50% |
| 冰爪 | 冰雪地形消耗-40% |
| 卫星电话 | 紧急时可呼叫救援（仅1次） |

### 2.2 装备品质

装备分为5个品质等级：

| 品质 | 颜色 | 基础效果 | 最高等级 |
| --- | --- | --- | --- |
| 普通 | 白色 | 100% | 3级 |
| 优良 | 绿色 | 120% | 4级 |
| 稀有 | 蓝色 | 150% | 5级 |
| 史诗 | 紫色 | 200% | 5级 |
| 传说 | 橙色 | 300% | 5级 |

### 2.3 装备升级

**升级系统**：

- 消耗徒步数和同类装备作为材料
- 每升1级效果+10%
- 升级成本：
    - 1→2级：1,000徒步数 + 1个同类装备
    - 2→3级：4,000徒步数 + 2个同类装备
    - 3→4级：9,000徒步数 + 3个同类装备
    - 4→5级：16,000徒步数 + 5个同类装备

**升级示例**：

```
登山杖 Lv1（稀有）
效果：负重+3kg，地形消耗-15%

↓ 升级至 Lv5

登山杖 Lv5（稀有）
效果：负重+4.5kg，地形消耗-22.5%
（基础效果×1.5×1.4 = 基础×2.1）
```

### 2.4 装备耐久

**耐久系统**：

- 所有装备初始耐久100%
- 使用中逐渐降低
- 耐久<50%：效果减半
- 耐久=0：装备损坏

**耐久消耗**：

- 休闲模式：每完成1关，装备耐久-2%
- 挑战模式：每前进10km，装备耐久-5%

**耐久修复**：

- 使用修复工具：恢复50%耐久（80环保值）
- 商店修理：恢复100%耐久（500-2000徒步数）

---

## 三、商店系统

### 3.1 商店类型

#### 3.1.1 游动商贩（关卡内）

**刷新机制**：

- 休闲模式：每层10%概率出现
- 挑战模式：每前进5km，15%概率出现

**商品类型**：

| 商品 | 价格 | 库存 |
| --- | --- | --- |
| 矿泉水（500ml） | 25环保值 | 5个 |
| 能量棒 | 30环保值 | 5个 |
| 急救喷雾 | 50环保值 | 3个 |
| 修复工具 | 80环保值 | 2个 |

#### 3.1.2 景区商店（关卡后）

**刷新机制**：

- 每次通关后刷新1次
- 商品随机生成

**商品类型**：

| 商品类别 | 价格区间 | 数量 |
| --- | --- | --- |
| 消耗品组合包 | 60-90环保值 | 3-5个 |
| 普通装备 | 150-250环保值 | 2-3个 |
| 稀有装备 | 400-600环保值 | 1-2个 |
| 照片卡包 | 100-500环保值 | 1-3个 |
| 经验书 | 150环保值 | 1-2个 |

**折扣系统**：

- 完美通关：9折
- 全照片卡收集：9折
- 全环保行动完成：8.5折
- 多条件叠加：最低7折

#### 3.1.3 局外商店（主界面）

**刷新机制**：

- 每周一自动刷新
- 手动刷新：10爬升值/次，每周最多3次

**商品类型**：

**永久提升**：

| 提升项目 | 价格 |
| --- | --- |
| 体能上限+10 | 20爬升值（递增+10） |
| 负重上限+2kg | 25爬升值（递增+15） |
| 装备槽+1 | 50/100/200爬升值 |

**稀有装备**：

| 品质 | 价格 | 库存 |
| --- | --- | --- |
| 稀有装备 | 50-70爬升值 | 每周5个 |
| 史诗装备 | 120-150爬升值 | 每周2个 |
| 传说装备宝箱 | 300爬升值 | 每月1个 |

### 3.2 动态价格

**价格调整**：

```
func get_dynamic_price(base_price: int, play_count: int) -> int:
    var multiplier = 1.0 + (play_count / 20) * 0.05
    return int(base_price * multiplier)

# 示例：玩家通关40次后
# 基础价格100 → 实际价格110
```

---

## 四、成就系统

### 4.1 成就分类

成就分为**通用成就**、**休闲成就**、**挑战成就**三类：

#### 4.1.1 通用成就

| 成就名称 | 条件 | 奖励 |
| --- | --- | --- |
| 初出茅庐 | 完成首个关卡 | 100环保值 |
| 徒步新手 | 累计徒步10km | 500徒步数 |
| 徒步达人 | 累计徒步100km | 10爬升值，5000徒步数 |
| 徒步大师 | 累计徒步500km | 50爬升值，传说装备×1 |
| 收藏家 | 收集25张照片卡 | 20爬升值 |
| 完美主义者 | 收集全部50张照片卡 | 100爬升值，专属称号 |
| 环保先锋 | 完成100次环保行动 | 30爬升值 |
| 装备大师 | 升级任意装备至5级 | 15爬升值 |

#### 4.1.2 休闲成就

| 成就名称 | 条件 | 奖励 |
| --- | --- | --- |
| 连击高手 | 单局连击50次 | 10爬升值 |
| 连击大师 | 单局连击100次 | 30爬升值 |
| 三星收集者 | 获得10个三星评价 | 20爬升值 |
| 完美旅程 | 全部路线三星通关 | 80爬升值，专属称号 |
| 环保卫士 | 单局完成5次环保行动 | 15爬升值 |

#### 4.1.3 挑战成就

| 成就名称 | 条件 | 奖励 |
| --- | --- | --- |
| 生存专家 | 单次路线生存7天以上 | 25爬升值 |
| 极限挑战 | 获得5个A级评价 | 40爬升值 |
| 钢铁意志 | 心智从未低于50完成路线 | 30爬升值 |
| 暴风雪幸存者 | 在暴风雪中生存并通关 | 35爬升值 |
| 巅峰征服者 | 通关全部10条高风险路线 | 100爬升值，专属称号 |

### 4.2 成就追踪

**进度显示**：

- 每个成就显示当前进度
- 接近完成时高亮提示
- 完成时弹窗庆祝

**成就奖励**：

- 自动发放到账户
- 部分成就解锁专属内容
- 称号可在个人资料展示

---

## 五、教程系统

### 5.1 新手教程

#### 5.1.1 休闲模式教程

**教程流程**（3-5分钟）：

1. **基础操作**（30秒）
    - 介绍卡牌消除机制
    - 演示3消和特殊消除
2. **属性管理**（1分钟）
    - 介绍5属性（体能、饥饿、口渴、体温、心率）
    - 演示道具使用
3. **连击系统**（1分钟）
    - 演示连击判定
    - 展示连击奖励
4. **特色系统**（2分钟）
    - 照片卡收集
    - 环保行动
    - 商店购买
5. **实战演练**（1分钟）
    - 完成简化版关卡
    - 获得新手奖励

#### 5.1.2 挑战模式教程

**教程流程**（5-7分钟）：

1. **核心差异**（1分钟）
    - 对比休闲模式
    - 介绍心智系统
2. **生存管理**（2分钟）
    - 5属性平衡策略
    - 资源分配技巧
3. **决策系统**（2分钟）
    - 演示路线选择
    - 天气应对策略
4. **扎营系统**（1分钟）
    - 扎营时机
    - 风险权衡
5. **实战演练**（2分钟）
    - 完成简化路线
    - 体验核心机制

### 5.2 进阶教程

**触发条件**：

- 通关5个关卡后解锁
- 玩家主动访问

**教程内容**：

1. **高级技巧**
    - 连击优化策略
    - 资源管理进阶
    - 装备搭配建议
2. **成就攻略**
    - 高难度成就提示
    - 隐藏内容解锁
3. **数值计算**
    - 伤害/消耗公式
    - 最优路线规划

### 5.3 提示系统

**情境提示**：

- 首次触发特定事件时显示提示
- 可在设置中关闭

**帮助按钮**：

- 任何界面都有"?"帮助按钮
- 点击显示当前界面说明

---

## 六、数据存储

### 6.1 存档结构

**本地存档**（JSON格式，AES加密）：

```json
{
  "version": "2.0.0",
  "player_profile": {
    "name": "玩家昵称",
    "selected_character": "explorer",
    "total_play_time": 36000,
    "creation_date": "2026-02-01"
  },
  "currencies": {
    "eco_points": 5000,
    "climbing_points": 120,
    "hiking_distance": 25000
  },
  "characters": [
    {
      "id": "explorer",
      "level": 15,
      "exp": 8500,
      "attribute_points": 5,
      "talents": ["quick_recovery", "durable"]
    }
  ],
  "equipment": [
    {
      "id": "hiking_pole",
      "quality": "rare",
      "level": 5,
      "durability": 85
    }
  ],
  "achievements": {
    "unlocked": ["first_step", "hiker_novice"],
    "progress": {
      "total_distance": 150000,
      "perfect_clears": 25
    }
  },
  "casual_mode": {
    "routes_progress": {
      "phoenix_mountain": {"completed": true, "stars": 3}
    },
    "highest_combo": 68,
    "photo_cards_collected": [1, 3, 5, 8, 12]
  },
  "survival_mode": {
    "routes_progress": {
      "aotai_line": {"completed": true, "grade": "B"}
    },
    "longest_survival": 8
  }
}
```

### 6.2 数据安全

**加密机制**：

```
func save_game_data(data: Dictionary) -> void:
    var json_str = JSON.stringify(data)
    var encrypted = encrypt_aes(json_str, encryption_key)
    var file = FileAccess.open(save_path, FileAccess.WRITE)
    file.store_string(encrypted)
    file.close()

func load_game_data() -> Dictionary:
    var file = FileAccess.open(save_path, FileAccess.READ)
    var encrypted = file.get_as_text()
    file.close()
    var json_str = decrypt_aes(encrypted, encryption_key)
    return JSON.parse_string(json_str)
```

**数据校验**：

- 关键数值范围检查
- 逻辑一致性验证
- 异常数据自动修正

---

## 七、常见问题（FAQ）

### Q1：角色是否可以切换？

A：可以。在主界面可以随时切换角色，但每个角色的等级和天赋是独立的。

### Q2：装备在两种模式通用吗？

A：基础装备完全通用。专属装备在对应模式生效，其他模式可携带但无效果。

### Q3：成就奖励会重复获得吗？

A：不会。每个成就只能获得1次奖励，但进度会持续追踪。

### Q4：存档会丢失吗？

A：存档有本地备份机制，每次保存会保留最近3个版本。

### Q5：新手教程可以跳过吗？

A：首次游玩建议完成，可以获得新手奖励。完成后可在设置中重新观看。

---

## 八、技术实现

### 8.1 角色管理器

```
class_name CharacterManager extends Node

var characters: Dictionary = {}
var current_character: Character = null

func unlock_character(character_id: String) -> void:
    if not characters.has(character_id):
        characters[character_id] = Character.new(character_id)
        character_unlocked.emit(character_id)

func switch_character(character_id: String) -> void:
    if characters.has(character_id):
        current_character = characters[character_id]
        character_switched.emit(character_id)

func add_exp(amount: int) -> void:
    current_character.add_exp(amount)
    if current_character.check_level_up():
        level_up.emit(current_character.level)
```

### 8.2 装备管理器

```
class_name EquipmentManager extends Node

var inventory: Array[Equipment] = []
var equipped: Dictionary = {}

func equip_item(equipment: Equipment, slot: String) -> bool:
    # 检查槽位
    if not is_slot_available(slot):
        return false
    
    # 卸下旧装备
    if equipped.has(slot):
        unequip_item(slot)
    
    # 装备新装备
    equipped[slot] = equipment
    equipment_changed.emit()
    return true

func get_total_weight() -> float:
    var total = 0.0
    for equipment in equipped.values():
        total += equipment.weight
    return total
```

### 8.3 成就管理器

```
class_name AchievementManager extends Node

var unlocked_achievements: Array[String] = []
var achievement_progress: Dictionary = {}

func check_achievement(achievement_id: String) -> void:
    if achievement_id in unlocked_achievements:
        return
    
    var achievement = AchievementDatabase.get_achievement(achievement_id)
    if achievement.check_condition(achievement_progress):
        unlock_achievement(achievement_id)

func unlock_achievement(achievement_id: String) -> void:
    unlocked_achievements.append(achievement_id)
    var achievement = AchievementDatabase.get_achievement(achievement_id)
    grant_rewards(achievement.rewards)
    achievement_unlocked.emit(achievement_id)
```

---

## 十、相关文档

**详细设计请参考**：
- [游戏设计文档（GDD）](../Core/GDD_Master.md) - 第2章2.8-2.10节
- [休闲探索模式设计](../Modes/Mode_Casual.md) - 共享系统适配
- [生存挑战模式设计](../Modes/Mode_Survival.md) - 共享系统适配
- [经济系统设计](Sys_Economy_Design.md) - 商店与交易
- [资源与货币技术实现](Sys_Economy_Tech.md) - 货币管理代码

**文档结束**
