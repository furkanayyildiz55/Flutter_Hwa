import 'package:flutter/material.dart';
import 'package:flutter_hwa/core/random_image.dart';
//Üç yatay değerden yalnızca ikisi ([sol], [sağ], [genişlik])
//ve üç dikey değerden yalnızca ikisi ([üst], [alt], [yükseklik]) ayarlanabilir.
//Her durumda, üçünden en az biri boş olmalıdır.

class StackDemoView extends StatelessWidget {
  const StackDemoView({Key? key}) : super(key: key);
  final double _cardHeight = 50;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          //Flex ile expanded sayfada 3 birimlik yer kaplıyor
          flex: 3,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(child: RandonImage(), bottom: _cardHeight / 2),
              Positioned(
                height: _cardHeight,
                width: 200,
                bottom: 0,
                child: Card(),
              )
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: RandonImage(),
                bottom: _cardHeight / 2,
              ),
              Positioned(height: _cardHeight, width: 200, bottom: 0, child: Card())
            ],
          ),
        ),
        const Spacer(
          flex: 4,
        )
      ],
    );
  }
}
