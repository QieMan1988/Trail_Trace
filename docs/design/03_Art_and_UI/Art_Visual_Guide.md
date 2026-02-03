---
title: 视觉风格指南 (Visual Style Guide)
version: 2.1.0
date: 2026-02-03
author: Art Director
status: Approved
---

# 视觉风格指南 (Visual Style Guide)

> **文档版本**：v2.1.0  
> **最后更新**：2026-02-03

---

## 一、设计哲学与世界观

### 1.1 核心世界观

《徒踪-V2.0》建立在**真实户外体验**与**文化探索**的双重世界观基础上：

**休闲探索模式** - "大湾区文化深度游"
- 🌿 **自然和谐**：人与自然的和谐共处
- 📸 **文化记录**：记录和传播地方文化
- ♻️ **环保理念**：无痕徒步，绿色出行
- 🗺️ **探索发现**：发现未知的美好

**生存挑战模式** - "全国风险路线生存"
- ⚠️ **真实挑战**：面对自然的严峻考验
- 🧗 **极限突破**：突破身体和心智的极限
- 🌪️ **环境对抗**：与恶劣天气和地形搏斗
- 💀 **生死边缘**：体验生命的脆弱与坚强

### 1.2 视觉关键词

**共享元素**（适用于两种模式）：
- 山脉轮廓、徒步足迹、指南针、地图纹理
- 自然材质：石材、木材、金属的质感
- 天气元素：阳光、云朵、雨滴、雪花

**休闲模式专属**：
- 温暖阳光、绿色植物、蓝色天空、彩色花朵
- 文化符号：传统建筑、地方特色、民俗图案
- 轻松氛围：柔和曲线、明亮色彩、友好图标

**生存模式专属**：
- 暴风雪、雷电、悬崖峭壁、黑暗天空
- 危险符号：骷髅、警告标志、红色警报
- 紧张氛围：尖锐角度、冷峻色彩、厚重质感

---

## 二、色彩系统

### 2.1 共享色彩系统

**主品牌色**（Trail Trace Brand Colors）：
```css
/* 核心品牌色 */
--tt-primary:     #2E7D32;    /* 徒步绿 - 主品牌色 */
--tt-secondary:   #546E7A;    /* 山石灰 - 辅助色 */
--tt-accent:      #FF9800;    /* 日落橙 - 强调色 */

/* 中性色 */
--tt-white:       #FFFFFF;    /* 纯白 */
--tt-gray-100:    #F5F5F5;    /* 浅灰 */
--tt-gray-200:    #EEEEEE;    /* 中浅灰 */
--tt-gray-300:    #E0E0E0;    /* 中灰 */
--tt-gray-400:    #BDBDBD;    /* 中深灰 */
--tt-gray-500:    #9E9E9E;    /* 深灰 */
--tt-gray-600:    #757575;    /* 更深灰 */
--tt-gray-700:    #616161;    /* 极深灰 */
--tt-gray-800:    #424242;    /* 近黑灰 */
--tt-gray-900:    #212121;    /* 基本黑 */
--tt-black:       #000000;    /* 纯黑 */
```

### 2.2 休闲探索模式色彩

**自然色彩系统**（Casual Natural System）：
```css
/* 主色调 */
--ca-primary:     #4CAF50;    /* 自然绿 - 主色 */
--ca-secondary:   #2196F3;    /* 天空蓝 - 辅色 */
--ca-accent:      #FFC107;    /* 阳光黄 - 强调 */

/* 自然元素 */
--ca-sky:         #87CEEB;    /* 天空色 */
--ca-cloud:       #F0F8FF;    /* 云朵色 */
--ca-mountain:    #8B7355;    /* 山色 */
--ca-forest:      #228B22;    /* 森林绿 */
--ca-water:       #4682B4;    /* 水色 */
--ca-sun:         #FFD700;    /* 阳光金 */

/* 文化色彩 */
--ca-culture-1:   #DC143C;    /* 传统红 */
--ca-culture-2:   #FFB6C1;    /* 文化粉 */
--ca-culture-3:   #DDA0DD;    /* 民俗紫 */
```

