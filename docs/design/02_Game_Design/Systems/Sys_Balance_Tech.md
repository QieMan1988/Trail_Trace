# ---
title: 数值平衡与技术规范 (Balance & Tech Spec)
version: 2.1.0
date: 2026-02-03
author: System Designer
status: Approved
---

# 数值平衡与技术规范 (Balance & Tech Spec)

> **文档版本**：v2.1.0  
> **最后更新**：2026-02-03

---

## 一、数值平衡设计

### 1.1 难度曲线

#### 1.1.1 休闲探索模式

**路线难度递进**：

| 路线编号 | 难度 | 层数 | 卡牌种类 | 推荐等级 | 预计时长 |
| --- | --- | --- | --- | --- | --- |
| 1-3 | ⭐ | 5-6层 | 4-5种 | 1-5级 | 10-12分钟 |
| 4-6 | ⭐⭐ | 6-7层 | 5-6种 | 5-15级 | 12-15分钟 |
| 7-9 | ⭐⭐⭐ | 7-8层 | 6-7种 | 15-30级 | 15-18分钟 |
| 10 | ⭐⭐⭐⭐ | 9层 | 7种 | 30级+ | 18-20分钟 |

**体能消耗平衡**：

```jsx
// 确保玩家在合理游玩下不会体能耗尽

平均每层体能消耗 = 卡牌数量 × 平均体能消耗
= 35张 × 4点 = 140点

5层关卡总消耗 = 140 × 5 = 700点

玩家可用体能：
- 初始体能：100
- 连击减免（假设10连击）：-10%
- 休息恢复（2次，共30秒）：+60
- 道具补给（1-2次）：+30
总计：约190点实际可用

结论：需要策略性使用道具和连击，轻松通关
```

#### 1.1.2 生存挑战模式

**路线难度递进**：

| 路线编号 | 难度 | 距离 | 天数 | 推荐等级 | 预计时长 |
| --- | --- | --- | --- | --- | --- |
| 1-2 | ⚠️⚠️⚠️⚠️ | 70-80km | 3-5天 | 1-10级 | 20-25分钟 |
| 3-5 | ⚠️⚠️⚠️⚠️ | 65-100km | 3-5天 | 10-25级 | 25-30分钟 |
| 6-8 | ⚠️⚠️⚠️⚠️ | 100-130km | 5-7天 | 25-40级 | 30-35分钟 |
| 9-10 | ⚠️⚠️⚠️⚠️⚠️ | 90-145km | 5-8天 | 40级+ | 35-40分钟 |

**资源平衡计算**：

```jsx
// 鳌太线（80km，预计4天）资源需求

体能消耗：
- 每km消耗：50点（含地形、天气、负重）
- 总消耗：80km × 50 = 4000点
- 自然恢复：4天 × 8小时 × 15点/小时 = 480点
- 需要补给：3520点 ≈ 117个能量棒

实际策略：
- 携带能量棒：10个（+150体能）
- 压缩饼干：8个（+240饥饿）
- 矿泉水：15瓶（+375口渴）
- 通过合理规划路线、天气、扎营时机完成

总重量：10×0.1 + 8×0.2 + 15×0.5 = 10.1kg
在负重范围内（15-25kg）
```

### 1.2 经济平衡

#### 1.2.1 收入支出比

**环保值循环**：

| 阶段 | 单日收入 | 单日支出 | 净收益 |
| --- | --- | --- | --- |
| 新手期（1-10小时） | 1500-2000 | 800-1200 | +700-800 |
| 成长期（10-50小时） | 2500-3500 | 1500-2500 | +1000-1000 |
| 成熟期（50小时+） | 3000-4000 | 2000-3000 | +1000-1000 |

**爬升值循环**：

| 阶段 | 累计收入 | 累计支出 | 剩余 |
| --- | --- | --- | --- |
| 第1周 | 80-120 | 100-150 | -20至-30（正常） |
| 第1月 | 400-550 | 350-450 | +50-100 |
| 第3月 | 1500-2200 | 1200-1800 | +300-400 |

#### 1.2.2 定价策略

**装备定价公式**：

