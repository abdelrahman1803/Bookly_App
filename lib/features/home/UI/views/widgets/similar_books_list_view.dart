import 'package:bookly_app/features/home/UI/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return const CustomBookItem(
            imageUrl:
                'https://scontent.fcai19-1.fna.fbcdn.net/v/t39.30808-6/465796954_1740435256809270_7751944406033086737_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=QK0xaWA0mbMQ7kNvwE_tEdw&_nc_oc=Adl0o7anLgiNkiB4LL3QNpKaAv11ivfFecbcEOHFikvKpIjwsNdmaOUWQZhJoslbaRI&_nc_zt=23&_nc_ht=scontent.fcai19-1.fna&_nc_gid=iY-LX4rvKqHyCrvTuKfkMg&oh=00_AfndDF7jZjLyXbMwOFx_Wdqqys6VlVMIVZbjBMOOmguvMA&oe=693E341B',
          );
        },
      ),
    );
  }
}