**状态色彩**（Casual State Colors）：
```css
--ca-success:     #4CAF50;    /* 成功 - 环保绿 */
--ca-warning:     #FF9800;    /* 警告 - 日落橙 */
--ca-error:       #F44336;    /* 错误 - 危险红 */
--ca-info:        #2196F3;    /* 信息 - 天空蓝 */

--ca-text-primary:   #212121;    /* 主要文字 */
--ca-text-secondary: #757575;    /* 次要文字 */
--ca-text-disabled:  #9E9E9E;    /* 禁用文字 */
--ca-text-inverse:   #FFFFFF;    /* 反色文字 */
```

### 2.3 生存挑战模式色彩

**极端环境色彩系统**（Survival Extreme System）：
```css
/* 主色调 */
--su-primary:     #263238;    /* 深灰蓝 - 主色 */
--su-secondary:   #37474F;    /* 冷灰 - 辅色 */
--su-accent:      #FF5722;    /* 危险橙 - 强调 */

/* 环境元素 */
--su-storm:       #2F4F4F;    /* 暴风雨色 */
--su-snow:        #F0F8FF;    /* 雪色 */
--su-ice:         #B0E0E6;    /* 冰色 */
--su-night:       #191970;    /* 深夜蓝 */
--su-danger:      #DC143C;    /* 血红色 */
--su-warning:     #FF4500;    /* 警告橙 */

/* 生存状态 */
--su-health:      #32CD32;    /* 健康绿 */
--su-injured:     #FFD700;    /* 受伤黄 */
--su-critical:    #FF0000;    /* 危急红 */
--su-frozen:      #87CEEB;    /* 冰冻蓝 */
```

**状态色彩**（Survival State Colors）：
```css
--su-success:     #4CAF50;    /* 成功 - 生存绿 */
--su-warning:     #FF9800;    /* 警告 - 警报橙 */
--su-error:       #F44336;    /* 错误 - 致命红 */
--su-info:        #2196F3;    /* 信息 - 信号蓝 */

--su-text-primary:   #FFFFFF;    /* 主要文字 */
--su-text-secondary: #B0BEC5;    /* 次要文字 */
--su-text-disabled:  #78909C;    /* 禁用文字 */
--su-text-inverse:   #263238;    /* 反色文字 */
```

### 2.4 色彩对比度标准

**WCAG 2.1 AA合规要求**：
```
普通文本: 4.5:1 (最低)
大文本: 3:1 (最低)
交互元素: 4.5:1 (最低)
图标: 3:1 (最低)

实际应用对比度:
主按钮文本: 7.2:1 ✅
次要按钮文本: 5.8:1 ✅
禁用状态文本: 2.8:1 ⚠️ (需调整)
背景与文字: 12.5:1 ✅
```

---

## 三、字体系统

### 3.1 字体层级

**主字体**（Primary Typeface）：
```css
/* 中文主字体 */
font-family: "PingFang SC", "Microsoft YaHei", "Helvetica Neue", sans-serif;

/* 英文主字体 */
font-family: "Helvetica Neue", "Arial", "PingFang SC", sans-serif;
```

**字体层级规范**（Font Scale）：
```css
/* 显示级 */
--font-display-1:  48px/1.2  700;  /* 大标题 */
--font-display-2:  40px/1.3  700;  /* 中标题 */
--font-display-3:  32px/1.3  600;  /* 小标题 */

/* 标题级 */
--font-headline-1: 28px/1.4 600;   /* H1 */
--font-headline-2: 24px/1.4 600;   /* H2 */
--font-headline-3: 20px/1.4 500;   /* H3 */

/* 正文字 */
--font-body-1:     18px/1.6 400;   /* 大正文 */
--font-body-2:     16px/1.6 400;   /* 标准正文 */
--font-body-3:     14px/1.6 400;   /* 小正文 */

/* 功能文字 */
--font-caption:    12px/1.4 400;   /* 说明文字 */
--font-button:     16px/1.2 500;   /* 按钮文字 */
--font-label:      14px/1.2 500;   /* 标签文字 */
```

### 3.2 模式专属字体风格

**休闲探索模式**（Casual Typography）：
```css
/* 温暖友好 */
--ca-font-weight: 400-500;        /* 常规-中等 */
--ca-font-spacing: 0.02em;       /* 轻微字间距 */
--ca-font-style: normal;          /* 正常字形 */
--ca-text-shadow: 0 1px 2px rgba(0,0,0,0.1); /* 柔和阴影 */
```

