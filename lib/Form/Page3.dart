import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vikkru/main.dart';

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  TextEditingController _loginController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 3'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(children: [
          Container(
            child: Column(
              children: [
                Text('Место обнаружения останков',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                _buildTextField(1, "Захоронение по состоянию:"),
                _buildTextField(1, "Тип залегания останков:"),
                _buildTextField(1, "По количеству останков:"),
                _buildTextField(1, "Количество захороненных:"),
                _buildTextField(1, "Количество медальонов:"),
                _buildTextField(1, "Количество именных вещей:"),
              ],
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
                    MyApp.page2,
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
                    MyApp.page4,
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
