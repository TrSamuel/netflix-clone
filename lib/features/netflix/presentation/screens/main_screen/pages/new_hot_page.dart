import 'package:flutter/material.dart';

class NewHotPage   extends StatefulWidget {
  const NewHotPage({super.key});

  @override
  State<NewHotPage> createState() => _NewHotPageState();
}

class _NewHotPageState extends State<NewHotPage> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(child: Text("New & hot"),);
  }
  
  @override
  bool get wantKeepAlive => true;
}
