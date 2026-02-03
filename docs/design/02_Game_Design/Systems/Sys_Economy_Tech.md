---
title: 资源与货币技术实现 (Economy Technical Spec)
version: 2.1.0
date: 2026-02-03
author: Tech Lead
status: Approved
---

# 资源与货币技术实现 (Economy Technical Spec)

> **文档版本**：v2.1.0  
> **最后更新**：2026-02-03


---

## 📌 文档说明

本文档是[经济系统设计](Sys_Economy_Design.md)的补充文档，详细描述了资源和货币的具体实现细节。

**建议阅读顺序**：
1. 先阅读[经济系统设计](Sys_Economy_Design.md)了解整体框架
2. 再阅读本文档了解实现细节

---

## 一、货币系统实现

### 1.1 货币数据结构

**CurrencyData类定义**：

```gdscript
## 货币数据类
class_name CurrencyData
extends Resource

## 三种货币
@export var eco_points: int = 0          # 环保值
@export var climbing_points: int = 0     # 爬升值
@export var hiking_distance: int = 0     # 徒步数

## 货币变化信号
signal currency_changed(currency_type: String, old_value: int, new_value: int)

## 增加货币
func add_currency(type: String, amount: int) -> void:
    var old_value = get_currency(type)
    
    match type:
        "eco":
            eco_points += amount
        "climbing":
            climbing_points += amount
        "hiking":
            hiking_distance += amount
    
    var new_value = get_currency(type)
    currency_changed.emit(type, old_value, new_value)

## 消耗货币
func spend_currency(type: String, amount: int) -> bool:
    if not has_enough(type, amount):
        return false
    
    add_currency(type, -amount)
    return true

## 检查货币是否足够
func has_enough(type: String, amount: int) -> bool:
    return get_currency(type) >= amount

## 获取货币数量
func get_currency(type: String) -> int:
    match type:
        "eco":
            return eco_points
        "climbing":
            return climbing_points
        "hiking":
            return hiking_distance
        _:
            return 0

## 转换为字典
func to_dict() -> Dictionary:
    return {
        "eco_points": eco_points,
        "climbing_points": climbing_points,
        "hiking_distance": hiking_distance
    }

## 从字典创建
static func from_dict(data: Dictionary) -> CurrencyData:
    var currency = CurrencyData.new()
    currency.eco_points = data.get("eco_points", 0)
    currency.climbing_points = data.get("climbing_points", 0)
    currency.hiking_distance = data.get("hiking_distance", 0)
    return currency
```

### 1.2 货币管理器

**CurrencyManager单例**：

```gdscript
## 货币管理器（全局单例）
extends Node

## 当前货币数据
var current_currency: CurrencyData = CurrencyData.new()

## 货币变化信号
signal currency_updated(type: String, amount: int)

## 初始化
func _ready() -> void:
    load_currency_data()

## 增加货币（带UI提示）
func add_currency_with_feedback(type: String, amount: int) -> void:
    current_currency.add_currency(type, amount)
    currency_updated.emit(type, amount)
    
    # 显示货币获得提示
    show_currency_gain_popup(type, amount)
    
    # 保存数据
    save_currency_data()

## 消耗货币（带确认）
func spend_currency_with_confirm(type: String, amount: int, item_name: String) -> bool:
    if not current_currency.has_enough(type, amount):
        show_insufficient_currency_popup(type, amount)
        return false
    
    # 显示确认对话框
    var confirmed = await show_purchase_confirm_dialog(item_name, type, amount)
    if not confirmed:
        return false
    
    # 扣除货币
    if current_currency.spend_currency(type, amount):
        currency_updated.emit(type, -amount)
        save_currency_data()
        return true
    
    return false

## 获取货币数量
func get_currency(type: String) -> int:
    return current_currency.get_currency(type)

## 保存货币数据
func save_currency_data() -> void:
    var save_data = current_currency.to_dict()
    SaveManager.save_currency(save_data)

## 加载货币数据
func load_currency_data() -> void:
    var save_data = SaveManager.load_currency()
    if save_data:
        current_currency = CurrencyData.from_dict(save_data)
```

