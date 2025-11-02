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
                  label: Text(
                    "Coming Soon",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    
                    ),
                  ),
                  icon: Image.network(
                    'https://www.nicepng.com/png/detail/16-169469_popcorn-vector-transparent-popcorn-clipart.png',
                    height: 25,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.whiteColor,
                    foregroundColor: AppColors.otherBgColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColors.whiteColor, width: 1),
                      borderRadius: BorderRadiusGeometry.circular(45),  
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  label: Text(
                    "Everyone's Watching",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  icon: Image.network(
                    'https://static.vecteezy.com/system/resources/previews/046/340/349/non_2x/fire-flame-clipart-design-illustration-free-png.png',
                    height: 25,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.otherBgColor,
                    foregroundColor: AppColors.whiteColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColors.whiteColor, width: 1),
                      borderRadius: BorderRadiusGeometry.circular(45),  
                    ),
                  ),
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