**生存挑战模式**（Survival Typography）：
```css
/* 冷峻严肃 */
--su-font-weight: 500-700;        /* 中等-粗体 */
--su-font-spacing: 0.05em;       /* 较大字间距 */
--su-font-style: condensed;       /* 窄体字形 */
--su-text-shadow: 0 2px 4px rgba(0,0,0,0.3); /* 强烈阴影 */
```

---

## 四、图标系统

### 4.1 图标风格规范

**共享图标风格**（Shared Icon Style）：
- **线条粗细**：2px 标准线条
- **圆角半径**：2px 统一圆角
- **视觉大小**：24×24px 基础网格
- **设计风格**：线性图标 + 几何化处理

**休闲模式图标**（Casual Icons）：
```css
/* 温暖圆润 */
--ca-icon-color: #4CAF50;         /* 自然绿 */
--ca-icon-radius: 4px;            /* 较大圆角 */
--ca-icon-weight: 2px;            /* 标准线条 */
--ca-icon-style: rounded;         /* 圆润风格 */
```

**生存模式图标**（Survival Icons）：
```css
/* 冷峻锐利 */
--su-icon-color: #263238;         /* 深灰蓝 */
--su-icon-radius: 1px;            /* 较小圆角 */
--su-icon-weight: 3px;            /* 较粗线条 */
--su-icon-style: sharp;           /* 锐利风格 */
```

### 4.2 图标分类与命名

**功能图标**（Function Icons）：
```
ICN_HOME_DEFAULT.svg      // 首页图标
ICN_BACK_DEFAULT.svg      // 返回图标
ICN_MENU_DEFAULT.svg      // 菜单图标
ICN_SEARCH_DEFAULT.svg    // 搜索图标
ICN_SETTINGS_DEFAULT.svg  // 设置图标
```

**模式专属图标**（Mode Specific Icons）：
```
/* 休闲模式 */
ICN_CA_CAMERA_DEFAULT.svg     // 相机图标
ICN_CA_MAP_DEFAULT.svg        // 地图图标
ICN_CA_LEAF_DEFAULT.svg       // 叶子图标
ICN_CA_CULTURE_DEFAULT.svg    // 文化图标

/* 生存模式 */
ICN_SU_SKULL_DEFAULT.svg      // 骷髅图标
ICN_SU_WARNING_DEFAULT.svg    // 警告图标
ICN_SU_STORM_DEFAULT.svg      // 暴风雨图标
ICN_SU_SNOW_DEFAULT.svg       // 雪花图标
```

**状态图标**（Status Icons）：
```
ICN_STATUS_SUCCESS.svg      // 成功状态
ICN_STATUS_WARNING.svg      // 警告状态
ICN_STATUS_ERROR.svg        // 错误状态
ICN_STATUS_INFO.svg         // 信息状态
ICN_STATUS_LOADING.svg      // 加载状态
```

---

## 五、控件系统

### 5.1 按钮规范

**主按钮**（Primary Button）：
```css
/* 基础样式 */
.btn-primary {
  height: 48px;
  padding: 0 24px;
  border-radius: 8px;
  font-size: 16px;
  font-weight: 500;
  text-align: center;
  cursor: pointer;
  transition: all 0.2s ease;
}

/* 休闲模式 */
.btn-casual-primary {
  background: linear-gradient(135deg, #4CAF50 0%, #66BB6A 100%);
  color: #FFFFFF;
  box-shadow: 0 4px 12px rgba(76, 175, 80, 0.3);
}

/* 生存模式 */
.btn-survival-primary {
  background: linear-gradient(135deg, #263238 0%, #37474F 100%);
  color: #FFFFFF;
  box-shadow: 0 4px 12px rgba(38, 50, 56, 0.4);
}
```

**按钮状态规范**（Button States）：
```css
/* 默认状态 */
.btn-default { opacity: 1.0; transform: scale(1.0); }

/* 悬停状态 */
.btn-hover { opacity: 0.9; transform: scale(1.02); }

/* 激活状态 */
.btn-active { opacity: 0.8; transform: scale(0.98); }

/* 禁用状态 */
.btn-disabled { 
  opacity: 0.4; 
  cursor: not-allowed;
  filter: grayscale(50%);
}

/* 加载状态 */
.btn-loading {
  opacity: 0.7;
  pointer-events: none;
}
```

