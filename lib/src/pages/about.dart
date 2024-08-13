import 'package:flutter/material.dart';
import 'package:dpi_shikanoker_on_gdbdpi/src/dep/conf_gdpi.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('О приложении'),),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 75,
              backgroundImage: AssetImage('assets/deadend.jpg'),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            const Text('Разработано и поддерживается axeinstd', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            const Divider(),
            const Padding(padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text('DPIшиканокер (ДиПиАй шиканокер) - приложение, созданное на flutter для удобства использования GoodByeDPI, т.е это графический интерфейс для нее. '),
            ),
            const Text('Создано в образовательных целях и не призывает', style: TextStyle(fontWeight: FontWeight.bold),),
            const Text('нарушать, обходить законодательство РФ.', style: TextStyle(fontWeight: FontWeight.bold),),
            const Divider(),
            const Text('3rd-party software: '),
            const Text('Thanks ValdikSS for creation GoodbyeDPI'),
            const Divider(),
            Text('DPIшиканокер, версия $version')
          ]
        ),
      )
    );
  }
}