import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../data/data.dart';
import '../model/wallpaper_model.dart';
import '../widgets/widget.dart';


class Categories extends StatefulWidget {
  final String categoryName;
  Categories({required this.categoryName});
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  List<WallpaperModel> wallpapers = [];

  getSearchWallPapers(String query) async {
    var response = await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=10"),
        headers: {
          "Authorization": apiKey,
        });
    Map<String, dynamic> jsonData = jsonDecode(response.body);

    jsonData["photos"].forEach((element) {
      // print(element);
      WallpaperModel wallpaperModel = WallpaperModel(
          photographer: '',
          photographer_id: 0,
          photographer_url: '',
          src: SrcModel(original: '', portrait: '', small: ''));
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getSearchWallPapers(widget.categoryName);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: BrandName(),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [

              SizedBox(
                height: 16,
              ),
              wallpapersList(wallpapers, context)
            ],
          ),
        ),
      ),

    );
  }
}
