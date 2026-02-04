@echo off
chcp 65001 >nul
echo ========================================
echo    日常计划应用 - APK构建工具
echo ========================================
echo.

echo [1/4] 检查 Flutter 环境...
flutter --version >nul 2>&1
if errorlevel 1 (
    echo ❌ 错误：未找到 Flutter
    echo.
    echo 请先安装 Flutter SDK：
    echo https://docs.flutter.dev/get-started/install/windows
    echo.
    pause
    exit /b 1
)
echo ✅ Flutter 环境正常
echo.

echo [2/4] 获取项目依赖...
call flutter pub get
if errorlevel 1 (
    echo ❌ 获取依赖失败
    pause
    exit /b 1
)
echo ✅ 依赖获取完成
echo.

echo [3/4] 开始构建APK（这可能需要几分钟）...
call flutter build apk --release
if errorlevel 1 (
    echo ❌ 构建失败
    echo.
    echo 请查看上方错误信息，或运行以下命令查看详细日志：
    echo flutter build apk --release --verbose
    echo.
    pause
    exit /b 1
)
echo ✅ APK构建成功！
echo.

echo [4/4] 打开APK文件位置...
start "" "%CD%\build\app\outputs\flutter-apk"
echo.

echo ========================================
echo    构建完成！
echo ========================================
echo.
echo APK文件位置：
echo %CD%\build\app\outputs\flutter-apk\app-release.apk
echo.
echo 文件名：app-release.apk
echo.
echo 下一步：
echo 1. 将APK文件传输到手机
echo 2. 在手机上点击安装
echo 3. 允许"安装未知应用"权限
echo 4. 安装完成，开始使用！
echo.
echo ========================================
pause
