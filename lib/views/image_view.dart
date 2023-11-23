import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  final String imgUrl;

  ImageView({required this.imgUrl});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.imgUrl,
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  widget.imgUrl,
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                          color: Color(0xff1C1B1B).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 2,
                        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white54),
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                                colors: [Color(0x36FFFFFF), Color(0x0FFFFFFF)])),
                        child: Column(
                          children: [
                            Text(
                              "Set Wallpaper",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            Text(
                              "Image will be saved in gallery",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
