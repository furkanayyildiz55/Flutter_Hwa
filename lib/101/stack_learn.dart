import 'package:flutter/material.dart';
///STACK : Sıklıkla  üst üste binmiş yapılarda kullanılır
///Her zaman son verilen en üsttedir

class StackLearn extends StatelessWidget {
  const StackLearn({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(color: Colors.blue, height: 200,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(color: Colors.yellow, height: 200,),
          ),
          Positioned(top: 100,right: 25,left: 25,height: 50,child: Container(color: Colors.purple))

        ],
      ),
    );
  }
}