import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';

class NewHotPage extends StatefulWidget {
  final double width;

  const NewHotPage({super.key, required this.width});

  @override
  State<NewHotPage> createState() => _NewHotPageState();
}

class _NewHotPageState extends State<NewHotPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      padding: EdgeInsets.only(top: widget.width * 0.25),
      width: double.infinity,
      color: AppColors.otherBgColor,
      child: Column( 
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  label: Text("Coming Soon"),
                  icon: Icon(Icons.icecream),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