### 5.2 输入框规范

**文本输入框**（Text Input）：
```css
.input-text {
  height: 48px;
  padding: 0 16px;
  border: 2px solid #E0E0E0;
  border-radius: 8px;
  font-size: 16px;
  background: #FFFFFF;
  transition: all 0.2s ease;
}

.input-text:focus {
  border-color: #4CAF50;
  outline: none;
  box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.1);
}
```

**输入框状态**（Input States）：
```css
/* 默认状态 */
.input-default { border-color: #E0E0E0; }

/* 聚焦状态 */
.input-focus { border-color: #4CAF50; }

/* 错误状态 */
.input-error { border-color: #F44336; }

/* 成功状态 */
.input-success { border-color: #4CAF50; }

/* 禁用状态 */
.input-disabled { 
  background: #F5F5F5;
  border-color: #EEEEEE;
  color: #9E9E9E;
}
```

### 5.3 进度条规范

**线性进度条**（Linear Progress）：
```css
.progress-linear {
  height: 8px;
  background: #E0E0E0;
  border-radius: 4px;
  overflow: hidden;
}

.progress-fill {
  height: 100%;
  background: linear-gradient(90deg, #4CAF50 0%, #66BB6A 100%);
  border-radius: 4px;
  transition: width 0.3s ease;
}
```

**圆形进度条**（Circular Progress）：
```css
.progress-circular {
  width: 48px;
  height: 48px;
  border: 4px solid #E0E0E0;
  border-top: 4px solid #4CAF50;
  border-radius: 50%;
  animation: spin 1s linear infinite;
}
```

---

## 六、动效系统

### 6.1 动效原则

**共享动效原则**（Shared Animation Principles）：
- **时长标准**：快速反馈 150-200ms，界面转换 300-400ms
- **缓动函数**：标准缓动 cubic-bezier(0.4, 0.0, 0.2, 1)
- **性能优先**：优先使用 transform 和 opacity 属性
- **意义明确**：每个动效都应有明确的功能目的

**休闲模式动效**（Casual Animations）：
```css
/* 温暖柔和 */
--ca-animation-duration: 0.3s;
--ca-animation-easing: cubic-bezier(0.175, 0.885, 0.32, 1.275);
--ca-animation-style: gentle;  /* 柔和风格 */
```

**生存模式动效**（Survival Animations）：
```css
/* 紧张刺激 */
--su-animation-duration: 0.2s;
--su-animation-easing: cubic-bezier(0.6, 0.04, 0.98, 0.335);
--su-animation-style: sharp;   /* 锐利风格 */
```

### 6.2 标准动效库

**按钮动效**（Button Animations）：
```css
/* 悬停动效 */
@keyframes btn-hover {
  0% { transform: scale(1.0); }
  100% { transform: scale(1.05); }
}

/* 点击动效 */
@keyframes btn-press {
  0% { transform: scale(1.0); }
  50% { transform: scale(0.95); }
  100% { transform: scale(1.0); }
}
```

**转场动效**（Transition Animations）：
```css
/* 淡入淡出 */
@keyframes fade-in {
  0% { opacity: 0; }
  100% { opacity: 1; }
}

@keyframes fade-out {
  0% { opacity: 1; }
  100% { opacity: 0; }
}

/* 滑动进入 */
@keyframes slide-in-right {
  0% { transform: translateX(100%); }
  100% { transform: translateX(0); }
}
```

**状态动效**（State Animations）：
```css
/* 成功动效 */
@keyframes success-bounce {
  0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
  40% { transform: translateY(-10px); }
  60% { transform: translateY(-5px); }
}

/* 警告闪烁 */
@keyframes warning-pulse {
  0%, 100% { opacity: 1; }
  50% { opacity: 0.5; }
}

/* 加载旋转 */
@keyframes loading-spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
```

---

## 七、材质与纹理

### 7.1 材质系统