```jsx
// 基础定价
func calculate_equipment_price(quality: String, level: int) -> int:
    var base_price = {
        "common": 150,
        "uncommon": 200,
        "rare": 400,
        "epic": 800,
        "legendary": 1500
    }
    
    var price = base_price[quality]
    
    # 等级加成
    price *= (1 + level * 0.2)
    
    return int(price)

# 示例：
# 稀有装备 Lv3 = 400 × (1 + 3×0.2) = 400 × 1.6 = 640环保值
```

**消耗品定价**：

```jsx
// 性价比平衡
矿泉水：25环保值 / 25口渴恢复 = 1环保值/点
能量棒：30环保值 / (20饥饿+10体能) = 1环保值/点
急救包：50环保值 / 15体能 = 3.3环保值/点（应急用）

结论：基础消耗品性价比一致，急救物资贵但关键时刻有用
```

### 1.3 成长曲线

#### 1.3.1 等级曲线

**经验需求**：

```jsx
func get_exp_for_level(level: int) -> int:
    return level * 1000

# 累计经验需求
Level 1 → 2: 1,000 exp
Level 10: 累计 55,000 exp
Level 30: 累计 465,000 exp
Level 50: 累计 1,275,000 exp
```

**预计升级时间**：

| 等级段 | 游玩时长 | 获得方式 |
| --- | --- | --- |
| 1-10级 | 5-8小时 | 新手关卡 |
| 10-30级 | 30-50小时 | 日常游玩 |
| 30-50级 | 80-120小时 | 高难度挑战 |

#### 1.3.2 属性成长

**体能上限成长**：

```jsx
基础体能：100

成长来源：
- 等级提升（属性点）：最多 50级×3点×5体能 = 750点
- 装备加成：约 +50点
- 照片卡加成：最多 +150点
- 永久提升（爬升值）：最多 +100点

最终体能上限：100 + 750 + 50 + 150 + 100 = 1150点

成长倍率：11.5倍（合理的成长空间）
```

---

## 二、UI/UX设计规范

### 2.1 界面布局

#### 2.1.1 主界面

```
┌─────────────────────────────────┐
│  《徒踪 V2.0》                    │
│                                 │
│  [选择模式]                      │
│  ┌────────┐  ┌────────┐        │
│  │休闲探索│  │生存挑战│        │
│  └────────┘  └────────┘        │
│                                 │
│  [角色] 探险家 Lv15             │
│  [货币] 环保值:5000 爬升值:120  │
│                                 │
│  [开始游戏] [商店] [成就]       │
│  [设置] [退出]                  │
└─────────────────────────────────┘
```

#### 2.1.2 游戏界面（休闲模式）

```
┌─────────────────────────────────┐
│ 凤凰山 5层 | 连击: 15x           │
├─────────────────────────────────┤
│ 体能 ████████░░ 80/100          │
│ 饥饿 ██████░░░░ 60/100          │
│ 口渴 ████░░░░░░ 40/100          │
│ 体温 36.8°C  心率 95bpm         │
├─────────────────────────────────┤
│                                 │
│   [卡牌网格 7×5]                │
│   🟩🟨🟧⬜🟫📸♻️               │
│   ...                           │
│                                 │
├─────────────────────────────────┤
│ [背包] [商店] [暂停]            │
└─────────────────────────────────┘
```

#### 2.1.3 游戏界面（挑战模式）

```
┌─────────────────────────────────┐
│ 鳌太线 Day 2 | 12km/80km        │
├─────────────────────────────────┤
│ ⚡体能 60  🍖饥饿 45  💧口渴 30 │
│ 🌡️体温 34°C  🧠心智 55          │
│ 天气: 大雪 ❄️ | 负重: 18/22kg  │
├─────────────────────────────────┤
│                                 │
│    [路线地图显示]               │
│    你的位置 📍                  │
│    下一检查点 ▼ 5km            │
│                                 │
├─────────────────────────────────┤
│ [背包] [扎营] [决策] [地图]     │
└─────────────────────────────────┘
```

### 2.2 交互设计

#### 2.2.1 操作反馈

**点击反馈**：

- 按钮点击：缩放动画 + 音效
- 卡牌选择：高亮边框 + 震动反馈
- 消除成功：粒子效果 + 奖励数字飘出

