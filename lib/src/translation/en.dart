class EnTranslation {
  String start = "Start", stop = "Stop", open = "Show window", quit = "Quit";
  String isClosing = "Close?", isTray = "Go to tray", close = "Close";
  String useBestConfig = "Use best config (recommended)";
  String anotherConfig = "Use another built-in config (1 - 9)";
  String passive = "Block passive DPI";
  String blockhttp3 = "Block QUIC/HTTP3";
  String replaceHost = "Replace Host with hoSt";
  String rmSpace = "Remove space between host header and its value";
  String chaosRegister = "Mix Host header case";
  String ownHttpFragmentation = "Set HTTP fragmentation to value";
  String alwaysFragmentation = "Enable HTTP persistent (keep-alive) fragmentation and set it to value";
  String notWaitFirsSegment = "Do not wait for first segment ACK when -k is enabled";
  String ownHttpsFragmentation = "Set HTTPS fragmentation to value";
  String fakeReq = "Activate Fake Request Mode, automatically detect TTL and decrease it based on a distance";
  String wrongChecksum = "Activate Fake Request Mode and send it with incorrect TCP checksum";
  String fakeTcpReq = "Activate Fake Request Mode and send it with TCP SEQ/ACK in the past";
  String reversePackets = "Fragment (split) the packets just as --native-frag, but send them in the reversed order";
  String fakePackets = "Generate random-filled fake packets for Fake Request Mode, value of them (up to 30)";
  String fakePacketsFromHex = "Load fake packets for Fake Request Mode from HEX values";
  String maxTcpPayload = "Packets with TCP payload data more than [value] won't be processed";
  
}