import 'package:flutter/material.dart';
import 'package:dpi_shikanoker_on_gdbdpi/src/dep/conf_gdpi.dart';
import 'dart:io';
import 'package:system_tray/system_tray.dart';
import 'package:window_manager/window_manager.dart';
import 'about.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WindowListener {
  bool isProcessRunning = false;
  List<bool> settings = [true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false];
  Process? _process;
  List<String> command = ['--blacklist', 'lib/src/goodbyedpi/russia-youtube.txt', '--blacklist', 'lib/src/goodbyedpi/russia-blacklist.txt'], defaultCommand = ['-9', '--blacklist', 'lib/src/goodbyedpi/russia-youtube.txt', '--blacklist', 'lib/src/goodbyedpi/russia-blacklist.txt'], commandWithCustomconfig = ['-9', '--blacklist', 'lib/src/goodbyedpi/russia-youtube.txt', '--blacklist', 'lib/src/goodbyedpi/russia-blacklist.txt'];
  List functions = gdpi_functions;
  Future<void> _startProcess() async {
    _process = await Process.start(pathG, settings[0] ? defaultCommand : settings[1] ? commandWithCustomconfig : command);
    debugPrint('Process started with ${settings[0] ? defaultCommand : settings[1] ? commandWithCustomconfig : command} arguments');
    setState(() {});
  }

  Future<void> _killProcess() async {
    if (_process != null) {
      _process!.kill();
      _process = null;
      debugPrint('Process killed');
      setState(() {});
    }
  }

  @override
  void initState() {
    windowManager.addListener(this);
    _initSystemTray();
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await windowManager.setPreventClose(true);
    setState(() {
      
    });
  }

  Future<void> _initSystemTray() async {
    final AppWindow appWindow = AppWindow();
    final SystemTray systemTray = SystemTray();

    // We first init the systray menu
    await systemTray.initSystemTray(
      title: "system tray",
      iconPath: 'assets/icon.ico'
    );

    // create context menu
    final Menu menu = Menu();
    await menu.buildFrom([
      MenuItemLabel(label: 'Открыть', onClicked: (menuItem) {windowManager.show();}),
      MenuItemLabel(label: isProcessRunning ? 'Отключить' : 'Запустить', onClicked: (menuItem) {
        setState(() {
                
                isProcessRunning = !isProcessRunning;
                if (isProcessRunning) {
                  _startProcess();
                } else{
                  _killProcess();
                }
                _initSystemTray();
              });
      }),
      MenuItemLabel(label: 'Выйти', onClicked: (menuItem) async {
        await _killProcess();
        await windowManager.destroy();
      }),
    ]);

    await systemTray.setContextMenu(menu);
    systemTray.registerSystemTrayEventHandler((eventName) {
      debugPrint("eventName: $eventName");
      if (eventName == kSystemTrayEventClick) {
        Platform.isWindows ? appWindow.show() : systemTray.popUpContextMenu();
      } else if (eventName == kSystemTrayEventRightClick) {
        Platform.isWindows ? systemTray.popUpContextMenu() : appWindow.show();
      }
    });
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  List<DropdownMenuItem> get _getConfigsAsItems {
    List<DropdownMenuItem> menuItems = [];
    for (int i = 1; i <= 9; i++) {
      menuItems.add(
        DropdownMenuItem(
          value: '-$i',
          child: Text('-$i'),
        )
      );
    }
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DPIшиканокер', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage()));
              }, 
              icon: const Icon(Icons.question_mark_rounded)
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Card(
            child: SizedBox(
              height: 350,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: functions.length,
                  itemBuilder: (BuildContext context, int index) {
                    TextEditingController controller = TextEditingController();
                    if (functions[index][2]){
                      controller.text = functions[index].length == 4 ? functions[index][3] : '';
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(functions[index][0], style: const TextStyle(fontWeight: FontWeight.w600),),
                          ),
                          if (functions[index][2] && !settings[0] && settings[index] && !settings[1]) 
                            SizedBox(
                              width: 70,
                              height: 45,
                              child: TextField(
                                controller: controller,
                                onSubmitted: (value) {
                                  setState(() {
                                    final indexInCommand = command.indexOf(functions[index][1]);
                                    command[indexInCommand + 1] = value;
                                    functions[index][3] = value;
                                    debugPrint(functions[index][3]);
                                  });
                                },
                                onTapOutside: (event) {
                                  setState(() {
                                    final indexInCommand = command.indexOf(functions[index][1]);
                                    command[indexInCommand + 1] = controller.text;
                                    functions[index][3] = controller.text;
                                    FocusScope.of(context).requestFocus(FocusNode());
                                  });
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          if (functions[index][1] == '' && !settings[0] && settings[index])
                            SizedBox(
                              width: 70,
                              height: 45,
                              child: DropdownButtonFormField(
                                onChanged: (value) {
                                  setState(() {
                                    commandWithCustomconfig[0] = value;
                                  });
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder()
                                ),
                                value: commandWithCustomconfig[0],
                                items: _getConfigsAsItems,
                              ),
                            ),
                          Switch(value: settings[index], onChanged: (!settings[0] && !settings[1] || index == 0 || (!settings[0] && index == 1)) ? (bool value) {setState(() {
                            settings[index] = value;
                            if (value && functions[index][1] != '') {
                              command.add(functions[index][1]);
                              if (functions[index][2]){
                                command.add(functions[index][3]);
                              }
                            } else {
                              final indexInCommand = command.indexOf(functions[index][1]);
                              if (indexInCommand != -1) {
                                command.removeAt(indexInCommand);
                                if (functions[index][2]) {
                                  command.removeAt(indexInCommand);
                                }
                              }
                            }
                          });} : null)
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: ElevatedButton(onPressed: () {setState(() {
              isProcessRunning = !isProcessRunning;
              if (isProcessRunning) {
                _startProcess();
              } else{
                _killProcess();
              }
              _initSystemTray();
            });}, child: isProcessRunning ? _process != null ? const Text('Отключить') : const LinearProgressIndicator() : const Text('Запустить'))
          )
        ],
      )
    );
  }
  @override
  void onWindowClose() async {
    bool _isPreventClose = await windowManager.isPreventClose();
    if (_isPreventClose) {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Закрыть?'),
            actions: [
              TextButton(
                child: const Text('В трей'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  await windowManager.hide();
                },
              ),
              TextButton(
                child: const Text('Закрыть'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  await _killProcess();
                  await windowManager.hide();
                  await windowManager.destroy();
                },
              ),
            ],
          );
        },
      );
    }
    super.onWindowClose();
  }
  @override
  void onWindowFocus() {
    setState(() {});
  }
}