**状态变化**：

- 属性降低：渐变红色 + 警告图标
- 属性危险：闪烁红色 + 警告音
- 获得奖励：金币飘入动画 + 提示音

#### 2.2.2 引导提示

**首次功能**：

- 高亮目标区域
- 半透明遮罩
- 箭头指向 + 文字说明
- "知道了"按钮确认

**情境帮助**：

- 右上角"?"按钮
- 点击显示当前界面帮助
- 可关闭不再显示

### 2.3 视觉风格

#### 2.3.1 休闲模式

**色彩方案**：

- 主色：温暖橙色 #FF9966
- 辅色：天空蓝 #66CCFF
- 背景：浅米黄 #FFF8DC
- 文字：深棕色 #5C4033

**UI元素**：

- 圆角设计
- 柔和阴影
- 插画风格图标
- 明亮配色

#### 2.3.2 挑战模式

**色彩方案**：

- 主色：冷峻蓝 #2C5F77
- 辅色：警示橙 #FF6B35
- 背景：深灰蓝 #1A1A2E
- 文字：浅灰白 #E8E8E8

**UI元素**：

- 硬朗直角
- 强烈对比
- 写实风格图标
- 冷色调为主

### 2.4 动画规范

**过渡动画**：

```
# 页面切换
func transition_to_scene(new_scene: PackedScene):
    var tween = create_tween()
    tween.tween_property(current_scene, "modulate:a", 0.0, 0.3)
    await tween.finished
    get_tree().change_scene_to_packed(new_scene)

# 按钮缩放
func on_button_pressed(button: Button):
    var tween = create_tween()
    tween.tween_property(button, "scale", Vector2(0.95, 0.95), 0.1)
    tween.tween_property(button, "scale", Vector2(1.0, 1.0), 0.1)
```

**性能优化**：

- 使用Tween而非AnimationPlayer（性能更好）
- 动画时长不超过0.5秒
- 同屏动画不超过10个

---

## 三、技术实现指南

### 3.1 Godot 4.6项目结构

```
res://
├── scenes/
│   ├── main/
│   │   ├── MainMenu.tscn
│   │   └── ModeSelect.tscn
│   ├── casual/
│   │   ├── CasualGame.tscn
│   │   └── CardGrid.tscn
│   ├── survival/
│   │   ├── SurvivalGame.tscn
│   │   └── RouteMap.tscn
│   └── shared/
│       ├── Shop.tscn
│       └── Achievement.tscn
├── scripts/
│   ├── core/
│   │   ├── GameManager.gd
│   │   ├── ModeManager.gd
│   │   └── SaveManager.gd
│   ├── systems/
│   │   ├── CurrencyManager.gd
│   │   ├── CharacterManager.gd
│   │   ├── EquipmentManager.gd
│   │   └── AchievementManager.gd
│   └── gameplay/
│       ├── AttributeManager.gd
│       ├── CardSystem.gd (休闲)
│       └── DecisionSystem.gd (挑战)
├── resources/
│   ├── characters/
│   ├── equipment/
│   └── routes/
├── data/
│   ├── config/
│   │   ├── balance.json
│   │   └── routes.json
│   └── localization/
│       └── zh_CN.po
└── assets/
    ├── ui/
    ├── icons/
    └── sounds/
```

### 3.2 核心系统实现

#### 3.2.1 游戏管理器

```
class_name GameManager extends Node

# 单例
static var instance: GameManager

# 管理器引用
var mode_manager: ModeManager
var currency_manager: CurrencyManager
var character_manager: CharacterManager
var equipment_manager: EquipmentManager
var achievement_manager: AchievementManager
var save_manager: SaveManager

func _ready():
    instance = self
    initialize_managers()

func initialize_managers():
    mode_manager = ModeManager.new()
    currency_manager = CurrencyManager.new()
    character_manager = CharacterManager.new()
    equipment_manager = EquipmentManager.new()
    achievement_manager = AchievementManager.new()
    save_manager = SaveManager.new()
    
    add_child(mode_manager)
    add_child(currency_manager)
    add_child(character_manager)
    add_child(equipment_manager)
    add_child(achievement_manager)
    add_child(save_manager)

func start_game(mode: ModeManager.GameMode):
    mode_manager.switch_mode(mode)
    
    match mode:
        ModeManager.GameMode.CASUAL:
            get_tree().change_scene_to_file("res://scenes/casual/CasualGame.tscn")
        ModeManager.GameMode.SURVIVAL:
            get_tree().change_scene_to_file("res://scenes/survival/SurvivalGame.tscn")
```

