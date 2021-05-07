import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int selectedRadioTile;
  @override
  void initState() {
    super.initState();

    selectedRadioTile = 4;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFF2E3B62), selectedRowColor: Color(0xFF2E3B62)),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                    width: 300,
                    height: 150,
                    child: Align(
                      alignment: Alignment(0, .7),
                      child: Text(
                        "Please select your profile",
                        textScaleFactor: 1.5,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 70,
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF2E3B62),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Radio(
                        value: 1,
                        groupValue: selectedRadioTile,
                        onChanged: (val) {
                          print("Radio Tile pressed $val");
                          setSelectedRadioTile(val);
                        },
                        activeColor: null,
                      ),
                      Image(
                        image: AssetImage('assets/Veccxtor.png'),
                        alignment: Alignment(90, 800),
                      ),
                      SizedBox(width: 40),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 122),
                            child: Text(
                              "Shipper",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet\nconsectetur adipiscing",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 70,
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF2E3B62),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Radio(
                        value: 2,
                        groupValue: selectedRadioTile,
                        onChanged: (val) {
                          print("Radio Tile pressed $val");
                          setSelectedRadioTile(val);
                        },
                        activeColor: null,
                      ),
                      Image(
                        image: AssetImage('assets/Vector.png'),
                        alignment: Alignment(10, 10),
                      ),
                      SizedBox(width: 40),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 122),
                            child: Text(
                              "Transporter",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 22.0),
                            child: Text(
                              "Lorem ipsum dolor sit amet\nconsectetur adipiscing",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              // Container(
              //   height: 70,
              //   width: 350,
              //   decoration: BoxDecoration(
              //     border: Border.all(
              //       color: Color(0xFF2E3B62),
              //     ),
              //   ),
              //   child: RadioListTile(
              //     value: 2,
              //     groupValue: selectedRadioTile,
              //     title: Text("Transporter"),
              //     subtitle: Text(
              //         "Lorem ipsum dolor sit amet, consectetur adipiscing "),
              //     onChanged: (val) {
              //       print("Radio Tile pressed $val");

              //       setSelectedRadioTile(val);
              //     },
              //     selected: false,
              //   ),
              // ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  color: Color(0xFF2E3B62),
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF2E3B62)),
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (_) => HomePage()));
                  },
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 130,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
