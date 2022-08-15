import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  Color kPrimaryColorRed = const Color.fromARGB(255, 183, 25, 25);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ))
        ],
      ),
      drawer: const Drawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            topText(),
            const Spacer(),
            _bloodTypeGrid(),
            const Spacer(),
            _buttons(),
            const Spacer(),
            _btmTextButton("Can i give blood?"),
            _btmTextButton("Share on social medial!"),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  Widget topText() {
    return const Text(
      "Blood bank stock near you!",
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
      textAlign: TextAlign.center,
    );
  }

  Widget _bloodTypeGrid() {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 8,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 50,
          mainAxisExtent: 70,
        ),
        itemBuilder: ((context, index) => InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.all(5),
                child: Center(
                    child: Icon(
                  Icons.bloodtype_outlined,
                  color: kPrimaryColorRed,
                  size: 70,
                )),
              ),
            )));
  }

  Widget _buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        button("Donate Now", Icons.mic_rounded),
        button("Campaign", Icons.speaker_group)
      ],
    );
  }

  Widget _btmTextButton(String title) {
    return TextButton(onPressed: () {}, child: Text(title));
  }

  Widget button(String title, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Icon(
            icon,
            size: 40,
            color: kPrimaryColorRed,
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 20, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
