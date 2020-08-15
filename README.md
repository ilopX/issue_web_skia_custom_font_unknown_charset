The characters '(' and ')' doesn't render on the web with some fonts when Skia is enabled. The characters are rendered when I disable custom font.

![fib](https://user-images.githubusercontent.com/8049534/90315193-23c1b180-df22-11ea-9850-0207bdb980c2.PNG)
[live](https://ilopx.github.io/issue_web_skia_custom_font_unknown_charset)


<details>
  <summary>😊flutter build web </summary>

![on](https://user-images.githubusercontent.com/8049534/90314409-3a650a00-df1c-11ea-8bef-d7027d606f97.PNG)
</details>

<details>
  <summary>😕flutter build web --dart-define=FLUTTER_WEB_USE_SKIA=true </summary>

![two](https://user-images.githubusercontent.com/8049534/90314470-af384400-df1c-11ea-9359-644089957c38.PNG)


</details>

<details>
  <summary>Minimal reproducible code sample</summary>

`pubspec.yaml`
```yaml
flutter:
  uses-material-design: true
  fonts:
    - family: Segoe_form_assets
      fonts:
        - asset: assets/Segoe_UI.ttf
```

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final defaultFont = TextStyle(
      fontFamily: 'Sergeo UI',
      fontSize: 30,
    );
    final customFont = TextStyle(
      fontFamily: 'Segoe_form_assets',
      fontSize: 30,
    );

    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('(', style: defaultFont,),
                  Text('.',),
                  Text(')', style: defaultFont,),
                  Text('(', style: customFont,),
                  Text('.',),
                  Text(')', style: customFont,),
                ],
              ),
              Text('^'),
              Text('(~~)'),
            ],
          ),
        ) ,
      ),
    );
  }
}
```
</details>

<details>
  <summary>flutter doctor -v</summary>

```
[√] Flutter (Channel master, 1.21.0-10.0.pre.111, on Microsoft Windows [Version 10.0.18363.535], locale en-US)
    • Flutter version 1.21.0-10.0.pre.111 at C:\flutter_origin
    • Framework revision d1583fc39b (11 hours ago), 2020-08-14 20:09:41 -0700
    • Engine revision 7571e7c380
    • Dart version 2.10.0 (build 2.10.0-11.0.dev)


[√] Android toolchain - develop for Android devices (Android SDK version 29.0.2)
    • Android SDK at C:\Users\ilopX\AppData\Local\Android\sdk
    • Platform android-29, build-tools 29.0.2
    • Java binary at: C:\Program Files\Android\Android Studio\jre\bin\java
    • Java version OpenJDK Runtime Environment (build 1.8.0_202-release-1483-b03)
    • All Android licenses accepted.

[√] Chrome - develop for the web
    • Chrome at C:\Program Files (x86)\Google\Chrome\Application\chrome.exe

[√] Visual Studio - develop for Windows (Visual Studio Enterprise 2019 16.4.2)
    • Visual Studio at C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise
    • Visual Studio Enterprise 2019 version 16.4.29613.14
    • Windows 10 SDK version 10.0.18362.0

[√] Android Studio (version 3.5)
    • Android Studio at C:\Program Files\Android\Android Studio
    • Flutter plugin version 42.1.1
    • Dart plugin version 191.8593
    • Java version OpenJDK Runtime Environment (build 1.8.0_202-release-1483-b03)

[√] IntelliJ IDEA Ultimate Edition (version 2019.3)
    • IntelliJ at C:\Program Files\JetBrains\IntelliJ IDEA 2019.3.1
    • Flutter plugin version 45.1.2
    • Dart plugin version 193.7361

[√] Connected device (3 available)
    • Windows (desktop) • windows    • windows-x64    • Microsoft Windows [Version 10.0.18363.535]
    • Web Server (web)  • web-server • web-javascript • Flutter Tools
    • Chrome (web)      • chrome     • web-javascript • Google Chrome 84.0.4147.125

• No issues found!
```

</details>
