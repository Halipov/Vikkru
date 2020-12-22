import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vikkru/main.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  TextEditingController _loginController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(children: [
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                _buildTextField(1, "Дата эксгумации"),
                _buildTextField(1, "Фамилия ответственного за раскоп"),
                _buildTextField(1, "Количество человек на раскопе"),
                _buildTextField(6, "Фамилии"),
              ],
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
                    MyApp.page2,
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
