import 'package:flutter/material.dart';

class FourPage extends StatelessWidget {
  const FourPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Four Page'),
      ),
      body: Center(
        child: Text('This is the content of the Four page'),
      ),
    );
  }
}
