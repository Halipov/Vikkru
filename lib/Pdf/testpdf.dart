// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class TestPdf extends StatelessWidget {
//   const TestPdf({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Column(children: [
//       Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
//         Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               //PdfLogo(),
//               SizedBox(width: 30),
//               Flexible(
//                 child: Text(
//                     'Могилевский областной историко-патриотический поисковый клуб «ВИККРУ»',
//                     textAlign: TextAlign.center,
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
//               )
//             ]),
//         SizedBox(height: 5),
//         Align(
//             alignment: Alignment.centerRight,
//             child: Container(
//               // color: Color.fromHex("#e61919"), height: 2, width: 480))
//               color: Colors.red[300],
//             ))
//       ]),
//       SizedBox(height: 20),
//       Align(
//         alignment: Alignment.center,
//         child: Text("Протокол раскопа №____")),
//       SizedBox(height: 20),
//       Table(border: TableBorder(), children: [
//         TableRow(children: [
//           Container(
//               padding: EdgeInsets.all(5),
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     row('Дата эксгумации:', ' value'),
//                     row('Фамилия ответственногоза раскоп:', ' value'),
//                     // Text('Количество человек на раскопе:         ', style: bold_textstyle),
//                     // Text('Фамилии:                            ', style: base_textstyle),
//                     // Text('                                    ', style: base_textstyle),
//                     // Text('                                    ', style: base_textstyle),
//                     // Text('                                    ', style: base_textstyle),
//                     // Text('                                    ', style: base_textstyle),
//                     // Text('                                    ', style: base_textstyle),
//                   ])),
//           Container(
//               padding: EdgeInsets.all(5),
//               child: Column(children: [
//                 Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                   Text("Место обнаружения останков",
//                       textAlign: TextAlign.center,

//                 ),
//                   row('Район: ', ' value'),
//                   row('Населенный пункт: ', ' value'),
//                   Container(child:
//                       Row(children: [
//                         Text(
//                             '(поле, лес, высота, опушка, склон, овраг, болото, река, озеро, кустарник, берег)',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 14)),
//                       ]))
//                 ]])))])])]
//   }
// }

// Row row(String data, String value) {
//   return Row(children: [
//     Text(data,),
//         // style: Theme.of(context)
//         //     .defaultTextStyle
//         //     .copyWith(fontWeight: FontWeight.bold, fontSize: 14)),
//     Text(value,)
//         // style: Theme.of(context)
//         //     .defaultTextStyle
//         //     .copyWith(fontWeight: FontWeight.normal, fontSize: 14)),
//   ]);
// }
