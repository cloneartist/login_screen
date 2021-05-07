import 'package:login_screen/login.dart';
import 'package:login_screen/otpsetup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_screen/profile.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  OTPScreen(this.phone);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color(0xFF93D2F3),
    borderRadius: BorderRadius.circular(0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );

  @override
  Widget build(BuildContext context) {
    //FirebaseAuth.instance.setSettings(appVerificationDisabledForTesting: true);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // title: Text(
          //   "",
          //   style: TextStyle(color: Colors.black),
          // ),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Verify Phone",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Code is sent to +91-${widget.phone}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: PinPut(
                  fieldsCount: 6,
                  textStyle:
                      const TextStyle(fontSize: 25.0, color: Colors.white),
                  eachFieldWidth: 50.0,
                  eachFieldHeight: 55.0,
                  focusNode: _pinPutFocusNode,
                  controller: _pinPutController,
                  submittedFieldDecoration: pinPutDecoration,
                  selectedFieldDecoration: pinPutDecoration,
                  followingFieldDecoration: pinPutDecoration,
                  pinAnimationType: PinAnimationType.fade,
                  onSubmit: (pin) async {
                    try {
                      // FirebaseAuth.instance
                      //     .setSettings(appVerificationDisabledForTesting: true);
                      await FirebaseAuth.instance
                          .signInWithCredential(PhoneAuthProvider.credential(
                              verificationId: _verificationCode, smsCode: pin))
                          .then((value) async {
                        if (value.user != null) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()),
                              (route) => false);
                        }
                      });
                    } catch (e) {
                      print("Error" + e);
                      FocusScope.of(context).unfocus();
                      // _scaffoldkey.currentState
                      //     .showSnackBar(SnackBar(content: Text('invalid OTP')));
                    }
                  },
                ),
              )
              // Padding(
              //   padding: const EdgeInsets.only(
              //     top: 20,
              //     left: 10,
              //     right: 10,
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       OTPDigitTextFieldBox(first: true, last: false),
              //       SizedBox(
              //         width: 2,
              //       ),
              //       OTPDigitTextFieldBox(first: true, last: false),
              //       SizedBox(
              //         width: 2,
              //       ),
              //       OTPDigitTextFieldBox(first: true, last: false),
              //       SizedBox(
              //         width: 2,
              //       ),
              //       OTPDigitTextFieldBox(first: true, last: false),
              //        SizedBox(
              //         width: 2,
              //       ),
              //       OTPDigitTextFieldBox(first: true, last: false),
              //        SizedBox(
              //         width: 2,
              //       ),
              //       OTPDigitTextFieldBox(first: true, last: false),

              //     ],
              //   ),
              // ),
              ,
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Didn't have the code?"),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Request Again",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    _verifyPhone();
                  },
                  child: Text(
                    " VERIFY AND CONTINUE",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)),
                      primary: Color(0xFF2E3B62),
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }
}
