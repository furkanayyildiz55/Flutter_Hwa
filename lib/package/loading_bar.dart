import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//Bu tarz dışarıdan alınan paketler başka sayfadan verilmesi ana sayfada karışıklık yapmamak adına çok önemli

class LoadingBar extends StatelessWidget {
  LoadingBar({Key? key, this.size}) : super(key: key);
  final double? size;
  final _defaultSize = 40.0;

  @override
  Widget build(BuildContext context) {
    return SpinKitPianoWave(
      color: Colors.redAccent,
      size: size ?? _defaultSize,
      //controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
    );
  }
}
