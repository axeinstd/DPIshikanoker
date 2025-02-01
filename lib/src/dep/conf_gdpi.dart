// format: [Description, command, needValue, defaultValue]
import 'package:dpi_shikanoker_on_gdbdpi/src/translation/ru.dart';
import 'package:dpi_shikanoker_on_gdbdpi/src/translation/en.dart';

// List gdpi_functions = [
//   ['Использовать лучший конфиг (рекомендованно)', '-9 --fake-gen 5 --fake-from-hex 160301FFFF01FFFFFF0303594F5552204144564552544953454D454E542048455245202D202431302F6D6F000000000009000000050003000000', false],
//   ['Использовать другой предустановленный конфиг (1 - 9)', '', false],
//   ['Блокировать пассивный DPI', '-p', false],
//   ['Блокировать HTTP3/QUIC', '-q', false],
//   ['Заменить Host на hoSt', '-r', false],
//   ['Убрать пробел между заголовком хоста и его значением', 's', false],
//   ['Хаотичный регистр заголовка хоста', '-m', false],
//   ['Задать HTTP фрагментации свое значение', '-f', true, '2'],
//   ['Использовать постоянную http фрагментацию и задать ей значение', '-k', true],
//   ['Не ждать первого сегмента если включена постоянная HTTP фрагментация', '-n', false],
//   ['Задать HTTPS фрагментации свое значение', '-e', true, '2'],
//   ['Использовать фейковые запросы и уменьшать TTL', '--auto-ttl', false],
//   ['Использовать неправильный checksum пакета', '--wrong-chksum', false],
//   ['Использовать фейковые запросы и отправлять их с помощью TCP SEQ/ACK в прошлое.', '--wrong-seq', false],
//   ['Фрагментировать пакеты и отправлять их в обратном порядке', '--reverse-frag', false],
//   ['Генерирует фейково-заполненные пакеты для фейковых реквестов', '--fake-gen', true, '5'],
//   ['Генерирует фейково-заполненные из HEX пакеты для фейковых реквестов', '--fake-gen', true, '160301FFFF01FFFFFF0303594F5552204144564552544953454D454E542048455245202D202431302F6D6F000000000009000000050003000000'],
//   ['Пакеты с TCP payload, большим, чем заданный размер, не будут обрабатываться', '--max-payload', true, '1200']
//   //['Использовать свой blacklist.txt', '--blacklist']
// ];

enum Translations { ru, en }


List genGdpFun(Translations t) {
  if (t == Translations.ru) {
    RuTranslation translation = RuTranslation();
    List gdpi_functions = [
    [translation.useBestConfig, '-9 --fake-gen 5 --fake-from-hex 160301FFFF01FFFFFF0303594F5552204144564552544953454D454E542048455245202D202431302F6D6F000000000009000000050003000000', false],
    [translation.anotherConfig, '', false],
    [translation.passive, '-p', false],
    [translation.blockhttp3, '-q', false],
    [translation.replaceHost, '-r', false],
    [translation.rmSpace, 's', false],
    [translation.chaosRegister, '-m', false],
    [translation.ownHttpFragmentation, '-f', true, '2'],
    [translation.alwaysFragmentation, '-k', true],
    [translation.notWaitFirsSegment, '-n', false],
    [translation.ownHttpsFragmentation, '-e', true, '2'],
    [translation.fakeReq, '--auto-ttl', false],
    [translation.wrongChecksum, '--wrong-chksum', false],
    [translation.fakeTcpReq, '--wrong-seq', false],
    [translation.reversePackets, '--reverse-frag', false],
    [translation.fakePackets, '--fake-gen', true, '5'],
    [translation.fakePacketsFromHex, '--fake-gen', true, '160301FFFF01FFFFFF0303594F5552204144564552544953454D454E542048455245202D202431302F6D6F000000000009000000050003000000'],
    [translation.maxTcpPayload, '--max-payload', true, '1200']
  //['Использовать свой blacklist.txt', '--blacklist']
  ];
  return gdpi_functions;
  } else {
    EnTranslation translation = EnTranslation();
    List gdpi_functions = [
    [translation.useBestConfig, '-9 --fake-gen 5 --fake-from-hex 160301FFFF01FFFFFF0303594F5552204144564552544953454D454E542048455245202D202431302F6D6F000000000009000000050003000000', false],
    [translation.anotherConfig, '', false],
    [translation.passive, '-p', false],
    [translation.blockhttp3, '-q', false],
    [translation.replaceHost, '-r', false],
    [translation.rmSpace, 's', false],
    [translation.chaosRegister, '-m', false],
    [translation.ownHttpFragmentation, '-f', true, '2'],
    [translation.alwaysFragmentation, '-k', true],
    [translation.notWaitFirsSegment, '-n', false],
    [translation.ownHttpsFragmentation, '-e', true, '2'],
    [translation.fakeReq, '--auto-ttl', false],
    [translation.wrongChecksum, '--wrong-chksum', false],
    [translation.fakeTcpReq, '--wrong-seq', false],
    [translation.reversePackets, '--reverse-frag', false],
    [translation.fakePackets, '--fake-gen', true, '5'],
    [translation.fakePacketsFromHex, '--fake-gen', true, '160301FFFF01FFFFFF0303594F5552204144564552544953454D454E542048455245202D202431302F6D6F000000000009000000050003000000'],
    [translation.maxTcpPayload, '--max-payload', true, '1200']
  //['Использовать свой blacklist.txt', '--blacklist']
  ];
  return gdpi_functions;
  }
}



String pathG = 'lib/src/goodbyedpi/goodbyedpi.exe';
String pathConfig = 'lib/src/goodbyedpi/config.json';

String version = '0.8.7';