---

## 二、资源系统实现

### 2.1 资源类型定义

**ResourceType枚举**：

```gdscript
## 资源类型
enum ResourceType {
    CONSUMABLE,      # 消耗品（水、食物、药物）
    EQUIPMENT,       # 装备（衣物、工具）
    PHOTO_CARD,      # 照片卡
    CULTURE_FRAGMENT # 文化碎片
}
```

### 2.2 资源数据结构

**ResourceData类定义**：

```gdscript
## 资源数据类
class_name ResourceData
extends Resource

@export var id: String                    # 资源ID
@export var name: String                  # 资源名称
@export var type: ResourceType            # 资源类型
@export var rarity: int = 1               # 稀有度（1-4）
@export var description: String           # 描述
@export var icon_path: String             # 图标路径
@export var effect_data: Dictionary       # 效果数据
@export var stack_size: int = 1           # 堆叠上限
@export var weight: float = 0.0           # 重量（kg）

## 使用资源
func use(player_stats: PlayerStats) -> Dictionary:
    var result = {
        "success": false,
        "message": "",
        "effects": {}
    }
    
    match type:
        ResourceType.CONSUMABLE:
            result = apply_consumable_effect(player_stats)
        ResourceType.EQUIPMENT:
            result = apply_equipment_effect(player_stats)
        ResourceType.PHOTO_CARD:
            result = collect_photo_card()
        ResourceType.CULTURE_FRAGMENT:
            result = collect_culture_fragment()
    
    return result

## 应用消耗品效果
func apply_consumable_effect(player_stats: PlayerStats) -> Dictionary:
    var effects = {}
    
    # 根据effect_data应用效果
    if effect_data.has("stamina"):
        player_stats.stamina += effect_data["stamina"]
        effects["stamina"] = effect_data["stamina"]
    
    if effect_data.has("hunger"):
        player_stats.hunger -= effect_data["hunger"]
        effects["hunger"] = -effect_data["hunger"]
    
    if effect_data.has("thirst"):
        player_stats.thirst -= effect_data["thirst"]
        effects["thirst"] = -effect_data["thirst"]
    
    return {
        "success": true,
        "message": "使用成功",
        "effects": effects
    }
```

### 2.3 背包系统

**InventorySystem类定义**：

```gdscript
## 背包系统
class_name InventorySystem
extends Node

## 背包容量
@export var capacity: int = 20

## 背包物品列表
var items: Array[InventoryItem] = []

## 背包变化信号
signal inventory_changed()
signal item_added(item: InventoryItem)
signal item_removed(item: InventoryItem)

## 背包物品类
class InventoryItem:
    var resource_data: ResourceData
    var quantity: int = 1
    
    func _init(p_resource: ResourceData, p_quantity: int = 1):
        resource_data = p_resource
        quantity = p_quantity

## 添加物品
func add_item(resource: ResourceData, quantity: int = 1) -> bool:
    # 检查是否可堆叠
    if resource.stack_size > 1:
        # 查找已有的同类物品
        for item in items:
            if item.resource_data.id == resource.id:
                # 检查堆叠上限
                if item.quantity + quantity <= resource.stack_size:
                    item.quantity += quantity
                    item_added.emit(item)
                    inventory_changed.emit()
                    return true
                else:
                    # 超过堆叠上限，创建新堆
                    var remaining = (item.quantity + quantity) - resource.stack_size
                    item.quantity = resource.stack_size
                    return add_item(resource, remaining)
    
    # 检查背包空间
    if items.size() >= capacity:
        return false
    
    # 添加新物品
    var new_item = InventoryItem.new(resource, quantity)
    items.append(new_item)
    item_added.emit(new_item)
    inventory_changed.emit()
    return true

## 移除物品
func remove_item(resource_id: String, quantity: int = 1) -> bool:
    for i in range(items.size()):
        if items[i].resource_data.id == resource_id:
            if items[i].quantity >= quantity:
                items[i].quantity -= quantity
                
                # 如果数量为0，移除物品
                if items[i].quantity <= 0:
                    var removed_item = items[i]
                    items.remove_at(i)
                    item_removed.emit(removed_item)
                
                inventory_changed.emit()
                return true
    
    return false

## 获取物品数量
func get_item_count(resource_id: String) -> int:
    for item in items:
        if item.resource_data.id == resource_id:
            return item.quantity
    return 0

## 检查是否有物品
func has_item(resource_id: String, quantity: int = 1) -> bool:
    return get_item_count(resource_id) >= quantity

## 获取背包总重量
func get_total_weight() -> float:
    var total = 0.0
    for item in items:
        total += item.resource_data.weight * item.quantity
    return total

## 获取背包使用率
func get_usage_rate() -> float:
    return float(items.size()) / float(capacity)
```

