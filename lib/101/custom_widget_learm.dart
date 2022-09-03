import 'package:flutter/material.dart';

class CustomWidgetLearn extends StatelessWidget {
  CustomWidgetLearn({Key? key}) : super(key: key);
  final String title = "Food";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //App barı es geçmiyorumki widget aşağıdan başlasın
        appBar: AppBar(),
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CostomFoodButton(
                    title: title,
                    onPressed: () {}
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: CostomFoodButton(title: title, onPressed: () {  }, ),
            )
          ],
        ));
  }
}

//Ana Class ta nesne oluşturmadan ve statik kullanmadan, sınıf içindekileri kullanmak istersek
//ana class da "with" kelimesini kullanarak Colorsutility classının gücünü tanıtabilirim...
//Bu durum sınıf başlatındaki const ifadelerine kızacaktır, kaldırmak gerekir!..

//--Tanımlanan değişken sayısı çok fazla ise sistemi yorar
//--Bu tarz tema değişkenlerini almanın en iyi yolu Tema dır
//++Kolay entegrasyon sağlar, nesne üretme ihtiyacı duymaz
class _ColorsUtility {
  final redColor = Colors.red;
  final WhiteColor = Colors.white;
}

class _PaddingUtility {
  final EdgeInsets normalPadding = EdgeInsets.all(8);
  final EdgeInsets normal2xPadding = EdgeInsets.all(16);
}

//CUSTOM COMPENENT - CORE COMPENENT 
//Core compenenette olay yapılan kompenenti sayfadan bağımsız bir şekilde heryerde kullanabilmek :) 
class CostomFoodButton extends StatelessWidget
    with _ColorsUtility, _PaddingUtility {
  CostomFoodButton({Key? key, required this.title,required this.onPressed}) : super(key: key);
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:
          ElevatedButton.styleFrom(primary: redColor, shape: StadiumBorder()),
      onPressed: onPressed,
      child: Padding(
        padding: normal2xPadding,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: WhiteColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
//Özel componentin sayfa için paddingleri, sayfda verilmeli...
//padding compenentin içine eklenirse karışıklıklar meydana gelebilir