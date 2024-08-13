import 'package:flutter/material.dart';
import 'package:dpi_shikanoker_on_gdbdpi/src/pages/loading_page.dart';
import 'package:flutter/services.dart';
import 'package:window_manager/window_manager.dart';
import 'dart:io';
import 'package:win32/win32.dart';
import 'package:ffi/ffi.dart';
import 'package:dpi_shikanoker_on_gdbdpi/src/dep/conf_gdpi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  await windowManager.setSize(const Size(400, 500));
  await windowManager.setResizable(false);
  windowManager.setIcon('assets/icon.ico');
  windowManager.setTitle('DPIshikanoker');
  windowManager.center();

  bool pathExists = await File(pathG).exists();
  if (!pathExists){
    final mbox = MessageBox(
      NULL,
      'Не удалось найти компонент goodbyedpi.exe. Попробуйте переустановить DPIshikanoker.'.toNativeUtf16(),
      'Не удалось найти файл'.toNativeUtf16(),
      MESSAGEBOX_STYLE.MB_ICONERROR | MESSAGEBOX_STYLE.MB_OK
    );
    switch (mbox) {
      case MESSAGEBOX_RESULT.IDOK:
        exit(1);
    }
  }
  else{
    runApp(MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent, brightness: Brightness.light),
        cardTheme: CardTheme(color: HSLColor.fromColor(Colors.greenAccent).withLightness(0.75).toColor())
        ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent, brightness: Brightness.dark),
        ),
      themeMode: ThemeMode.dark,
      home: const LoadingScreen(),
    ));
  }
}