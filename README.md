# 日常计划 Flutter 应用

## 📱 应用简介

这是一个使用 **Flutter** 开发的日常计划管理应用，可以直接构建成 APK 安装到安卓手机上。

## ✨ 功能特性

- 📊 **今日计划** - 查看今日运动和学习统计
- 🏃 **运动记录** - 记录跑步等运动活动
- 📚 **学习记录** - 记录学习科目和进度
- 📈 **统计分析** - 查看历史数据统计
- ☁️ **云端同步** - 数据自动保存到云端（Supabase）

## 🚀 快速开始

### 方法1：使用一键构建脚本（推荐）

1. 确保已安装 Flutter SDK
2. 双击运行 `构建APK.bat`
3. 等待构建完成
4. 在 `build\app\outputs\flutter-apk\` 目录找到 `app-release.apk`
5. 传输到手机安装

### 方法2：使用命令行

```bash
# 1. 进入项目目录
cd "D:\我的文档\日常计划Flutter应用"

# 2. 获取依赖
flutter pub get

# 3. 构建APK
flutter build apk --release

# 4. APK位置
# build\app\outputs\flutter-apk\app-release.apk
```

## 📋 环境要求

### 开发环境
- Flutter SDK 3.0+
- Dart SDK 3.0+
- Windows 10/11

### 运行环境
- Android 5.0 (API 21) 或更高版本
- 支持几乎所有安卓手机

## 📂 项目结构

```
日常计划Flutter应用/
├── lib/
│   ├── main.dart                    # 应用入口
│   ├── models/
│   │   └── models.dart              # 数据模型
│   ├── services/
│   │   └── database_service.dart    # 数据库服务
│   ├── providers/
│   │   └── data_provider.dart       # 状态管理
│   └── screens/                     # 页面
│       ├── home_screen.dart         # 主页（底部导航）
│       ├── today_screen.dart        # 今日计划页
│       ├── exercise_screen.dart     # 运动记录页
│       ├── study_screen.dart        # 学习记录页
│       └── stats_screen.dart        # 统计分析页
├── android/                         # Android 配置
├── pubspec.yaml                     # 依赖配置
├── 构建APK.bat                      # 一键构建脚本
└── 构建APK指南.md                   # 详细构建指南
```

## 🛠️ 技术栈

- **Flutter 3.x** - 跨平台UI框架
- **Dart 3.x** - 编程语言
- **Provider** - 状态管理
- **Supabase** - 云端数据库
- **Material Design 3** - UI设计规范

## 📖 详细文档

- [构建APK指南.md](构建APK指南.md) - 完整的APK构建教程
- [安装说明.md](安装说明.md) - 手机安装步骤

## 🎨 应用截图

安装后您将看到：
- ✅ 清新的绿色主题界面
- ✅ 直观的数据统计卡片
- ✅ 流畅的页面切换动画
- ✅ 简洁的操作流程

## 📝 使用说明

### 添加运动记录
1. 点击底部"运动"标签
2. 点击右下角"+"按钮
3. 填写运动信息（类型、时长、备注）
4. 点击"保存"

### 添加学习记录
1. 点击底部"学习"标签
2. 点击右下角"+"按钮
3. 选择学习科目
4. 填写学习时长和进度
5. 点击"保存"

### 查看统计
1. 点击底部"今日"标签查看今日统计
2. 点击底部"统计"标签查看历史数据

## ❓ 常见问题

### Q: 如何安装 Flutter？
A: 访问 https://docs.flutter.dev/get-started/install/windows 下载并按照指引安装。

### Q: 构建失败怎么办？
A: 
1. 运行 `flutter doctor` 检查环境
2. 运行 `flutter clean` 清理项目
3. 重新运行 `flutter pub get`
4. 再次尝试构建

### Q: APK 文件在哪里？
A: 构建成功后，APK 位于：
```
build\app\outputs\flutter-apk\app-release.apk
```

### Q: 手机无法安装？
A: 需要在手机设置中允许"安装未知应用"：
- 设置 → 安全 → 未知来源 → 允许

### Q: 数据会丢失吗？
A: 不会。数据保存在云端（Supabase），换手机也能同步。

## 🔄 更新日志

### v1.0.0 (2026-02-03)
- ✅ 初始版本发布
- ✅ 实现今日计划功能
- ✅ 实现运动记录功能
- ✅ 实现学习记录功能
- ✅ 实现统计分析功能
- ✅ 集成 Supabase 云端数据库

## 📞 技术支持

如果遇到问题：
1. 查看 [构建APK指南.md](构建APK指南.md)
2. 运行 `flutter doctor -v` 检查环境
3. 查看 Flutter 官方文档

## 📄 许可证

MIT License

---

**开始您的每日进步之旅！** 🎉💪

## 🎯 下一步

1. **安装 Flutter** - 如果还没安装
2. **运行构建脚本** - 双击 `构建APK.bat`
3. **传输到手机** - 将APK发送到手机
4. **安装使用** - 开始记录您的每日计划

**预计时间：首次构建约 15-20 分钟，后续构建 2-3 分钟**
