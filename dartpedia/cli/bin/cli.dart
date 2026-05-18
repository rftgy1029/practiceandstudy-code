import 'package:cli/cli.dart' as cli;
import 'dart:io';

const version = '0.0.1';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') { printUsage(); }
    else if (arguments.first == 'version') { print('Darpedia CLI version $version');} 
    else if (arguments.first == 'search') {final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);}
    else {printUsage();}
}

void searchWikipedia(List<String>? arguments) {
  final String articleTitle;

  if (arguments == null || arguments.isEmpty) {
    print("기사 제목은 1글자 이상이여야 합니다!");
    articleTitle = stdin.readLineSync() ?? '';
  } else {
    articleTitle = arguments.join(' ');
  }

void printUsage() {
  print("현재 사용 가능한 명령어 : 'help', 'version', 'search <기사제목>'");
}