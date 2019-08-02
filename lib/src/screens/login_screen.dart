import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {

  var formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return containers(createForm(), useMargin: true, usePadding: true, allMargin: 20.0, allPadding: 20.0);
  }

  ///
  /// Container for Widgets 
  ///
  Widget containers(Widget box, {left: 0.0, top: 0.0, right: 0.0, bottom: 0.0, usePadding: false, useMargin: false, allMargin: 0.0, allPadding: 0.0 }) {
    return Container(
      // if usemargin is true and if allMargin is equal to 0, use EdgeInsets with given values Else if all is not 0 use EdgeInsets all with given value
      margin: (useMargin == true) ? (allMargin == 0.0) ? EdgeInsets.only(left: left, top: top, right: right, bottom: bottom) : EdgeInsets.all(allMargin)  : EdgeInsets.all(0.0),
      padding: (usePadding == true) ? (allPadding == 0.0) ? EdgeInsets.only(left: left, top: top, right: right, bottom: bottom) : EdgeInsets.all(allPadding)  : EdgeInsets.all(0.0),
      child: box,
    );
  }

  Widget createForm() {
    return Form(
      key: formKey,
      child: Column(
          children: <Widget>[
            containers(createEmailForm()),
            containers(createPasswordForm()),
            containers(createSubmitButton(), useMargin: true, top: 20.0)
          ],
        ),
    );
  }

  Widget createEmailForm() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email address',
        icon: Icon(Icons.email),
      ),
      validator: validatorFn,
      autovalidate: true,
      enabled: true,
      onSaved: (val) {
        print('Email is: $val');
      },
    );
  }

  Widget createPasswordForm() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your passeord',
        icon: Icon(Icons.panorama_fish_eye)
      ),
      validator: validatorFn,
      onSaved: (val) {
        print('Password is: $val');
      },
    );
  }

  Widget createSubmitButton() {
    return RaisedButton(
      onPressed: () {
        print('Button Pressed');
        FormState form = formKey.currentState;

        bool isDataValid = form.validate();
        if (isDataValid) {
          form.save();
        }
        print(isDataValid);
      },
      child: Text('Submit'),
      color: Colors.blue,
      textColor: Colors.white,
    );
  }

  String validatorFn(String value) {
      var data;

      if (value.isEmpty) {
        data = 'This field should not be Empty';
      } else if (value.length < 4) {
        data = 'Kindly enter a valid Data';
      } else if (!value.contains('@')) {
        data = 'Sorry, this is not valid. please try again';
      }

      return data;
    }
}
