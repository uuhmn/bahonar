import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';


class MainHome extends StatefulWidget {
  MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();

}
final List<String> imageUrls = [
  'http://picsum.photos/id/237/200/300',
  'http://picsum.photos/id/238/200/300',
  'http://picsum.photos/id/239/200/300',
  'http://picsum.photos/id/240/200/300',
  'http://picsum.photos/id/241/200/300',
  'http://picsum.photos/id/242/200/300',
  'http://picsum.photos/id/243/200/300',
  'http://picsum.photos/id/244/200/300',
  'http://picsum.photos/id/245/200/300',
  'http://picsum.photos/id/246/200/300',
];


class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تصاویر',style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: GridView.builder(
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: imageUrls.length,
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.0,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
          ),
          itemBuilder: (context, index) {
            if (index < imageUrls.length) {
              return CachedNetworkImage(
                imageUrl: imageUrls[index],
                fit: BoxFit.cover,
              );
            }
          },
        ),
    );
  }
}
