import 'dart:io';

import 'package:package_info_plus/package_info_plus.dart';

class Log {
  DateTime createdAt;
  Object exception;
  StackTrace stackTrace;
  Object? objectType;
  String? fileName;
  String platform = Platform.operatingSystem;
  String platformVersion = Platform.operatingSystemVersion;
  String? appVersion;

  Log({
    required this.exception,
    required this.stackTrace,
    this.objectType,
    this.fileName,
  }) : createdAt = DateTime.now() {
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      appVersion = 'unit testing';
    } else {
      PackageInfo.fromPlatform().then(
          (value) => appVersion = '${value.version}+${value.buildNumber}');
    }
  }

  @override
  String toString() {
    return '$createdAt: $fileName - ${objectType.runtimeType} - ${exception.toString()} - $platform - $appVersion\n$stackTrace\n';
  }
}