---

## 三、商店系统实现

### 3.1 商店数据结构

**ShopData类定义**：

```gdscript
## 商店数据类
class_name ShopData
extends Resource

## 商店类型
enum ShopType {
    WANDERING,    # 游动商贩（关卡内）
    SCENIC,       # 景区商店（关卡后）
    PERMANENT     # 局外商店（主界面）
}

@export var shop_type: ShopType
@export var products: Array[ShopProduct] = []
@export var refresh_cost: int = 50        # 刷新费用（环保值）
@export var max_refresh_count: int = 2   # 最大刷新次数

## 商店商品类
class ShopProduct:
    var resource_data: ResourceData
    var price: int
    var currency_type: String  # "eco", "climbing", "hiking"
    var stock: int = -1        # 库存（-1表示无限）
    var discount: float = 1.0  # 折扣（0.7-1.0）
    
    func get_final_price() -> int:
        return int(price * discount)
```

### 3.2 商店管理器

**ShopManager类定义**：

```gdscript
## 商店管理器
class_name ShopManager
extends Node

## 当前商店数据
var current_shop: ShopData = null

## 刷新次数
var refresh_count: int = 0

## 商店信号
signal shop_opened(shop_type: ShopData.ShopType)
signal shop_closed()
signal product_purchased(product: ShopData.ShopProduct)

## 打开商店
func open_shop(shop_type: ShopData.ShopType) -> void:
    current_shop = generate_shop(shop_type)
    refresh_count = 0
    shop_opened.emit(shop_type)

## 生成商店
func generate_shop(shop_type: ShopData.ShopType) -> ShopData:
    var shop = ShopData.new()
    shop.shop_type = shop_type
    
    match shop_type:
        ShopData.ShopType.WANDERING:
            shop.products = generate_wandering_products()
        ShopData.ShopType.SCENIC:
            shop.products = generate_scenic_products()
        ShopData.ShopType.PERMANENT:
            shop.products = generate_permanent_products()
    
    return shop

## 生成游动商贩商品
func generate_wandering_products() -> Array[ShopData.ShopProduct]:
    var products: Array[ShopData.ShopProduct] = []
    
    # 基础消耗品
    products.append(create_product("water", 25, "eco"))
    products.append(create_product("energy_bar", 30, "eco"))
    products.append(create_product("first_aid_spray", 50, "eco"))
    products.append(create_product("repair_tool", 80, "eco"))
    
    return products

## 生成景区商店商品
func generate_scenic_products() -> Array[ShopData.ShopProduct]:
    var products: Array[ShopData.ShopProduct] = []
    
    # 消耗品组合包
    products.append(create_product("consumable_pack", 60, "eco"))
    
    # 普通装备（2-3件随机）
    var equipment_pool = ["hiking_pole", "backpack", "water_bottle"]
    for i in range(2):
        var random_equipment = equipment_pool[randi() % equipment_pool.size()]
        products.append(create_product(random_equipment, 150 + randi() % 100, "eco"))
    
    # 照片卡包（1-2件）
    products.append(create_product("photo_card_pack_common", 100, "eco"))
    if randf() < 0.5:
        products.append(create_product("photo_card_pack_rare", 300, "eco"))
    
    return products

## 生成局外商店商品
func generate_permanent_products() -> Array[ShopData.ShopProduct]:
    var products: Array[ShopData.ShopProduct] = []
    
    # 稀有装备
    products.append(create_product("carbon_hiking_pole", 50, "climbing"))
    products.append(create_product("professional_boots", 60, "climbing"))
    products.append(create_product("outdoor_backpack", 70, "climbing"))
    
    # 史诗装备
    products.append(create_product("gps_navigator", 120, "climbing"))
    products.append(create_product("first_aid_kit", 150, "climbing"))
    
    # 传说装备宝箱
    products.append(create_product("legendary_equipment_box", 300, "climbing"))
    
    return products

## 创建商品
func create_product(resource_id: String, price: int, currency_type: String) -> ShopData.ShopProduct:
    var product = ShopData.ShopProduct.new()
    product.resource_data = ResourceDatabase.get_resource(resource_id)
    product.price = price
    product.currency_type = currency_type
    product.discount = calculate_discount()
    return product

## 计算折扣
func calculate_discount() -> float:
    var discount = 1.0
    
    # 完美通关折扣
    if PlayerProgress.has_perfect_clear():
        discount *= 0.9
    
    # 全照片卡收集折扣
    if PlayerProgress.get_photo_card_completion() >= 1.0:
        discount *= 0.9
    
    # 全环保行动折扣
    if PlayerProgress.has_all_eco_actions():
        discount *= 0.85
    
    # 最低7折
    return max(discount, 0.7)

## 购买商品
func purchase_product(product: ShopData.ShopProduct) -> bool:
    var final_price = product.get_final_price()
    
    # 检查货币
    if not CurrencyManager.has_enough(product.currency_type, final_price):
        return false
    
    # 扣除货币
    if not CurrencyManager.spend_currency(product.currency_type, final_price):
        return false
    
    # 添加到背包
    if not InventorySystem.add_item(product.resource_data):
        # 背包满了，退还货币
        CurrencyManager.add_currency(product.currency_type, final_price)
        return false
    
    # 减少库存
    if product.stock > 0:
        product.stock -= 1
    
    product_purchased.emit(product)
    return true

## 刷新商店
func refresh_shop() -> bool:
    if refresh_count >= current_shop.max_refresh_count:
        return false
    
    # 检查刷新费用
    if not CurrencyManager.has_enough("eco", current_shop.refresh_cost):
        return false
    
    # 扣除费用
    if not CurrencyManager.spend_currency("eco", current_shop.refresh_cost):
        return false
    
    # 重新生成商品
    current_shop.products = generate_shop_products(current_shop.shop_type)
    refresh_count += 1
    
    return true
```

