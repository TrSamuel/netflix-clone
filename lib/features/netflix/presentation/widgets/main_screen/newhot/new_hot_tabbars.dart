import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/newhot/new_hot_tab_button.dart';

class NewHotTabbars extends StatelessWidget {
  const NewHotTabbars({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          NewHotTabButton(
            index: 0,
            label: "Coming Soon",
            image:
                'https://www.pngmart.com/files/3/Popcorn-Transparent-PNG.png',
          ),
          NewHotTabButton(
            index: 1,
            label: "Everyone's Watching",
            image:
                'https://static.vecteezy.com/system/resources/previews/046/340/349/non_2x/fire-flame-clipart-design-illustration-free-png.png',
          ),
          NewHotTabButton(
            index: 2,
            label: "Games",
            image:
                'https://imgs.search.brave.com/sZ3wndY9cnS0ks-Btl9-9iJs3uRS76XRZ4jx8_XZfsM/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/dmh2LnJzL2Rwbmcv/ZC80ODEtNDgxNDg1/M19nYW1lcy1pY29u/LXBuZy1waW5rLXRy/YW5zcGFyZW50LXBu/Zy5wbmc',
          ),
          NewHotTabButton(
            index: 3,
            label: "Top 10 Shows",
            image:
                'https://media.gettyimages.com/id/2226484170/vector/top-10-best-of-list.jpg?s=2048x2048&w=gi&k=20&c=eJLYwALjyJYPwUfoSZ6HWlXqftrBtlEAEX5gDy549bw=',
          ),
          NewHotTabButton(
            index: 4,
            label: "Top 10 Movies",
            image:
                'https://media.gettyimages.com/id/2226484170/vector/top-10-best-of-list.jpg?s=2048x2048&w=gi&k=20&c=eJLYwALjyJYPwUfoSZ6HWlXqftrBtlEAEX5gDy549bw=',
          ),
        ],
      ),
    );
  }
}
