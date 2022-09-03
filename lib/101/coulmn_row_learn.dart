import 'package:flutter/material.dart';
///EXPANDED : Coumn veya Row içinde bulunan birden fazla elementi expanded ile sarmalarsak 
///bu elementlerin arasına eşit hizade boşluk bırakır
///Anlam 2: Expanded elementleri bulundurkları yere sığddırmaya çalışır
///EXPANDEd -> FLEX : Uygulamaya responsive özellik katar
///Coulmn veya row içideki flexdeki elemanların değerini 10 a tamamlarız ve flex onlara o şekilde boşluk ayarlar
///Bulunduğu alanın sizeını 10 ala böler ve flex değerine göre compenente size aatar

///SPACER : Elemanlar arasına boşluk ekler, Flex değeri vardır
class CoulmnRowLearn extends StatelessWidget {
  const CoulmnRowLearn({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        //mainAxisSize: MainAxisSize.min, //Widget en küçük alanı kaplayacak sekilde ayarlanır...
        children: [
          Expanded(flex:4 ,child: Container(color: Colors.blue)),
          Expanded(flex: 1, child: Container(color: Colors.yellow)),
          Spacer(flex: 2,),
          Expanded(flex: 3, child: Container(color: Colors.green)),

        ],
      ),
      
    );
  }
}