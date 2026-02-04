# 🎨 《徒踪》美术素材提示词库 (Trail Trace Art Prompt Library)

> **文档说明**：本提示词库基于 `Art_Visual_Guide.md` (v2.3.0) 视觉规范生成，严格遵循**写实水彩 (Realistic Watercolor)** 风格体系及**中国人物形象设计规范**。
> **文档版本**：v2.4.0
> **最后更新**：2026年2月4日
> **适用模型**：Midjourney V6, Stable Diffusion XL (SDXL)
> **通用参数建议**：
> - **Casual Mode**: `--stylize 250 --chaos 10` (MJ) / CFG 7-8 (SD)
> - **Survival Mode**: `--stylize 300 --chaos 20` (MJ) / CFG 8-10 (SD)
> - **Aspect Ratios**: `--ar 2:3` (Portrait), `--ar 16:9` (Landscape), `--ar 1:1` (Icons), `--ar 9:13` (Cards)

---

## 1. 风格关键词矩阵 (Style Keywords Matrix)

所有Prompt必须包含以下基础风格描述，并根据模式选择对应的特征词：

| 维度 | 休闲探索模式 (Casual / Wet) | 生存挑战模式 (Survival / Dry) |
| :--- | :--- | :--- |
| **基础风格** | `realistic watercolor painting`, `wet-on-wet technique`, `transparent layers` | `realistic watercolor painting`, `dry brush technique`, `rough texture` |
| **笔触细节** | `soft blended edges`, `fluid strokes`, `blooming effect` | `jagged edges`, `visible bristles`, `scratches`, `splatters` |
| **色彩倾向** | `vibrant natural colors`, `sap green`, `cobalt blue`, `sunlight yellow` | `desaturated`, `muted earth tones`, `payne's grey`, `burnt umber`, `cold blue` |
| **纸张材质** | `cold press watercolor paper texture`, `clean white space` | `rough watercolor paper`, `stained paper`, `dirty edges` |
| **手绘痕迹** | `faint pencil sketch lines`, `soft eraser marks` | `heavy charcoal lines`, `messy graphite smudges`, `irregular eraser marks` |
| **人物特征** | **(Southern Style)**: `soft facial contours`, `warm peach skin tone (#FFDAB9)`, `gentle expression`, `almond eyes`, `facial ratio 2.8:4` | **(Northern Style)**: `sharp jawline`, `bronzed wheat skin (#CD853F)`, `determined look`, `weathered texture`, `facial ratio 3:4` |

---

## 2. 角色 (Characters)

**通用Negative**: `3d render, plastic skin, glossy, vector, cel shading, anime, cartoon, sharp outlines, perfect geometry, digital art style, pale skin, pink skin`

### 2.1 南方系：休闲探索者 (Southern Explorer)
**风格定位**：南方系面孔、明亮、治愈
**色板**：`#4CAF50` (Green), `#2196F3` (Blue), `#FFC107` (Yellow)