#### 3.2.2 数据配置加载

```
class_name ConfigLoader extends Node

static func load_balance_config() -> Dictionary:
    var file = FileAccess.open("res://data/config/balance.json", FileAccess.READ)
    var json_str = file.get_as_text()
    file.close()
    return JSON.parse_string(json_str)

static func get_equipment_config(equipment_id: String) -> Dictionary:
    var config = load_balance_config()
    return config["equipment"][equipment_id]

static func get_route_config(route_id: String) -> Dictionary:
    var file = FileAccess.open("res://data/config/routes.json", FileAccess.READ)
    var json_str = file.get_as_text()
    file.close()
    var routes = JSON.parse_string(json_str)
    return routes[route_id]
```

### 3.3 性能优化

#### 3.3.1 对象池

```
class_name ObjectPool extends Node

var pool: Dictionary = {}

func get_object(scene_path: String) -> Node:
    if not pool.has(scene_path):
        pool[scene_path] = []
    
    if pool[scene_path].is_empty():
        var scene = load(scene_path)
        return scene.instantiate()
    else:
        return pool[scene_path].pop_back()

func return_object(obj: Node, scene_path: String):
    obj.hide()
    if not pool.has(scene_path):
        pool[scene_path] = []
    pool[scene_path].append(obj)
```

#### 3.3.2 资源管理

```
# 预加载关键资源
func preload_resources():
    ResourceLoader.load_threaded_request("res://scenes/casual/CasualGame.tscn")
    ResourceLoader.load_threaded_request("res://scenes/survival/SurvivalGame.tscn")
    
    # 卡牌纹理
    for i in range(1, 8):
        ResourceLoader.load_threaded_request("res://assets/cards/card_%d.png" % i)

# 异步加载
func load_scene_async(scene_path: String):
    ResourceLoader.load_threaded_request(scene_path)
    
    while true:
        var status = ResourceLoader.load_threaded_get_status(scene_path)
        if status == ResourceLoader.THREAD_LOAD_LOADED:
            var scene = ResourceLoader.load_threaded_get(scene_path)
            return scene
        await get_tree().process_frame
```

### 3.4 数据持久化

#### 3.4.1 存档管理

```
class_name SaveManager extends Node

const SAVE_PATH = "user://save_game.dat"
const ENCRYPTION_KEY = "your_encryption_key_here"

func save_game():
    var save_data = compile_save_data()
    var json_str = JSON.stringify(save_data)
    
    # AES加密
    var encrypted = encrypt_data(json_str)
    
    var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
    file.store_buffer(encrypted)
    file.close()
    
    # 备份
    create_backup()

func load_game() -> Dictionary:
    if not FileAccess.file_exists(SAVE_PATH):
        return create_new_save()
    
    var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
    var encrypted = file.get_buffer(file.get_length())
    file.close()
    
    # 解密
    var json_str = decrypt_data(encrypted)
    var save_data = JSON.parse_string(json_str)
    
    # 校验数据
    if not validate_save_data(save_data):
        push_warning("Save data corrupted, loading backup...")
        return load_backup()
    
    return save_data

func encrypt_data(data: String) -> PackedByteArray:
    var crypto = AESContext.new()
    var key = ENCRYPTION_KEY.to_utf8_buffer()
    crypto.start(AESContext.MODE_ECB_ENCRYPT, key)
    return crypto.update(data.to_utf8_buffer())

func decrypt_data(encrypted: PackedByteArray) -> String:
    var crypto = AESContext.new()
    var key = ENCRYPTION_KEY.to_utf8_buffer()
    crypto.start(AESContext.MODE_ECB_DECRYPT, key)
    var decrypted = crypto.update(encrypted)
    return decrypted.get_string_from_utf8()
```

---

## 四、测试与调试

