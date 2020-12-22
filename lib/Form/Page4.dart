import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vikkru/main.dart';

class Page4 extends StatefulWidget {
  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  TextEditingController _loginController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 4'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(children: [
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Text('Подробности',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  _buildTextField(1, "Пол:"),
                  _buildTextField(1,
                      "Поза скелета (-ов):лежа, сидя, на спине, ничком, на боку (правом, левом):"),
                  _buildTextField(2,
                      "Характер ранений, повреждений. Отсутствующие части скелета.Антропологические особенности"),
                  _buildTextField(2,
                      "Воинские звания погибшего (-их), знаки отличия(обоснование):"),
                  _buildTextField(2,
                      "Наличие медальонов, документов, наград (с указанием номера). Их состояние"),
                  _buildTextField(2, "Наличие личных вещей:"),
                  _buildTextField(2,
                      "Наличие снаряжения, боеприпасов и оружия. Описание именных находок:"),
                  _buildTextField(
                      2, "Примерная дата гибели найденного(-ых) солдата:"),
                  _buildTextField(2,
                      "Какие воинские части и соединения вели бои в указанном месте в данный период:"),
                  SizedBox(
                    height: 80,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    MyApp.page3,
                  );
                },
                elevation: 2.0,
                fillColor: Colors.green,
                child: Text(
                  'Назад',
                  style: TextStyle(color: Colors.white),
                ),
                padding: EdgeInsets.all(15.0),
                shape: StadiumBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    MyApp.page5,
                  );
                },
                elevation: 2.0,
                fillColor: Colors.green,
                child: Text(
                  'Далее',
                  style: TextStyle(color: Colors.white),
                ),
                padding: EdgeInsets.all(15.0),
                shape: StadiumBorder(),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget _buildTextField(int maxLines, String title) {
    return Column(
      children: [
        Text('$title'),
        TextField(
          controller: this._loginController,
          maxLines: maxLines,
          textAlign: TextAlign.left,
          textAlignVertical: TextAlignVertical.top,
          style: TextStyle(fontSize: 15),
          decoration: InputDecoration(
            errorStyle: TextStyle(fontSize: 24),
            border: OutlineInputBorder(),
          ),
          onChanged: (String val) {
            // if (val.length > 15) {
            //   setState(() => _loginInputIsValid = false);
            // } else {
            //   setState(() {
            //     _loginInputIsValid = true;
            //   });
            // }
          },
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
