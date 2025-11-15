import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/presentation/provider/newhot_tabs_changer.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/new_hot/new_hot_tab_button.dart';
import 'package:provider/provider.dart';

class NewHotTabBars extends StatelessWidget {
  const NewHotTabBars({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Consumer<NewhotTabsChanger>(
        builder: (context, instance, child) => Row(
          children: [
            NewHotTabButton(
              onTap: () {
                instance.changeIndex(0);
              },
              isSelected: instance.index == 0,
              label: "Coming Soon",
              image:
                  'https://www.nicepng.com/png/detail/16-169469_popcorn-vector-transparent-popcorn-clipart.png',
            ),
            NewHotTabButton(
              onTap: () {
                instance.changeIndex(1);
              },
              isSelected: instance.index == 1,
              label: "Everyone's Watching",
              image:
                  'https://static.vecteezy.com/system/resources/previews/046/340/349/non_2x/fire-flame-clipart-design-illustration-free-png.png',
            ),
            NewHotTabButton(
              onTap: () {
                instance.changeIndex(2);
              },
              isSelected: instance.index == 2,
              label: "Games",
              image:
                  'https://imgs.search.brave.com/sZ3wndY9cnS0ks-Btl9-9iJs3uRS76XRZ4jx8_XZfsM/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/dmh2LnJzL2Rwbmcv/ZC80ODEtNDgxNDg1/M19nYW1lcy1pY29u/LXBuZy1waW5rLXRy/YW5zcGFyZW50LXBu/Zy5wbmc',
            ),
            NewHotTabButton(
              onTap: () {
                instance.changeIndex(3);
              },
              isSelected: instance.index == 3,
              label: "Top 10 Shows",
              image:
                  'https://media.gettyimages.com/id/2226484170/vector/top-10-best-of-list.jpg?s=2048x2048&w=gi&k=20&c=eJLYwALjyJYPwUfoSZ6HWlXqftrBtlEAEX5gDy549bw=',
            ),
            NewHotTabButton(
              onTap: () {
                instance.changeIndex(4);
              },
              isSelected: instance.index == 4,
              label: "Top 10 Movies",
              image:
                  'https://media.gettyimages.com/id/2226484170/vector/top-10-best-of-list.jpg?s=2048x2048&w=gi&k=20&c=eJLYwALjyJYPwUfoSZ6HWlXqftrBtlEAEX5gDy549bw=',
            ),
          ],
        ),
      ),
    );
  }
}
