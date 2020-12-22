import 'dart:core';

import 'package:flutter/material.dart';
import 'package:vikkru/Pdf/PdfPrevievScreen.dart';
import 'Pdf/pdf.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF  flutter"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await writeOnPdf();
          await savePdf();
          String fullPath = "$documentPath/example.pdf";
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PdfPreviewScreen(
                        path: fullPath,
                      )));
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
