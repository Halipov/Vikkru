import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

final pdf = pw.Document();
String documentPath;

Future<Uint8List> writeOnPdf() async {
  pdf.addPage(pw.MultiPage(
      theme: pw.ThemeData.withFont(
        base: pw.Font.ttf(
            await rootBundle.load('assets/fonts/Times-New-Roman.ttf')),
        bold: pw.Font.ttf(
            await rootBundle.load('assets/fonts/TimesNewRoman-Bold.ttf')),
      ),
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.all(32),
      build: (pw.Context context) {
        return <pw.Widget>[
          pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.PdfLogo(),
                      pw.SizedBox(width: 30),
                      pw.Flexible(
                        child: pw.Text(
                            'Могилевский областной историко-патриотический поисковый клуб «ВИККРУ»',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 14)),
                      )
                    ]),
                pw.SizedBox(height: 5),
                pw.Align(
                    alignment: pw.Alignment.centerRight,
                    child: pw.Container(
                        color: PdfColor.fromHex("#e61919"),
                        height: 2,
                        width: 480)),
              ]),
          pw.SizedBox(height: 20),
          pw.Align(
            alignment: pw.Alignment.center,
            child: pw.Text("Протокол раскопа №____",
                style: pw.Theme.of(context)
                    .defaultTextStyle
                    .copyWith(fontWeight: pw.FontWeight.bold, fontSize: 14)),
          ),
          pw.SizedBox(height: 20),
          pw.Table(border: pw.TableBorder(), children: [
            pw.TableRow(children: [
              pw.Container(
                  width: 300,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        row('Дата эксгумации:', ' value', context),
                        row('Фамилия ответственного за раскоп:', ' value',
                            context),
                        // pw.Text('Количество человек на раскопе:         ', style: bold_textstyle),
                        // pw.Text('Фамилии:                            ', style: base_textstyle),
                        // pw.Text('                                    ', style: base_textstyle),
                        // pw.Text('                                    ', style: base_textstyle),
                        // pw.Text('                                    ', style: base_textstyle),
                        // pw.Text('                                    ', style: base_textstyle),
                        // pw.Text('                                    ', style: base_textstyle),
                      ])),
              pw.Container(
                  alignment: pw.Alignment.topLeft,
                  width: 250,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Row(
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            children: [
                              pw.Text("Место обнаружения останков",
                                  textAlign: pw.TextAlign.center,
                                  style: pw.Theme.of(context)
                                      .defaultTextStyle
                                      .copyWith(
                                          fontWeight: pw.FontWeight.bold,
                                          fontSize: 14)),
                            ]),
                        pw.SizedBox(height: 5),
                        row('Район: ', ' value', context),
                        pw.SizedBox(height: 5),
                        row('Населенный пункт: ', ' value', context),
                        pw.SizedBox(height: 5),
                        pw.Container(
                            padding: pw.EdgeInsets.all(5),
                            decoration: pw.BoxDecoration(
                                border: pw.BoxBorder(
                                    left: true,
                                    bottom: true,
                                    top: true,
                                    right: true)),
                            child: pw.Column(children: [
                              pw.RichText(
                                  text: pw.TextSpan(children: [
                                pw.TextSpan(
                                    text: 'Место',
                                    style: pw.Theme.of(context)
                                        .defaultTextStyle
                                        .copyWith(
                                            fontWeight: pw.FontWeight.bold,
                                            fontSize: 14)),
                                pw.TextSpan(
                                    text:
                                        '(поле, лес, высота, опушка, склон, овраг, болото, река, озеро, кустарник, берег)',
                                    style: pw.TextStyle(fontSize: 14)),
                                pw.TextSpan(
                                    text: '\nN ________',
                                    style: pw.TextStyle(fontSize: 14)),
                                pw.TextSpan(
                                    text: 'ГЛОНАСС/GPS',
                                    style: pw.Theme.of(context)
                                        .defaultTextStyle
                                        .copyWith(
                                            fontWeight: pw.FontWeight.bold,
                                            fontSize: 14)),
                                pw.TextSpan(
                                    text: '\nE ________',
                                    style: pw.TextStyle(fontSize: 14)),
                              ]))
                            ])),
                      ]))
            ]),
            pw.TableRow(children: [
              pw.Container(
                  padding: pw.EdgeInsets.all(5),
                  width: 300,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                          'Схема расположения раскопа с привязкой к местности',
                          style: pw.Theme.of(context).defaultTextStyle.copyWith(
                              fontWeight: pw.FontWeight.bold, fontSize: 14))
                    ],
                  )),
              pw.Container(
                  padding: pw.EdgeInsets.all(5),
                  width: 250,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.RichText(
                          text: pw.TextSpan(children: [
                        pw.TextSpan(
                            text: 'Захоронение по состоянию:',
                            style: pw.Theme.of(context)
                                .defaultTextStyle
                                .copyWith(
                                    decoration: pw.TextDecoration.underline,
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 14)),
                        pw.TextSpan(
                            text: '\n* Value',
                            style: pw.TextStyle(fontSize: 14)),
                        pw.TextSpan(
                            text: '\nТип залегания останков:',
                            style: pw.Theme.of(context)
                                .defaultTextStyle
                                .copyWith(
                                    decoration: pw.TextDecoration.underline,
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 14)),
                        pw.TextSpan(
                            text: '\n* Value',
                            style: pw.TextStyle(fontSize: 14)),
                        pw.TextSpan(
                            text: '\nПо количеству останков:',
                            style: pw.Theme.of(context)
                                .defaultTextStyle
                                .copyWith(
                                    decoration: pw.TextDecoration.underline,
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 14)),
                        pw.TextSpan(
                            text: '\n* Value',
                            style: pw.TextStyle(fontSize: 14)),
                        pw.TextSpan(
                            text: '\nКоличество захороненных -\nvalue',
                            style: pw.Theme.of(context)
                                .defaultTextStyle
                                .copyWith(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 14)),
                        pw.TextSpan(
                            text: '\nКоличество медальонов -\nvalue',
                            style: pw.Theme.of(context)
                                .defaultTextStyle
                                .copyWith(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 14)),
                        pw.TextSpan(
                            text: '\nКоличество именных вещей -\nvalue',
                            style: pw.Theme.of(context)
                                .defaultTextStyle
                                .copyWith(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 14)),
                      ]))
                    ],
                  ))
            ]),
            pw.TableRow(children: [
              pw.Container(
                  padding: pw.EdgeInsets.all(5),
                  width: 300,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.RichText(
                          text: pw.TextSpan(children: [
                        pw.TextSpan(
                            text: 'Площадь раскопа',
                            style: pw.Theme.of(context)
                                .defaultTextStyle
                                .copyWith(
                                    decoration: pw.TextDecoration.underline,
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 14)),
                        pw.TextSpan(
                            text: '\nДлина - ',
                            style: pw.TextStyle(fontSize: 14)),
                        pw.TextSpan(
                            text: '\nШирина  - ',
                            style: pw.TextStyle(fontSize: 14)),
                        pw.TextSpan(
                            text: '\nГлубина до останков - ',
                            style: pw.TextStyle(fontSize: 14)),
                      ]))
                    ],
                  )),
              pw.Container(
                  padding: pw.EdgeInsets.all(5),
                  width: 300,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.RichText(
                          text: pw.TextSpan(children: [
                        pw.TextSpan(
                            text: 'Состояние останков',
                            style: pw.Theme.of(context)
                                .defaultTextStyle
                                .copyWith(
                                    decoration: pw.TextDecoration.underline,
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 14)),
                        pw.TextSpan(
                            text: '\nХорошее - ',
                            style: pw.TextStyle(fontSize: 14)),
                        pw.TextSpan(
                            text: '\nСреднее  - ',
                            style: pw.TextStyle(fontSize: 14)),
                        pw.TextSpan(
                            text: '\nПлохое - ',
                            style: pw.TextStyle(fontSize: 14)),
                      ]))
                    ],
                  )),
            ]),
            pw.TableRow(children: [
              pw.Container(
                  padding: pw.EdgeInsets.all(5),
                  width: 300,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.RichText(
                          text: pw.TextSpan(children: [
                        pw.TextSpan(
                            text: 'Пол ',
                            style: pw.Theme.of(context)
                                .defaultTextStyle
                                .copyWith(
                                    decoration: pw.TextDecoration.underline,
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 14)),
                      ]))
                    ],
                  )),
              pw.Container(
                  padding: pw.EdgeInsets.all(5),
                  width: 300,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.RichText(
                          text: pw.TextSpan(children: [
                        pw.TextSpan(
                            text: 'Мужской',
                            style: pw.Theme.of(context)
                                .defaultTextStyle
                                .copyWith(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 14)),
                      ]))
                    ],
                  )),
            ]),
            tableRow(
                boldData: 'Поза скелета (-ов):',
                data: 'лежа, сидя, на спине, ничком, на боку (правом, левом)',
                value: "Value",
                context: context),
            tableRow(
                boldData:
                    'Характер ранений, повреждений.\nОтсутствующие части скелета.\nАнтропологические особенности',
                data: '',
                value: "Value",
                context: context),
            tableRow(
                boldData: 'Воинские звания погибшего (-их), знаки отличия',
                data: '(обоснование)',
                value: "Value",
                context: context),
            tableRow(
                boldData:
                    'Наличие медальонов, документов, наград (с указанием номера).\nИх состояние',
                data: '',
                value: "Value",
                context: context),
            tableRow(
                boldData: 'Наличие личных вещей',
                data: '',
                value: "Value",
                context: context),
            tableRow(
                boldData:
                    'Наличие снаряжения, боеприпасов и оружия. Описание именных находок',
                data: '',
                value: "Value",
                context: context),
            tableRow(
                boldData: 'Примерная дата гибели найденного(-ых) солдата',
                data: '',
                value: "Value",
                context: context),
            tableRow(
                boldData:
                    'Какие воинские части и соединения вели бои в указанном месте в данный период',
                data: '',
                value: "Value",
                context: context),
            tableRow(
                boldData: 'Примечание',
                data: '(особенности, установленные при эксгумации)',
                value: "Value",
                context: context),
            tableRow(
                boldData: 'Номер эксгумационного пакета(-ов)',
                data: '',
                value: "Value",
                context: context),
          ])
        ];
      }));
}

