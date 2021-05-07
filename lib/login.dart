import 'dart:async';

import 'package:flutter/material.dart';

import 'otp.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _character = true;
  TextEditingController _controller = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final snackBar = SnackBar(
    content: Text('OTP Sent'),
    backgroundColor: Colors.green,
  );
  @override
  Widget build(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('OTP Sent'),
      backgroundColor: Colors.green,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {},
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Please enter your mobile number",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "You'll receive a 6 digit code\nto verify next",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                ),
                child: Form(
                  key: _formKey,
                  //autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextFormField(
                    validator: (val) => val.length < 10
                        ? "Please provide a valid mobile number"
                        : null,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    controller: _controller,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                    decoration: new InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Container(
                            height: 20,
                            width: 150,
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image(
                                    image: AssetImage(
                                      'assets/india.png',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "+91",
                                    style: TextStyle(fontSize: 19),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        fillColor: Colors.white,
                        // border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        filled: true,
                        hintText: "Mobile Number",
                        hintStyle:
                            new TextStyle(color: Colors.grey, fontSize: 18.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => OTPScreen(_controller.text),
                        ),
                      );

                      return ScaffoldMessenger.of(context)
                          .showSnackBar(snackBar);
                    }
                  },
                  child: Text(
                    "CONTINUE",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    primary: Color(0xFF2E3B62),
                    padding: EdgeInsets.fromLTRB(150, 20, 150, 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
