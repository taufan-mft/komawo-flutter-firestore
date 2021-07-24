import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:komawo/services/service_locator.dart';
import 'package:komawo/ui/profile/profile_viewmodel.dart';
import 'package:komawo/utils/button_style.dart';
import 'package:provider/provider.dart';

class ProfileUi extends StatefulWidget {
  const ProfileUi({Key? key}) : super(key: key);

  @override
  _ProfileUiState createState() => _ProfileUiState();
}

class _ProfileUiState extends State<ProfileUi> {
  ProfileViewModel model = serviceLocator<ProfileViewModel>();
  String _gender = 'male';
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();

  late String name;

  void theListener() {
    log('im triggered');
    _name.text = model.user.name;
    _gender = model.user.gender;
    _email.text = model.user.email;
    _phone.text = model.user.phone;
  }

  @override
  void initState() {
    model.getUser();
    model.addListener(theListener);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Profile')),
        body: Center(
          child: ChangeNotifierProvider<ProfileViewModel>(
            create: (context) => model,
            child: Consumer<ProfileViewModel>(
                builder: (context, model, child) => Column(
                      children: [
                        model.loading
                            ? CircularProgressIndicator()
                            : Container(),
                        Padding(
                            padding: EdgeInsets.all(8),
                            child: TextFormField(
                                controller: _name,
                                keyboardType: TextInputType.text,
                                enableSuggestions: false,
                                autocorrect: false,
                                onChanged: (text) {
                                  model.user.name = text;
                                },
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    labelText: 'Name',
                                    border: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(10.0),
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
                                controller: _email,
                                keyboardType: TextInputType.text,
                                enableSuggestions: false,
                                autocorrect: false,
                                onChanged: (text) {
                                  model.user.email = text;
                                },
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    labelText: 'Email',
                                    border: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(10.0),
                                        borderSide: new BorderSide())))),
                        Padding(
                            padding: EdgeInsets.all(8),
                            child: TextFormField(
                                controller: _phone,
                                keyboardType: TextInputType.text,
                                enableSuggestions: false,
                                autocorrect: false,
                                onChanged: (text) {
                                  model.user.phone = text;
                                },
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    labelText: 'Phone Number',
                                    border: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(10.0),
                                        borderSide: new BorderSide())))),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: ElevatedButton(
                            style: MyButtonStyle.primaryButton(
                                context, Colors.pink),
                            child: Text('Save'),
                            onPressed: () async {
                              await model.updateUser();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Update Berhasil!")));
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    )),
          ),
        ));
  }
}