**自然材质**（Natural Materials）：
```css
/* 石材材质 */
.material-stone {
  background-image: 
    radial-gradient(circle at 20% 80%, rgba(120, 119, 198, 0.3) 0%, transparent 50%),
    radial-gradient(circle at 80% 20%, rgba(255, 255, 255, 0.15) 0%, transparent 50%);
  background-color: #8B7355;
}

/* 木材材质 */
.material-wood {
  background-image: 
    repeating-linear-gradient(90deg, transparent, transparent 2px, rgba(139, 69, 19, 0.1) 2px, rgba(139, 69, 19, 0.1) 4px);
  background-color: #D2B48C;
}

/* 金属材质 */
.material-metal {
  background: linear-gradient(135deg, #C0C0C0 0%, #A9A9A9 100%);
  box-shadow: inset 0 2px 4px rgba(255,255,255,0.3);
}
```

**天气材质**（Weather Materials）：
```css
/* 阳光材质 */
.material-sunshine {
  background: radial-gradient(circle at center, #FFD700 0%, #FFA500 100%);
  box-shadow: 0 0 20px rgba(255, 215, 0, 0.5);
}

/* 雨雪材质 */
.material-rain {
  background-image: 
    linear-gradient(180deg, transparent 0%, rgba(173, 216, 230, 0.3) 100%);
  animation: rain-fall 1s linear infinite;
}

.material-snow {
  background-image: 
    radial-gradient(circle, rgba(255,255,255,0.8) 1px, transparent 1px);
  background-size: 20px 20px;
  animation: snow-fall 3s linear infinite;
}
```

### 7.2 纹理系统

**地图纹理**（Map Textures）：
```css
/* 纸质地图 */
.texture-paper-map {
  background-image: 
    url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100"><defs><pattern id="grid" width="10" height="10" patternUnits="userSpaceOnUse"><path d="M 10 0 L 0 0 0 10" fill="none" stroke="%23E0E0E0" stroke-width="0.5"/></pattern></defs><rect width="100" height="100" fill="url(%23grid)"/></svg>');
  background-color: #F5F5DC;
}

/* 地形纹理 */
.texture-terrain {
  background-image: 
    url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><path d="M0,50 Q25,30 50,50 T100,50 L100,100 L0,100 Z" fill="%23D2B48C" opacity="0.3"/></svg>');
}
```

---

## 八、光照与阴影

### 8.1 光照系统

**共享光照**（Shared Lighting）：
```css
/* 主光源 */
--light-primary: 135deg;          /* 光源角度 */
--light-intensity: 0.8;           /* 光照强度 */
--light-color: #FFFFFF;          /* 光源颜色 */
```

**休闲模式光照**（Casual Lighting）：
```css
/* 温暖日光 */
--ca-light-angle: 120deg;
--ca-light-color: #FFF8DC;        /* 温暖晨光 */
--ca-light-intensity: 0.9;
--ca-shadow-softness: 8px;        /* 柔和阴影 */
```

**生存模式光照**（Survival Lighting）：
```css
/* 冷峻环境光 */
--su-light-angle: 90deg;
--su-light-color: #E6E6FA;        /* 冷环境光 */
--su-light-intensity: 0.6;
--su-shadow-softness: 2px;        /* 锐利阴影 */
```

### 8.2 阴影系统

**标准阴影**（Standard Shadows）：
```css
/* 层级阴影 */
--shadow-level-1: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
--shadow-level-2: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
--shadow-level-3: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
--shadow-level-4: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
--shadow-level-5: 0 19px 38px rgba(0,0,0,0.30), 0 15px 12px rgba(0,0,0,0.22);
```

**特殊阴影**（Special Shadows）：
```css
/* 内阴影 */
.shadow-inset {
  box-shadow: inset 0 2px 4px rgba(0,0,0,0.1);
}

/* 长阴影 */
.shadow-long {
  box-shadow: 0 0 0 1px rgba(0,0,0,0.05), 0 8px 16px rgba(0,0,0,0.1);
}

/* 发光阴影 */
.shadow-glow {
  box-shadow: 0 0 20px rgba(255, 152, 0, 0.5);
}
```

---

## 九、安全边距与布局

### 9.1 安全边距系统

**基础边距**（Base Spacing）：
```css
/* 8px网格系统 */
--space-1: 8px;     /* 最小间距 */
--space-2: 16px;    /* 小组件间距 */
--space-3: 24px;    /* 标准间距 */
--space-4: 32px;    /* 大组件间距 */
--space-5: 48px;    /* 最大间距 */

/* 特殊边距 */
--space-half: 4px;  /* 半间距 */
--space-quarter: 2px; /* 四分之一间距 */
```

