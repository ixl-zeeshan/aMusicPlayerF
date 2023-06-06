import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: const Center(child: Text("zeeshan")),
      onTap: () {
        showBottomSheet(
          context: context,
          builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "btm sheet",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "btm sheet",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "btm sheet",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "btm sheet",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        );
      },
    );
  }
}
