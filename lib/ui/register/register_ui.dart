import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:komawo/services/service_locator.dart';
import 'package:komawo/ui/login/login_ui.dart';
import 'package:komawo/ui/register/register_viewmodel.dart';
import 'package:komawo/utils/button_style.dart';
import 'package:provider/provider.dart';

class RegisterUi extends StatefulWidget {
  const RegisterUi({Key? key}) : super(key: key);

  @override
  _RegisterUiState createState() => _RegisterUiState();
}

class _RegisterUiState extends State<RegisterUi> {
  RegisterViewModel model = serviceLocator<RegisterViewModel>();
  final _formKey = GlobalKey<FormState>();
  String _gender = 'male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.all(8),
                      child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (text) {
                            model.user.email = text;
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
                            model.user.password = text;
                          },
                          obscureText: true,
                          validator: (val) => val!.length < 6
                              ? 'Password terlalu pendek.'
                              : null,
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
                      child: Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              title: const Text('Male'),
                              leading: Radio<String>(
                                value: 'male',
                                groupValue: _gender,
                                onChanged: (String? value) {
                                  setState(() {
                                    _gender = value!;
                                    model.user.gender = _gender;
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(
                              child: ListTile(
                            title: const Text('Female'),
                            leading: Radio<String>(
                              value: 'female',
                              groupValue: _gender,
                              onChanged: (String? value) {
                                setState(() {
                                  _gender = value!;
                                  model.user.gender = _gender;
                                });
                              },
                            ),
                          )),
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.all(8),
                      child: TextFormField(
                          keyboardType: TextInputType.name,
                          onChanged: (text) {
                            model.user.name = text;
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              labelText: 'Name',
                              border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  borderSide: new BorderSide())))),
                  Padding(
                      padding: EdgeInsets.all(8),
                      child: TextFormField(
                          keyboardType: TextInputType.number,
                          onChanged: (text) {
                            model.user.phone = text;
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              labelText: 'Phone',
                              border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  borderSide: new BorderSide())))),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: ElevatedButton(
                      style: MyButtonStyle.primaryButton(context, Colors.pink),
                      child: Text('Register'),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          var bool = await model.sendUser();
                          if (bool) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "Registrasi berhasil! Silakan login.")));
                            Navigator.pushAndRemoveUntil(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => LoginUi()),
                                ModalRoute.withName('/tania'));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Gagal register!")));
                          }
                        }
                      },
                    ),
                  ),
                  ChangeNotifierProvider<RegisterViewModel>(
                      create: (context) => model,
                      child: Consumer<RegisterViewModel>(
                          builder: (context, model, child) => model.loading
                              ? CircularProgressIndicator()
                              : Container()))
                ],
              )),
        ),
      ),
    );
  }
}
