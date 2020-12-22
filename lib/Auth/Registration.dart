import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vikkru/data/Database.dart';
import 'package:vikkru/data/User.dart';

import '../main.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  GlobalKey registrationScreenKey = GlobalKey();
  final AsyncMemoizer _memoizer = AsyncMemoizer();
  SharedPreferences _prefs;

  List<User> users = [];

  String _login, _password, _password2;
  bool showPassword = false, showPassword2 = false;

  TextEditingController _loginController;
  TextEditingController _passwordController_2;
  TextEditingController _passwordController;

  bool _loginInputIsValid = true;
  bool _passwordInputIsValid = true;
  bool _passwordInputIsValid_2 = true;

  _getData() async {
    var _users = await DBProvider.db.getUsers();
    users.clear();
    users.addAll(_users);
  }

  Future<bool> _asyncInit() async {
    await _memoizer.runOnce(() async {
      await _getData();
    });
    return true;
  }

  Future<void> _updateUI() async {
    await _getData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance()
      ..then((prefs) {
        setState(() => this._prefs = prefs);
        _loadUserPref();
      });
    _loginController = TextEditingController();
    _passwordController_2 = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _loadUserPref() {
    setState(() {
      MyApp.curUser = this._prefs.getInt(MyApp.userPrefKey) ?? -1;
    });
  }

  Future<Null> _setUserPref(int val) async {
    await this._prefs.setInt(MyApp.userPrefKey, val);
    _loadUserPref();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _asyncInit(),
      builder: (context, snapshot) {
        return Scaffold(
          key: registrationScreenKey,
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            title: Text('Registration'),
            centerTitle: true,
          ),
          body: _buildBody(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: _buildFAB(),
          bottomNavigationBar: BottomAppBar(
              child: Container(
            height: 45,
            decoration: BoxDecoration(
                border:
                    Border(top: BorderSide(width: 3, color: Colors.white70))),
          )),
        );
      },
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('Registration'),
      centerTitle: true,
    );
  }

  Widget _buildBody() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildLoginTextField(),
                SizedBox(height: 10),
                _buildPasswordTextField(),
                SizedBox(height: 10),
                _buildPasswordTextField2(),
              ],
            ),
          ),
        ],
      ),
      padding: EdgeInsets.only(top: 15, left: 15, right: 15),
    );
  }

  Widget _buildLoginTextField() {
    return TextField(
      controller: this._loginController,
      style: TextStyle(fontSize: 15),
      decoration: InputDecoration(
        counterText: '${this._loginController.text.length} symbols',
        counterStyle: TextStyle(fontSize: 10),
        labelText: 'Enter login:',
        labelStyle: TextStyle(fontSize: 15),
        hintText: 'Login',
        errorText:
            _loginInputIsValid ? null : 'The login must not exceed 15 symbols.',
        errorStyle: TextStyle(fontSize: 10),
        border: OutlineInputBorder(),
      ),
      onChanged: (String val) {
        if (val.length > 15) {
          setState(() => _loginInputIsValid = false);
        } else {
          setState(() {
            _loginInputIsValid = true;
          });
        }
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      controller: this._passwordController,
      obscureText: !this.showPassword,
      style: TextStyle(fontSize: 15),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            Icons.remove_red_eye,
            color: this.showPassword ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            setState(() {
              this.showPassword = !this.showPassword;
            });
          },
        ),
        counterText: '${this._passwordController.text.length} symbols',
        counterStyle: TextStyle(fontSize: 10),
        labelText: 'Enter Password:',
        labelStyle: TextStyle(fontSize: 15),
        errorText: _passwordInputIsValid
            ? null
            : 'The password must not exced 15 symbols.',
        errorStyle: TextStyle(fontSize: 10),
        border: OutlineInputBorder(),
      ),
      onChanged: (String val) {
        if (val.length > 15) {
          setState(() => _passwordInputIsValid = false);
        } else {
          setState(() {
            _passwordInputIsValid = true;
          });
        }
      },
    );
  }

  Widget _buildPasswordTextField2() {
    return TextField(
      controller: this._passwordController_2,
      obscureText: !this.showPassword2,
      style: TextStyle(fontSize: 32),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            Icons.remove_red_eye,
            color: this.showPassword2 ? Colors.redAccent : Colors.grey,
          ),
          onPressed: () {
            setState(() {
              this.showPassword2 = !this.showPassword2;
            });
          },
        ),
        counterText: '${this._passwordController_2.text.length} symbols',
        counterStyle: TextStyle(fontSize: 10),
        labelText: 'Enter confirm password:',
        labelStyle: TextStyle(fontSize: 15),
        errorText: _passwordInputIsValid_2
            ? null
            : 'The password must not exceed 15 symbols.',
        errorStyle: TextStyle(fontSize: 10),
        border: OutlineInputBorder(),
      ),
      onChanged: (String val) {
        if (val.length > 15) {
          setState(() => _passwordInputIsValid_2 = false);
        } else {
          setState(() {
            _passwordInputIsValid_2 = true;
          });
        }
      },
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton.extended(
      icon: Icon(
        Icons.check,
        color: Colors.white,
        size: 15,
      ),
      label: Text(
        'Sign Up',
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
      onPressed: () {
        if (_isValid()) {
          try {
            User user = User(login: _login, password: _password);
            saveUser(user);
            Navigator.pushNamed(
              context,
              MyApp.routeHome,
            );
          } catch (err) {
            debugPrint("$err");
          }
        }
      },
    );
  }

  saveUser(User user) async {
    try {
      var _user = await DBProvider.db.addUser(user);
      _setUserPref(_user.userId);
    } catch (exp) {
      print(exp.toString());
    }
  }

  bool _isValid() {
    String pattern =
        r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[-_])(?=\S+$).{8,15}$';
    _login = _loginController.text;
    _password = _passwordController.text;
    _password2 = _passwordController_2.text;
    if (_login.length == 0 || _password.length == 0 || _password2.length == 0) {
      return false;
    }
    if (users.length > 0) {
      var _user = users.firstWhere((u) => u.login == _login);

      _showAlertDialog(
          context, 'Warning', 'Login already exists. Choose another one.',
          iconData: Icons.info_outline, color: Colors.orange);
      return false;
    }
    if (_password != _password2) {
      _showAlertDialog(context, 'Warning', 'Passwords don\'t match.',
          iconData: Icons.info_outline, color: Colors.orange);
      return false;
    }
    if (!RegExp(pattern).hasMatch(_password)) {
      _showAlertDialog(context, 'Warning',
          'Password must contain 8-15 symbols, capital and lowercase letters, at least one numeral and a special symbol.',
          iconData: Icons.info_outline, color: Colors.orange);
      return false;
    }
    return true;
  }

  _showAlertDialog(BuildContext context, String title, String content,
      {IconData iconData, Color color}) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text(
        "OK",
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
      color: Colors.red,
      onPressed: () {
        Navigator.of(context)?.pop(); // dismiss dialog
      },
    );
    Widget cancelButton = FlatButton(
      child: Text(
        "Cancel",
        style: TextStyle(fontSize: 18),
      ),
      onPressed: () {
        Navigator.of(context)?.pop(); // dismiss dialog
      },
    ); // set up th// set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Row(
        children: <Widget>[
          Icon(iconData, size: 32, color: color),
          SizedBox(width: 5),
          Text(
            title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      content: Text(
        content,
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
      actions: [okButton, cancelButton],
    ); // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