---

## 四、货币获取实现

### 4.1 关卡奖励计算

**RewardCalculator类**：

```gdscript
## 奖励计算器
class_name RewardCalculator
extends Node

## 计算关卡奖励
static func calculate_level_reward(level_data: LevelData, performance: Dictionary) -> Dictionary:
    var reward = {
        "eco_points": 0,
        "climbing_points": 0,
        "hiking_distance": 0
    }
    
    # 基础奖励
    reward.eco_points += calculate_base_eco_reward(level_data)
    reward.climbing_points += calculate_base_climbing_reward(level_data)
    reward.hiking_distance += calculate_base_hiking_reward(level_data)
    
    # 表现奖励
    if performance.get("perfect_clear", false):
        reward.eco_points += 50
        reward.climbing_points += 5
    
    if performance.get("first_clear", false):
        reward.eco_points += 100
        reward.climbing_points += 10
        reward.hiking_distance += 2000
    
    if performance.get("three_star", false):
        reward.eco_points += 30
        reward.climbing_points += 3
    
    # 连击奖励
    var combo_count = performance.get("max_combo", 0)
    reward.eco_points += combo_count * 5
    
    return reward

## 计算基础环保值奖励
static func calculate_base_eco_reward(level_data: LevelData) -> int:
    var base = 50
    var layer_bonus = level_data.layer_count * 20
    return base + layer_bonus

## 计算基础爬升值奖励
static func calculate_base_climbing_reward(level_data: LevelData) -> int:
    return int(level_data.layer_count / 2.0)

## 计算基础徒步数奖励
static func calculate_base_hiking_reward(level_data: LevelData) -> int:
    var base = 100
    var layer_bonus = level_data.layer_count * 20
    return base + layer_bonus
```