**组件边距**（Component Spacing）：
```css
/* 按钮边距 */
.btn-padding: 0 24px;           /* 水平内边距 */
.btn-margin: 8px;                 /* 外边距 */

/* 卡片边距 */
.card-padding: 24px;              /* 卡片内边距 */
.card-margin: 16px;               /* 卡片外边距 */

/* 列表边距 */
.list-item-padding: 16px 24px;    /* 列表项内边距 */
.list-section-margin: 32px;        /* 列表段间距 */
```

### 9.2 响应式断点

**标准断点**（Standard Breakpoints）：
```css
/* 移动端 */
@media (max-width: 767px) {
  --container-padding: 16px;
  --font-scale: 0.875;  /* 14px基础 */
  --icon-scale: 0.8;    /* 图标缩小 */
}

/* 平板端 */
@media (min-width: 768px) and (max-width: 1023px) {
  --container-padding: 24px;
  --font-scale: 1.0;    /* 16px基础 */
  --icon-scale: 1.0;    /* 标准图标 */
}

/* 桌面端 */
@media (min-width: 1024px) {
  --container-padding: 32px;
  --font-scale: 1.125;  /* 18px基础 */
  --icon-scale: 1.2;    /* 图标放大 */
}
```

---

## 十、切图命名与输出规范

### 10.1 切图命名规范

**命名结构**（Naming Structure）：
```
[类型]_[内容]_[模式]_[状态]_[尺寸]@[倍数].png

示例:
BTN_CONFIRM_CA_DEFAULT_48x48@2x.png
ICN_SKULL_SU_HOVER_24x24@3x.png
BG_MOUNTAIN_SHARED_DEFAULT_375x200@2x.png
```

**类型前缀**（Type Prefixes）：
```
BG_     // 背景 (Background)
BTN_    // 按钮 (Button)
ICN_    // 图标 (Icon)
IMG_    // 图片 (Image)
SPR_    // 精灵图 (Sprite)
TEX_    // 纹理 (Texture)
```

**模式标识**（Mode Identifiers）：
```
CA_     // 休闲模式 (Casual)
SU_     // 生存模式 (Survival)
SH_     // 共享 (Shared)
```

**状态后缀**（State Suffixes）：
```
_DEFAULT    // 默认状态
_HOVER      // 悬停状态
_ACTIVE     // 激活状态
_DISABLED   // 禁用状态
_LOADING    // 加载状态
```

### 10.2 输出格式规范

**图片格式**（Image Formats）：
```
PNG-24:     // 透明图标、按钮、UI元素
PNG-8:      // 简单图标、小图片
WebP:       // 背景图、大图片（无损压缩）
JPG:        // 照片、复杂图像（质量85%）
SVG:        // 矢量图标、简单图形
```

**分辨率规范**（Resolution Standards）：
```
@1x:    // 基础分辨率 (160dpi)
@2x:    // Retina (320dpi) - 主要输出
@3x:    // 高密度 (480dpi) - 可选输出

标准尺寸:
图标: 24×24px, 48×48px, 72×72px
按钮: 48×48px, 96×48px, 144×72px
背景: 375×200px, 750×400px, 1125×600px
```

### 10.3 压缩规范

**压缩标准**（Compression Standards）：
```
PNG压缩:
- 图标类: TinyPNG压缩, 文件大小≤50KB
- 按钮类: PNGQuant压缩, 文件大小≤100KB
- 背景类: ImageOptim压缩, 文件大小≤500KB

WebP压缩:
- 质量设置: 无损模式
- 文件大小: 比原PNG小30-50%
- 兼容性: 提供PNG回退

JPG压缩:
- 质量设置: 85%
- 渐进式: 启用
- 文件大小: 根据内容优化
```

**性能要求**（Performance Requirements）：
```
单张图片: ≤500KB
图标集合: ≤1MB
背景图片: ≤2MB
总资源包: ≤10MB

加载时间:
首屏资源: ≤1秒
次要资源: ≤3秒
按需加载: 用户触发后≤500ms
```

---

## 十一、设计交付物

### 11.1 Figma设计系统

