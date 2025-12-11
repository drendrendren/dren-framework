# drendrendren basic framework

빠른 앱 개발을 위한 framework

---

## 소개
Flutter로 앱 개발 시 반복되는
- 라우팅(go router)
- 의존성 주입(DI)
- assets 관리(앱 로고, 앱 이름, splash screen)
를 줄이기 위해 만들게 됨.

## 1.0.0
*2025.12.12*

## 변경해야 할 것
- **앱 이름**
**Android**: drenfw/android/app/src/main/AndroidManifest.xml 에서
<application android:label="앱 이름"> 변경
**ios**: drenfw/ios/Runner/Info.plist
<key>CFBundleDisplayName</key>
<string>앱 이름</string> 변경

- **앱 로고**
1. drenfw/assets/images/app_logo.jpg 변경
2. terminal에서 "flutter pub run flutter_launcher_icons" 입력
3. 완료 메세지 확인
이미지에 alpha 적용 해제하기(App Store에서 alpha 켜져 있는 이미지일 시 반려됨)

- **appbar 앱 로고**
1. drenfw/assets/images/appbar_logo.png 변경

- **splash screen 로고**
1. drenfw/assets/images/splash_screen_logo.png 변경
2. terminal에서 "flutter pub run flutter_native_splash:create" 입력
3. 완료 메세지 확인