### 4.1 测试清单

**功能测试**：

- [ ]  两种模式切换正常
- [ ]  角色解锁和切换
- [ ]  装备穿戴和效果
- [ ]  商店购买和折扣
- [ ]  成就解锁和奖励
- [ ]  存档保存和加载

**数值测试**：

- [ ]  属性消耗合理
- [ ]  货币获取平衡
- [ ]  难度曲线流畅
- [ ]  经济系统稳定

**性能测试**：

- [ ]  FPS稳定60
- [ ]  内存占用<500MB
- [ ]  加载时间<3秒

### 4.2 调试工具

**控制台命令**：

```
func _input(event):
    if OS.is_debug_build():
        if event is InputEventKey and event.pressed:
            match event.keycode:
                KEY_F1:  # 无敌模式
                    god_mode = not god_mode
                KEY_F2:  # 添加货币
                    CurrencyManager.add_currency("eco", 10000)
                    CurrencyManager.add_currency("climbing", 100)
                KEY_F3:  # 解锁全部
                    unlock_all_content()
                KEY_F4:  # 显示调试信息
                    debug_overlay.visible = not debug_overlay.visible
```

**性能监控**：

```
class_name PerformanceMonitor extends CanvasLayer

var fps_label: Label
var memory_label: Label

func _process(delta):
    fps_label.text = "FPS: %d" % Engine.get_frames_per_second()
    
    var mem_static = OS.get_static_memory_usage() / 1024.0 / 1024.0
    memory_label.text = "Memory: %.1f MB" % mem_static
```

---

## 五、发布准备

### 5.1 Steam集成

**Steamworks SDK配置**：

```
class_name SteamManager extends Node

var is_steam_enabled: bool = false
var app_id: int = 0  # Steam App ID

func _ready():
    if OS.has_feature("steam"):
        initialize_steam()

func initialize_steam():
    var init_result = Steam.steamInit()
    if init_result["status"] == Steam.STEAM_OK:
        is_steam_enabled = true
        app_id = Steam.getAppID()
        print("Steam initialized successfully")
    else:
        push_error("Failed to initialize Steam")

func unlock_achievement(achievement_name: String):
    if is_steam_enabled:
        Steam.setAchievement(achievement_name)
        Steam.storeStats()
```

### 5.2 构建配置

**导出预设**（Windows）：

```
[preset.0]
name="Windows Desktop"
platform="Windows Desktop"
runnable=true

[preset.0.options]
binary_format/64_bits=true
texture_format/bptc=true
texture_format/s3tc=true

custom_template/debug=""
custom_template/release=""

codesign/enable=true
codesign/timestamp=true
```

### 5.3 版本控制

**版本号规范**：

```
MAJOR.MINOR.PATCH

例如：2.0.1
- MAJOR: 重大功能更新
- MINOR: 新功能添加
- PATCH: Bug修复
```

---

## 六、常见问题（FAQ）

### Q1：如何调整游戏难度？

A：修改 `res://data/config/balance.json`，调整属性消耗系数、资源获取倍率等参数。

### Q2：如何添加新装备？

A：在 `balance.json` 添加装备配置，在 `res://resources/equipment/` 创建对应Resource文件。

### Q3：性能优化的关键是什么？

A：对象池、异步加载、合理使用信号而非轮询、减少节点数量。

### Q4：如何实现多语言？

A：使用Godot内置的本地化系统，在 `res://data/localization/` 添加.po文件。

### Q5：存档数据如何迁移？

A：在SaveManager中实现版本检测和数据迁移逻辑，确保向后兼容。

---

## 七、总结

本文档提供了《徒踪-V2.0》的完整数值平衡设计和技术实现规范：

**数值平衡**：

- ✅ 科学的难度曲线
- ✅ 平衡的经济系统
- ✅ 合理的成长路径

**技术规范**：

- ✅ 清晰的项目结构
- ✅ 高效的性能优化
- ✅ 完善的存档系统
- ✅ 标准的UI/UX设计

**发布准备**：

- ✅ Steam集成方案
- ✅ 构建配置指南
- ✅ 测试清单完备

遵循这些规范，开发团队可以高效、规范地完成游戏开发。