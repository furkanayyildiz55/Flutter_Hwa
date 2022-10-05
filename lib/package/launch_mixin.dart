//Mixin
//Contructor u olmayan ve instance oluşturulamayan class yapısıdır.
// 'on State<PackageLearnView>' yapısı ile bu mixin sadece bu türdeki classlara with yapılıp eklenebilir

import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import '../202/services/package_learn_view.dart';

mixin LaunchMixin on State<PackageLearnView> {
  Future<void> launchURL() async {
    Uri _url = Uri(
      scheme: 'https',
      host: 'www.google.com.tr',
    );

    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    }
  }
}
