import 'package:flutter/material.dart';

class IndicatorLearn extends StatelessWidget {
  const IndicatorLearn({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [CenterCircularProgress()],
      ),
      body:LinearProgressIndicator() ,
      
    ); 
  }
}

//Yükleniyor widgeti
//Projelerde indicator rengi hep sabit olduğundan dışarıdan renk parametresine ihtiyaç yok.
//Rengi ThemeData dan alması daha mantıklı
class CenterCircularProgress extends StatelessWidget {
  const CenterCircularProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(),);
  }
}