# racMart resume
This is my app multiplatform with my personal information and skills.

# First Steps
1. flutter doctor -v
2. flutter config --no-cli-animations
3. flutter create --platforms web

# Web debug
flutter run -d web-server --web-port 5000

# Android debug
1. adb connect host.docker.internal:5555
2. adb tcpip 5555