import 'package:flutter/material.dart';

class MyNetflixPage extends StatefulWidget {
  const MyNetflixPage({super.key});

  @override
  State<MyNetflixPage> createState() => _MyNetflixPageState();
}

class _MyNetflixPageState extends State<MyNetflixPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(child: Text("my netflix page"));
  }

  @override
  bool get wantKeepAlive => true;
}
