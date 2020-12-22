import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vikkru/main.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  TextEditingController _loginController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
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
                _buildTextField(1, "Район"),
                _buildTextField(1, "Населенный пункт "),
                _buildTextField(3,
                    "Место (поле, лес, высота, опушка, склон, овраг, болото, река, озеро, кустарник, берег)"),
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: FloatingActionButton.extended(
                      icon: Icon(
                        Icons.location_city_outlined,
                        color: Colors.white,
                        size: 26,
                      ),
                      label: Text(
                        'Geolocation',
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                    )),
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
                    MyApp.page1,
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
                    MyApp.page3,
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