### 4.2 奖励发放

**RewardDispenser类**：

```gdscript
## 奖励发放器
class_name RewardDispenser
extends Node

## 发放奖励
static func grant_reward(reward: Dictionary) -> void:
    # 发放环保值
    if reward.has("eco_points") and reward.eco_points > 0:
        CurrencyManager.add_currency_with_feedback("eco", reward.eco_points)
    
    # 发放爬升值
    if reward.has("climbing_points") and reward.climbing_points > 0:
        CurrencyManager.add_currency_with_feedback("climbing", reward.climbing_points)
    
    # 发放徒步数
    if reward.has("hiking_distance") and reward.hiking_distance > 0:
        CurrencyManager.add_currency_with_feedback("hiking", reward.hiking_distance)
    
    # 发放物品
    if reward.has("items"):
        for item_data in reward.items:
            InventorySystem.add_item(item_data.resource, item_data.quantity)
    
    # 显示奖励界面
    show_reward_screen(reward)

## 显示奖励界面
static func show_reward_screen(reward: Dictionary) -> void:
    var reward_ui = preload("res://scenes/ui/RewardScreen.tscn").instantiate()
    reward_ui.set_reward_data(reward)
    get_tree().current_scene.add_child(reward_ui)
```

---

## 五、数据持久化

### 5.1 货币存档

**货币存档格式**：

```json
{
  "currency": {
    "eco_points": 5000,
    "climbing_points": 120,
    "hiking_distance": 15000,
    "last_update": 1706860800
  }
}
```

### 5.2 背包存档

**背包存档格式**：

```json
{
  "inventory": {
    "capacity": 20,
    "items": [
      {
        "resource_id": "water",
        "quantity": 3
      },
      {
        "resource_id": "energy_bar",
        "quantity": 5
      },
      {
        "resource_id": "photo_card_001",
        "quantity": 1
      }
    ]
  }
}
```

---

## 六、UI显示

### 6.1 货币显示组件

**CurrencyDisplay组件**：

```gdscript
## 货币显示组件
extends HBoxContainer

@onready var eco_label = $EcoLabel
@onready var climbing_label = $ClimbingLabel
@onready var hiking_label = $HikingLabel

func _ready() -> void:
    # 连接货币变化信号
    CurrencyManager.currency_updated.connect(_on_currency_updated)
    
    # 初始显示
    update_display()

func update_display() -> void:
    eco_label.text = str(CurrencyManager.get_currency("eco"))
    climbing_label.text = str(CurrencyManager.get_currency("climbing"))
    hiking_label.text = str(CurrencyManager.get_currency("hiking"))

func _on_currency_updated(type: String, amount: int) -> void:
    update_display()
    
    # 播放货币变化动画
    play_currency_change_animation(type, amount)

func play_currency_change_animation(type: String, amount: int) -> void:
    var label = get_label_by_type(type)
    
    # 数字跳动动画
    var tween = create_tween()
    tween.tween_property(label, "scale", Vector2(1.2, 1.2), 0.1)
    tween.tween_property(label, "scale", Vector2(1.0, 1.0), 0.1)
    
    # 颜色闪烁
    if amount > 0:
        tween.tween_property(label, "modulate", Color.GREEN, 0.1)
    else:
        tween.tween_property(label, "modulate", Color.RED, 0.1)
    tween.tween_property(label, "modulate", Color.WHITE, 0.2)
```