| 项目 | 内容 |
| :--- | :--- |
| **English Prompt** | **Subject**: Full body watercolor painting of a young Southern Chinese female hiker, wearing breathable sportswear in bright green and sky blue, carrying a lightweight yellow backpack. <br> **Features**: Soft facial contours, rounder chin, almond-shaped eyes, warm peach skin tone (#FFDAB9), gentle smile. <br> **Style**: Realistic watercolor art, wet-on-wet technique, soft edges, natural sunlight, transparent colors, visible watercolor paper texture. <br> **Mood**: Healing, energetic, fresh air. <br> **Tech**: `--ar 2:3 --v 6.0` |
| **中文提示词** | **主体**: 南方系中国年轻女性徒步者全身水彩画，穿着亮绿色和天蓝色的透气运动装，背着轻便的黄色背包。<br>**特征**: 面部轮廓柔和，下巴圆润，杏眼，暖桃色皮肤(#FFDAB9)，温柔微笑。<br>**风格**: 写实水彩艺术，湿画法，边缘柔和，自然阳光，透明色彩，可见水彩纸纹理。<br>**氛围**: 治愈，活力，清新空气。 |

### 2.2 南方系：文化摄影师 (Southern Photographer)
**风格定位**：南方系面孔、文艺、柔和
**色板**：`#546E7A` (Grey), `#FF9800` (Orange)

| 项目 | 内容 |
| :--- | :--- |
| **English Prompt** | **Subject**: Watercolor portrait of an adult Southern Chinese cultural photographer (approx. 28 years old), wearing casual outdoor vest and cargo pants, holding a vintage DSLR camera, wearing a bucket hat. <br> **Features**: Refined facial features, intelligent eyes, warm skin tone, shorter stature but agile. <br> **Style**: Realistic watercolor, soft washes of color, artistic blooming effects, detailed camera but soft clothing edges, warm sunset lighting. <br> **Mood**: Nostalgic, focused, artistic. <br> **Tech**: `--ar 2:3 --v 6.0` |
| **中文提示词** | **主体**: 南方系文化摄影师水彩肖像（成人，约28岁），穿着休闲户外马甲和工装裤，手持复古单反相机，戴着渔夫帽。<br>**特征**: 五官精致，眼神睿智，暖色皮肤，身材适中灵活。<br>**风格**: 写实水彩，柔和的色彩晕染，艺术性的水痕效果，相机细节清晰但衣物边缘柔和，温暖的夕阳光照。<br>**氛围**: 怀旧，专注，艺术感。 |

### 2.3 北方系：极限生存者 (Northern Survivalist)
**风格定位**：北方系面孔、冷峻、坚毅
**色板**：`#263238` (Dark Blue), `#37474F` (Cold Grey)

| 项目 | 内容 |
| :--- | :--- |
| **English Prompt** | **Subject**: Full body watercolor painting of a Northern Chinese male survivalist, wearing heavy waterproof technical gear, dark grey and navy blue, covered in snow frost, holding an ice axe. <br> **Features**: Sharp jawline, high cheekbones, bronzed wheat skin (#CD853F), determined eyes, taller and robust build. <br> **Style**: Realistic watercolor, dry brush technique, gritty texture, splatter effects, desaturated colors, visible rough pencil strokes. <br> **Mood**: Tense, cold, survival, isolation. <br> **Tech**: `--ar 2:3 --style raw --v 6.0` |
| **中文提示词** | **主体**: 北方系硬核生存专家全身水彩画，穿着厚重的防水功能性装备，深灰和海军蓝配色，覆盖着冰霜，手持冰镐。<br>**特征**: 下颌线锋利，高颧骨，古铜色皮肤(#CD853F)，眼神坚定，身材高大魁梧。<br>**风格**: 写实水彩，干画法，粗糙纹理，飞溅效果，低饱和度色彩，可见粗糙铅笔笔触。<br>**氛围**: 紧张，寒冷，生存，孤立。 |

### 2.4 北方系：救援队员 (Northern Rescuer)
**风格定位**：北方系面孔、强烈、紧迫
**色板**：`#FF5722` (Safety Orange), `#212121` (Black)

| 项目 | 内容 |
| :--- | :--- |
| **English Prompt** | **Subject**: Watercolor painting of a Northern Chinese mountain rescue team member, wearing high-visibility orange jacket with reflective strips. <br> **Features**: Strong facial structure, serious expression, weathered skin texture from wind and snow. <br> **Style**: Realistic watercolor, high contrast, sharp dry strokes combined with water stains, dramatic lighting, dirty paper texture. <br> **Mood**: Heroic, urgent, dangerous. <br> **Tech**: `--ar 2:3 --v 6.0` |
| **中文提示词** | **主体**: 北方系山地救援队员水彩画，穿着带反光条的高能见度橙色夹克。<br>**特征**: 面部结构强硬，表情严肃，风雪磨砺出的皮肤质感。<br>**风格**: 写实水彩，高对比度，锐利的干笔触结合水渍，戏剧性布光，脏旧纸张纹理。<br>**氛围**: 英雄，紧迫，危险。 |

---

## 3. 场景 (Scenes)

**通用Negative**: `3d environment, cgi, digital landscape, sharp vector trees, unnatural colors, perfect symmetry`

### 3.1 休闲模式：海湾栈道 (Coastal Trail)
**关键元素**：蓝天、大海、木栈道、灯塔

| 项目 | 内容 |
| :--- | :--- |
| **English Prompt** | **Subject**: A scenic coastal hiking trail in Shenzhen Bay, wooden boardwalk winding along the blue ocean, lush green mangroves, distant white lighthouse. <br> **Style**: Realistic watercolor landscape, wet-on-wet sky, transparent water layers, soft sunlight, cold press paper texture, loose brushwork for vegetation. <br> **Mood**: Peaceful, breezy, open. <br> **Tech**: `--ar 16:9 --v 6.0` |
| **中文提示词** | **主体**: 深圳湾海岸徒步栈道，木栈道蜿蜒在蔚蓝大海边，茂盛的红树林，远处的白色灯塔。<br>**风格**: 写实水彩风景，湿画法天空，透明水层，柔和阳光，冷压纸纹理，植被笔触轻松。<br>**氛围**: 宁静，微风，开阔。 |

### 3.2 生存模式：雪山脊线 (Snowy Ridge)
**关键元素**：雪山、悬崖、暴风雪、冷色调

| 项目 | 内容 |
| :--- | :--- |
| **English Prompt** | **Subject**: Dangerous high altitude snow mountain ridge, sharp jagged rocks, heavy blizzard conditions, treacherous path. <br> **Style**: Realistic watercolor landscape, dry brush technique for rocks, white gouache for snow, splatter for wind effects, desaturated cold tones, rough paper texture. <br> **Mood**: Terrifying, freezing, majestic. <br> **Tech**: `--ar 16:9 --style raw --v 6.0` |
| **中文提示词** | **主体**: 危险的高海拔雪山脊线，锋利的锯齿状岩石，大暴风雪，险恶路径。<br>**风格**: 写实水彩风景，岩石使用干画法，雪使用白色水粉，飞溅效果模拟风雪，低饱和冷色调，粗糙纸纹理。<br>**氛围**: 恐惧，冰冻，壮丽。 |

---

## 4. 卡牌与UI资产 (Cards & UI Assets)

**通用Negative**: `3d model, blender render, isometric vector, flat icon, solid fill, perfect circle, symmetry, clean lines`

### 4.1 休闲背包 (Casual Backpack Icon)
| 项目 | 内容 |
| :--- | :--- |
| **English Prompt** | **Subject**: A hiking backpack, bright orange and grey. <br> **Style**: Hand-drawn watercolor illustration, white background, soft edges, pencil outline visible, transparent color washes, not vector, not 3D. <br> **Tech**: `--ar 1:1 --v 6.0` |
| **中文提示词** | **主体**: 徒步背包，亮橙色和灰色。<br>**风格**: 手绘水彩插画，白底，边缘柔和，可见铅笔轮廓，透明色层，非矢量，非3D。 |

### 4.2 UI 面板背景 (UI Panel Background)
| 项目 | 内容 |
| :--- | :--- |
| **English Prompt** | **Subject**: Watercolor paper texture background for UI panel, slight paint stains on corners. <br> **Style**: Macro photography of watercolor paper, realistic texture, off-white color, subtle uneven surface, soft irregular edges (deckle edge). <br> **Tech**: `--ar 4:3 --tile --v 6.0` |
| **中文提示词** | **主体**: 用于UI面板的水彩纸纹理背景，角落有轻微颜料渍。<br>**风格**: 水彩纸微距摄影，写实纹理，米白色，微妙的不平整表面，柔和的不规则边缘（毛边）。 |

### 4.3 卡牌图标框 (Card Icon Frame)
| 项目 | 内容 |
| :--- | :--- |
| **English Prompt** | **Subject**: An organic watercolor frame for a card icon (internal frame), roughly square shape with soft rounded corners, decorated with realistic hiking and nature symbols (pine needles, small stones, contour lines, woven grass texture). <br> **Style**: Hand-painted watercolor brush stroke, semi-transparent white wash inside, darker edge outline, irregular thickness, paint pooling effect (coffee ring) in corners, deckle edges. <br> **Negative**: No magic runes, no glowing effects, no sci-fi technology, no metallic armor, no fantasy crystals. <br> **Tech**: `--ar 1:1 --v 6.0 --stylize 250` |
| **中文提示词** | **主体**: 用于卡牌图标的水彩有机边框（内框），大致方形，柔和圆角，装饰有写实徒步与自然符号（松针、小石子、等高线、编织草纹理）。<br>**风格**: 手绘水彩笔触，内部半透明白色洗色，边缘深色轮廓，厚度不均，角落有颜料积聚效果（咖啡环），毛边效果。<br>**负向**: 无魔法符文，无发光效果，无科幻科技，无金属盔甲，无奇幻水晶。 |

### 4.4 卡牌边框 (Card Frame - Rarity)

#### 4.4.1 普通级 (Common - Grey)
| 项目 | 内容 |
| :--- | :--- |
| **English Prompt** | **Subject**: A rectangular game card border frame (9:13 ratio), deep grey color (#9E9E9E). <br> **Style**: Simple watercolor ink line, minimal thickness, clean but hand-drawn stroke. <br> **Elements**: Texture of rough hiking rope or woven canvas, simple pebble outlines in corners. <br> **Details**: Single continuous stroke with slight ink variation, soft rounded corners, minimalist outdoor gear aesthetic. <br> **Tech**: `--ar 9:13 --v 6.0 --stylize 250` |
| **中文提示词** | **主体**: 矩形游戏卡牌边框（9:13比例），深灰色(#9E9E9E)。<br>**风格**: 简单水彩墨线，极细，干净的手绘笔触。<br>**元素**: 粗糙徒步绳索或编织帆布纹理，角落有简单的鹅卵石轮廓。<br>**细节**: 单一连续笔触，轻微墨色变化，柔和圆角，极简户外装备美学。 |

#### 4.4.2 稀有级 (Rare - Teal/Turquoise)
| 项目 | 内容 |
| :--- | :--- |
| **English Prompt** | **Subject**: A rectangular game card border frame (9:13 ratio), greenish blue-green (Teal/Turquoise) color. <br> **Style**: Artistic watercolor border, double layered wash, soft blooming edges. <br> **Elements**: Intertwined fern leaves, climbing vines, mossy stone texture, forest stream water ripples. <br> **Details**: Fresh and organic feeling, fluid water stains, paint pooling effect (coffee ring) in corners, isolated on white background. <br> **Tech**: `--ar 9:13 --v 6.0 --stylize 300` |
| **中文提示词** | **主体**: 矩形游戏卡牌边框（9:13比例），偏绿的蓝绿色（青色）。<br>**风格**: 艺术水彩边框，双层洗色，柔和晕染边缘。<br>**元素**: 交织的蕨类叶片，攀援藤蔓，苔藓石纹理，森林溪流波纹。<br>**细节**: 清新有机感，流动水渍，角落颜料积聚效果，白底隔离。 |

#### 4.4.3 史诗级 (Epic - Indigo)
| 项目 | 内容 |
| :--- | :--- |
| **English Prompt** | **Subject**: A rectangular game card border frame (9:13 ratio), bluish blue-violet (Indigo) color. <br> **Style**: Intricate watercolor border, complex organic patterns, elegant brushwork. <br> **Elements**: Silhouettes of mountain peaks, swirling wind currents, starry night sky gradients, geological rock strata lines. <br> **Details**: Mysterious and majestic atmosphere, rich texture, deep saturation, fine splatter details, isolated on white background. <br> **Tech**: `--ar 9:13 --v 6.0 --stylize 400` |
| **中文提示词** | **主体**: 矩形游戏卡牌边框（9:13比例），偏蓝的蓝紫色（靛蓝）。<br>**风格**: 精细水彩边框，复杂有机花纹，优雅笔触。<br>**元素**: 山峰剪影，旋转气流，星空渐变，地质岩层线条。<br>**细节**: 神秘庄重氛围，丰富纹理，高饱和度，细腻飞溅细节，白底隔离。 |

#### 4.4.4 传说级 (Legendary - Gold)
| 项目 | 内容 |
| :--- | :--- |
| **English Prompt** | **Subject**: A rectangular game card border frame (9:13 ratio), cadmium yellow and gold color. <br> **Style**: Majestic watercolor border, ornate design, dynamic flowing light effects. <br> **Elements**: Radiant sun rays, complex topographic map contour lines in gold leaf, ancient compass rose motifs, glowing amber texture. <br> **Details**: Heavy gold leaf texture, glowing aura, wet-on-wet gold wash, light rays emitting from edges, isolated on white background. <br> **Tech**: `--ar 9:13 --v 6.0 --stylize 500` |
| **中文提示词** | **主体**: 矩形游戏卡牌边框（9:13比例），镉黄与金色。<br>**风格**: 宏伟水彩边框，华丽设计，动态流光效果。<br>**元素**: 辐射阳光，金箔复杂地形图等高线，古老罗盘玫瑰图案，发光琥珀纹理。<br>**细节**: 厚重金箔质感，发光光环，湿画法金洗，边缘射出的光线，白底隔离。 |
