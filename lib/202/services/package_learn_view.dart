import 'package:flutter/material.dart';
import 'package:flutter_hwa/package/launch_mixin.dart';
import 'package:flutter_hwa/package/loading_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({Key? key}) : super(key: key);

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView>
    with TickerProviderStateMixin, LaunchMixin {
  // this deki hata için
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).buttonTheme.colorScheme?.onPrimary,
            onPressed: (() {
              launchURL();
            })),
        appBar: AppBar(),
        body: LoadingBar());
  }
}
