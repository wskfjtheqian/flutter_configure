# configure

Save configuration to JSON file

## support

-[x] Android
-[x] Ios
-[x] Web
-[x] Mac
-[x] Windows
-[x] Linux

## Getting Started

```yaml
dependencies:
  ...
  configure: 1.0.0
```

### example
```dart
import 'package:configure/configure.dart';
...
    Configure.instance.then((value) {
      value.setString("Name", "heqian");
    });
```