Future savePdf() async {
  // Directory documentDirectory = await getApplicationDocumentsDirectory();
  Directory externalDocumentDirectory = await getExternalStorageDirectory();
  print(externalDocumentDirectory);
  documentPath = externalDocumentDirectory.path;
  File file = File("$documentPath/example.pdf");
  file.writeAsBytesSync(pdf.save());
}

pw.TableRow tableRow(
    {String boldData, String data, String value, Context context}) {
  return pw.TableRow(children: [
    pw.Container(
        padding: pw.EdgeInsets.all(5),
        width: 300,
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.RichText(
                text: pw.TextSpan(children: [
              pw.TextSpan(
                  text: boldData,
                  style: pw.Theme.of(context)
                      .defaultTextStyle
                      .copyWith(fontWeight: pw.FontWeight.bold, fontSize: 14)),
              pw.TextSpan(
                  text: data,
                  style: pw.Theme.of(context)
                      .defaultTextStyle
                      .copyWith(fontSize: 14))
            ]))
          ],
        )),
    pw.Container(
        padding: pw.EdgeInsets.all(5),
        width: 300,
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.RichText(
                text: pw.TextSpan(children: [
              pw.TextSpan(
                text: value,
              )
            ]))
          ],
        )),
  ]);
}

pw.RichText row(String data, String value, pw.Context context) {
  return pw.RichText(
      textAlign: pw.TextAlign.left,
      text: pw.TextSpan(children: [
        pw.TextSpan(
            text: data,
            style: pw.Theme.of(context)
                .defaultTextStyle
                .copyWith(fontWeight: pw.FontWeight.bold, fontSize: 14)),
        pw.TextSpan(
            text: value,
            style: pw.Theme.of(context)
                .defaultTextStyle
                .copyWith(fontWeight: pw.FontWeight.normal, fontSize: 14)),
      ]));
}
