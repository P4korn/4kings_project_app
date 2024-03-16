import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 1;
  TextEditingController _numberController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  bool _showSecondBox = false;
  List<String> _names = [];
  String? _assignedGroup;

  List<String> groups = ["ประชาชื่น", "อินทร", "กนกอาชีวะ", "บูรณพนธ์"];
  List<String> images = [
    "image/prac.jpg",
    "image/in.jpg",
    "image/kanok.jpg",
    "image/bu.jpg",
  ];

  Map<String, List<String>> groupmembers = {
    "ประชาชื่น": [],
    "อินทร": [],
    "กนกอาชีวะ": [],
    "บูรณพนธ์": []
  };

  void assignToGroup(String name) {
    List<String> shuffledGroups = List.from(groups)..shuffle();
    int smallestGroupIndex = 0;
    int smallestGroupSize = groupmembers[shuffledGroups[0]]!.length;

    for (int i = 1; i < shuffledGroups.length; i++) {
      int groupSize = groupmembers[shuffledGroups[i]]!.length;
      if (groupSize < smallestGroupSize) {
        smallestGroupSize = groupSize;
        smallestGroupIndex = i;
      }
    }

    String smallestGroup = shuffledGroups[smallestGroupIndex];

    groupmembers[smallestGroup]!.add(name);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        String imagePath;
        if (smallestGroup == 'ประชาชื่น') {
          imagePath = images[0];
        } else if (smallestGroup == 'อินทร') {
          imagePath = images[1];
        } else if (smallestGroup == 'กนกอาชีวะ') {
          imagePath = images[2];
        } else if (smallestGroup == 'บูรณพนธ์') {
          imagePath = images[3];
        } else
          imagePath = '';
        return AlertDialog(
          title: Text('ไหนดูสิ้'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('$name ไปอยู่กับชาว $smallestGroup',
                  style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Image.asset(
                imagePath,
                height: 200,
                width: 200,
                fit: BoxFit.contain,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('ปิด'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _numberController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: SingleChildScrollView(
        
        child: Padding(
          padding: const EdgeInsets.only(left: 35, top: 130, right: 35),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome !",
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "4kings Random Group",
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              

              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      child: TextField(
                        controller: _numberController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'ใส่จำนวนคน',
                          filled: true,
                          fillColor: Colors.white60,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  CircleAvatar(
                    backgroundColor: Color(0xff4c505b),
                    radius: 30,
                    child: IconButton(
                      color: Colors.white,
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        setState(() {
                          _showSecondBox = true;
                        });
                      },
                      icon: Icon(Icons.arrow_forward),
                    ),
                  ),
                ],
              ),
              if (_showSecondBox) SizedBox(height: 20),
              if (_showSecondBox)
                Container(
                  height: 50,
                  child: TextField(
                    controller: _nameController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'ใส่ชื่อ',
                      filled: true,
                      fillColor: Colors.white60,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              if (_showSecondBox) SizedBox(height: 20),
              if (_showSecondBox)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        int number_people =
                            int.tryParse(_numberController.text) ?? 0;
                        String name = _nameController.text.trim();
                        if (name.isNotEmpty) {
                          _names.add(name);
                          _nameController.clear();

                          if (_names.length == number_people) {
                            setState(() {
                              _showSecondBox = false;
                              _names.clear();
                            });
                          }
                          assignToGroup(name);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff4c505b),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            "ชาวแก๊งค์",
                            style: TextStyle(fontSize: 30),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: groups.map((group) {
                              return ListTile(
                                title: Text(
                                  group,
                                  style: TextStyle(fontSize: 20),
                                ),
                                subtitle: Text(
                                    "จำนวนสมาชิก : ${groupmembers[group]!.length}\n${groupmembers[group]!.join(", ")}"),
                              );
                            }).toList(),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff4c505b),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'ดูรายชื่อสมาชิก',
                    style: TextStyle(color: Colors.white),
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
