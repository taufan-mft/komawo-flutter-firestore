import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:komawo/services/service_locator.dart';
import 'package:komawo/ui/login/login_viewmodel.dart';
import 'package:komawo/ui/main_menu/main_menu_ui.dart';
import 'package:komawo/utils/button_style.dart';
import 'package:provider/provider.dart';

class LoginUi extends StatefulWidget {
  const LoginUi({Key? key}) : super(key: key);

  @override
  _LoginUiState createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  late String email;
  late String password;
  final _formKey = GlobalKey<FormState>();
  LoginViewModel model = serviceLocator<LoginViewModel>();
  
   showSnackbar(){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Selamat datang!")));
  }
  @override
  void initState() {
    model.setFunction(showSnackbar);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (text) {
                          email = text;
                        },
                        validator: (val) =>
                            RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(val!)
                                ? null
                                : 'Mohon masukkan e-mail yang valid.',
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            labelText: 'e-mail',
                            border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: new BorderSide())))),
                Padding(
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                        onChanged: (text) {
                          password = text;
                        },
                        obscureText: true,
                        validator: (val) =>
                            val!.length < 6 ? 'Password terlalu pendek.' : null,
                        keyboardType: TextInputType.text,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            labelText: 'password',
                            border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: new BorderSide())))),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: MyButtonStyle.primaryButton(context, Colors.pink),
                    child: Text('Login'),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                       var bool =  await model.getUser(email, password);
                       if (bool) {
                         Navigator.push(context, CupertinoPageRoute(builder: (context) =>MainMenuUi()));
                       }
                      }

                    },
                  ),
                ),
          ChangeNotifierProvider<LoginViewModel>(
          create: (context) => model,
        child: Consumer<LoginViewModel>(
          builder: (context, model, child) => Text(
            model.id
          )))
          ],
            )),
      ),
    );
  }
}
