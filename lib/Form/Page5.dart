import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vikkru/main.dart';

class Page5 extends StatefulWidget {
  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  TextEditingController _loginController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 5'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(children: [
          Container(
            child: Column(
              children: [
                Text('Примечания',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                _buildTextField(
                    5, "Особенности, установленные при эксгумации:"),
                _buildTextField(1, "Номер эксгумационного пакета(-ов):"),
                Text('Фото',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: new BoxDecoration(
                      color: Colors.purple,
                      gradient: new RadialGradient(
                        colors: [Colors.white, Colors.grey],
                        radius: 0.5,
                      ),
                    ),
                    child: Icon(Icons.add, size: 100),
                  ),
                )
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
                    MyApp.page4,
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
                    MyApp.page1,
                  );
                },
                elevation: 2.0,
                fillColor: Colors.green,
                child: Text(
                  'Сохранить',
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
