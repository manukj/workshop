import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Instagram_logo.svg/2560px-Instagram_logo.svg.png",
                    width: 100,
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.add_circle_outline_sharp,
                          size: 20,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.message_outlined,
                          size: 20,
                        ),
                      ),
                      Icon(
                        Icons.heart_broken,
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BorderContainer extends StatelessWidget {
  final Widget child;

  const BorderContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }
}
