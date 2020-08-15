import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final defaultSergeo = TextStyle(
      fontFamily: 'Sergeo UI',
      fontSize: 30,
    );
    final segoe_form_assets = TextStyle(
      fontFamily: 'Segoe_form_assets',
      fontSize: 30,
    );

    final alata_Regular_form_assets = TextStyle(
      fontFamily: 'Alata_Regular_form_assets',
      fontSize: 30,
    );

    final fira_code_form_assets = TextStyle(
      fontFamily: 'FiraCode_form_assets',
      fontSize: 30,
    );

    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Column(
          children: [
            buildHeader([
              'Sergeo UI',
              'Segoe form_assets',
              'Alata Regular form_assets',
              'FiraCode form_assets'
            ]),
            buildCharCodes(
                startChar: ' ',
                endChar: '~',
                charBuilder: (char) {
                  return [
                    Text(char, style: defaultSergeo),
                    buildErrorIfUnknownChars(
                        char: char,
                        child: Text(char, style: segoe_form_assets)),
                    Text(char, style: alata_Regular_form_assets),
                    Text(char, style: fira_code_form_assets),
                  ];
                }),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(List<String> headerNames) {
    return Container(
      color: Colors.brown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (final header in headerNames)
            Text(
              header,
              style: TextStyle(fontFamily: 'Arial', fontSize: 15),
            ),
        ],
      ),
    );
  }

  buildCharCodes({
    String startChar,
    String endChar,
    List<Widget> Function(String char) charBuilder,
  }) {
    final startCode = startChar.codeUnitAt(0);
    final endCode = endChar.codeUnitAt(0);
    assert(startCode < endCode);

    return Expanded(
      child: ListView(
        children: [
          for (int code = startCode; code < endCode; code++)
            buildCode(code, charBuilder)
        ],
      ),
    );
  }

  Widget buildCode(int code, List<Widget> Function(String char) charBuilder) {
    final char = String.fromCharCode(code);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: charBuilder(char),
        ),
        Divider(),
      ],
    );
  }

  Widget buildErrorIfUnknownChars({String char, Widget child}) {
    return '()'.contains(char)
        ? Container(
            color: Colors.red.withOpacity(0.7),
            child: child,
          )
        : child;
  }
}