---

## 七、平衡性监控

### 7.1 货币流动监控

**CurrencyAnalytics类**：

```gdscript
## 货币分析器
class_name CurrencyAnalytics
extends Node

## 货币流动记录
var currency_flow_log: Array[Dictionary] = []

## 记录货币变化
func log_currency_change(type: String, amount: int, source: String) -> void:
    var log_entry = {
        "timestamp": Time.get_unix_time_from_system(),
        "currency_type": type,
        "amount": amount,
        "source": source,
        "balance_after": CurrencyManager.get_currency(type)
    }
    
    currency_flow_log.append(log_entry)
    
    # 定期分析
    if currency_flow_log.size() % 100 == 0:
        analyze_currency_flow()

## 分析货币流动
func analyze_currency_flow() -> Dictionary:
    var analysis = {
        "eco_points": {"income": 0, "expense": 0},
        "climbing_points": {"income": 0, "expense": 0},
        "hiking_distance": {"income": 0, "expense": 0}
    }
    
    for log in currency_flow_log:
        var type = log.currency_type
        if log.amount > 0:
            analysis[type]["income"] += log.amount
        else:
            analysis[type]["expense"] += abs(log.amount)
    
    # 计算收支比
    for type in analysis.keys():
        var income = analysis[type]["income"]
        var expense = analysis[type]["expense"]
        analysis[type]["balance"] = income - expense
        analysis[type]["ratio"] = float(expense) / float(income) if income > 0 else 0.0
    
    return analysis
```

---

## 八、常见问题

### Q1：货币数据如何在两种模式间同步？

**A**：通过ModeManager的sync_shared_data()方法自动同步：
- 模式切换时自动同步
- 关卡通关后自动同步
- 游戏退出前自动同步

### Q2：如何防止玩家刷货币？

**A**：防刷机制：
- 首通奖励仅1次
- 商店刷新次数限制
- 本地存档加密
- 关键数据校验

### Q3：背包满了怎么办？

**A**：背包管理策略：
- 出售不需要的物品
- 使用消耗品释放空间
- 升级背包容量（消耗徒步数）
- 存入仓库（如果有）

---

## 九、开发建议

### 9.1 配置文件管理

建议将所有货币和资源数值放在配置文件中：

```json
{
  "currency_config": {
    "eco_points": {
      "casual_mode_base_reward": 50,
      "survival_mode_base_reward": 100,
      "layer_bonus": 20
    },
    "climbing_points": {
      "casual_mode_base_reward": 2,
      "survival_mode_base_reward": 5,
      "perfect_clear_bonus": 5
    }
  },
  "shop_config": {
    "wandering_shop_appearance_rate": 0.1,
    "scenic_shop_refresh_cost": 50,
    "permanent_shop_refresh_cost": 10
  }
}
```

### 9.2 测试建议

**单元测试**：
- 测试货币增加/减少
- 测试背包添加/移除
- 测试商店购买逻辑

**集成测试**：
- 测试完整的货币循环
- 测试跨模式数据同步
- 测试存档/读档

---

## 十、总结

资源与货币系统是游戏经济的基础，通过：
- **三货币体系**：满足不同层次需求
- **背包系统**：管理物品和资源
- **商店系统**：提供消费渠道
- **奖励系统**：激励玩家持续游玩

所有实现都应遵循[经济系统设计](经济系统设计%20de152292190d4a42abae3b641fee9513.md)文档的设计原则。

---

**相关文档**：
- [经济系统设计](经济系统设计%20de152292190d4a42abae3b641fee9513.md) - 整体经济框架
- [游戏设计文档（GDD）](GDD_GAME_DESIGN_DOCUMENT.md) - 第2章2.5节
- [共享系统设计](共享系统设计%20569bfcbd4c9d41fb8fd00c0accdf4809.md) - 跨模式数据同步
