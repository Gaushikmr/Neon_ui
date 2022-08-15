import 'package:flutter/material.dart';
import 'package:neon_ui_blood_donation/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  Color kPrimaryColorRed = const Color.fromARGB(255, 183, 25, 25);
  final bloodTypeList = ['A+', 'U+', 'O', 'AB', 'D', 'C'];
  final rhFactors = ['DONATE', 'RECEIVE'];
  final whoOwn = ['YOU', 'FRIEND'];
  bool _recieveNotifications = true;
  String? selectedBloodType;
  String selectedRh = "";
  String selectedOwn = "";
  String? selectedown;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.bloodtype_rounded,
                size: 90,
                color: Color.fromARGB(255, 183, 25, 25),
              ),
              Spacer(),
              const Text(
                "Do you want to Donate/ Receive",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
              // Spacer(),
              const Text(
                "Please pick your blood type",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              // TextButton(
              //   onPressed: () {},
              //   child: const Text(
              //     "Don't know about blood type?",
              //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              //   ),
              // ),
              _selectRHfactor(),
              _selectOwn(),
              _selectBloodType(),
              const Spacer(),
              _notificationsAgree(),
              _finishButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _selectRHfactor() {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            child: rhTile(title: "DONATE", selectedTitle: selectedRh),
            onTap: () {
              setState(() {
                selectedRh = "DONATE";
              });
            },
          ),
          InkWell(
            child: rhTile(title: "RECEIVE", selectedTitle: selectedRh),
            onTap: () {
              setState(() {
                selectedRh = "RECEIVE";
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _selectOwn() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            child: rhTile(title: "YOU", selectedTitle: selectedOwn),
            onTap: () {
              setState(() {
                selectedOwn = "YOU";
              });
            },
          ),
          InkWell(
            child: rhTile(title: "FRIEND", selectedTitle: selectedOwn),
            onTap: () {
              setState(() {
                selectedOwn = "FRIEND";
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _selectBloodType() {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: bloodTypeList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 100,
        ),
        itemBuilder: ((context, index) => InkWell(
              onTap: () {
                setState(() {
                  selectedBloodType = bloodTypeList[index];
                  print(selectedBloodType);
                });
              },
              child: Container(
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: selectedBloodType == bloodTypeList[index]
                      ? kPrimaryColorRed
                      : Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(45),
                ),
                child: Center(
                    child: Text(
                  bloodTypeList[index],
                  style: TextStyle(
                      fontSize: 20,
                      color: selectedBloodType == bloodTypeList[index]
                          ? Colors.white
                          : null),
                )),
              ),
            )));
  }

  Widget _notificationsAgree() {
    return CheckboxListTile(
        title: const Text(
            "I want tot recieve notifications about blood donation campaigns"),
        value: _recieveNotifications,
        onChanged: ((value) => setState(() {
              _recieveNotifications = value!;
            })));
  }

  Widget _finishButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 75),
      child: Row(
        children: [
          Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: kPrimaryColorRed,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35)),
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    if (selectedBloodType != null && selectedRh != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SecondPage()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text("You need to select blood type and rh")));
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("Finish"),
                  ))),
        ],
      ),
    );
  }

  Widget rhTile({required String title, required String selectedTitle}) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: selectedTitle == title
            ? kPrimaryColorRed
            : Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(20),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 18, color: selectedTitle == title ? Colors.white : null),
      ),
    );
  }
}