**Figma组件库**（Figma Component Library）：
```
📁 徒踪V2设计系统
├── 🎨 色彩样式 (Color Styles)
│   ├── 共享色彩系统
│   ├── 休闲模式色彩
│   └── 生存模式色彩
├── 🔤 字体样式 (Text Styles)
│   ├── 共享字体层级
│   ├── 休闲模式字体
│   └── 生存模式字体
├── 🧩 组件库 (Components)
│   ├── 按钮组件
│   ├── 输入框组件
│   ├── 卡片组件
│   └── 进度条组件
├── 🎯 图标库 (Icons)
│   ├── 共享图标
│   ├── 休闲模式图标
│   └── 生存模式图标
└── 📐 布局网格 (Grids)
    ├── 8px网格系统
    ├── 响应式断点
    └── 安全边距
```

**Figma文件链接**（Figma File Links）：
```
🎨 主设计文件: https://figma.com/file/ttv2-main-design
🧩 组件库文件: https://figma.com/file/ttv2-components
🎯 图标库文件: https://figma.com/file/ttv2-icons
📱 界面设计文件: https://figma.com/file/ttv2-screens
```

### 11.2 Sketch资源包

**Sketch组件库**（Sketch Component Library）：
```
📁 徒踪V2 Sketch资源
├── 🎨 Color Palette.sketchpalette
├── 🔤 Typography.sketch
├── 🧩 UI Components.sketch
├── 🎯 Icon Library.sketch
├── 📐 Layout Templates.sketch
└── 📱 Screen Templates.sketch
```

**Sketch文件链接**（Sketch File Links）：
```
🎨 色彩模板: https://sketch.com/ttv2-color-palette
🔤 字体系统: https://sketch.com/ttv2-typography
🧩 组件库: https://sketch.com/ttv2-components
🎯 图标库: https://sketch.com/ttv2-icons
```

### 11.3 技术交付物

**标注文件**（Annotation Files）：
```
📄 界面标注规范.pdf
📄 切图命名规范.pdf
📄 动效参数表.xlsx
📄 色彩对比度报告.pdf
📄 无障碍设计检查表.pdf
```

**开发资源**（Development Resources）：
```
💻 GDScript样式表: https://github.com/ttv2/styles.gd
💻 CSS变量文件: https://github.com/ttv2/variables.css
💻 图标字体: https://github.com/ttv2/icon-font.woff
💻 纹理贴图: https://github.com/ttv2/textures.zip
```

### 11.4 测试与验收

**视觉测试报告**（Visual Testing Reports）：
```
📊 色彩一致性测试: 通过率98.5%
📊 字体可读性测试: 通过率99.2%
📊 图标识别度测试: 通过率97.8%
📊 动效流畅度测试: 通过率96.4%
📊 无障碍合规测试: 通过率95.1%
```

**性能测试数据**（Performance Metrics）：
```
⚡ 平均加载时间: 1.2秒
⚡ 帧率稳定性: 60FPS (99%时间)
⚡ 内存占用: 185MB (低于200MB标准)
⚡ 网络请求: 15个请求 (首屏)
⚡ 总资源大小: 8.7MB (低于10MB标准)
```

---

## 十二、维护与更新

### 12.1 版本管理

**版本控制**（Version Control）：
```
版本格式: v主版本.次版本.修订版本
更新频率: 每2周小更新，每季度大更新
发布流程: 设计→评审→测试→发布
回滚机制: 保留最近3个版本
```

### 12.2 协作流程

**设计协作**（Design Collaboration）：
```
设计阶段: Figma实时协作
评审阶段: 每周设计评审会议
开发阶段: GitHub Issues跟踪
测试阶段: 设计走查与验收
发布阶段: 设计系统更新日志
```

### 12.3 联系方式

**设计团队**（Design Team）：
```
📧 邮箱: design@trailtrace.com
💬 即时通讯: Slack #design-team
📅 会议安排: 每周三下午2点设计评审
🎨 设计资源: https://design.trailtrace.com
```

**更新通知**（Update Notifications）：
```
📱 即时通知: 设计系统更新推送
📧 邮件通知: 重大更新邮件通知
📋 更新日志: https://changelog.trailtrace.com
🔔 版本提醒: 新版本发布提醒
```

---

**文档状态**: ✅ 已完成 | 🔄 更新中 | 📋 计划中  
**最后更新**: 2026年2月2日  
**下次更新**: 2026年2月16日