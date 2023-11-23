import 'package:flutter/material.dart';
import 'package:wallpaperhub/views/image_view.dart';
import '../model/wallpaper_model.dart';

Widget BrandName() {
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
      children: const <TextSpan>[
        TextSpan(text: 'Wallpaper', style: TextStyle(color: Colors.black45)),
        TextSpan(text: 'Hub', style: TextStyle(color: Colors.blueAccent)),
      ],
    ),
  );
}

Widget wallpapersList(List<WallpaperModel> wallpapers, context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: wallpapers.map((wallpaper) {
        return GridTile(
            child: GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ImageView(imgUrl: wallpaper.src.portrait)));
          },
          child: Hero(
            tag: wallpaper.src.portrait,
            child: Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child:
                      Image.network(wallpaper.src.portrait, fit: BoxFit.cover)),
            ),
          ),
        ));
      }).toList(),
    ),
  );
}
