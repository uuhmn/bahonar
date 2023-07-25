import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

final List<String> videoUrls = [
  'https://dl12.mp4.ir/video/2023/3/244533-489742650/244533-489742650-480.mp4',
  'https://dl12.mp4.ir/video/2023/3/244533-489742650/244533-489742650-480.mp4',
  'https://dl12.mp4.ir/video/2023/3/244533-489742650/244533-489742650-480.mp4',
  // ...
];

class _MoviesScreenState extends State<MoviesScreen> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    // initialize ChewieController
    _chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.network(
        videoUrls[0],
      ),
      autoInitialize: true,
      looping: false,
      autoPlay: false,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    // dispose ChewieController
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('فیلم',style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: videoUrls.length,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          mainAxisSpacing: 2.0,
          crossAxisSpacing: 2.0,
        ),
        itemBuilder: (context, index) {
          if (index < videoUrls.length) {
            return InkWell(
              onTap: () {
                // navigate to video screen
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => VideoScreen(videoUrl: videoUrls[index]),
                  ),
                );
              },
              child: CachedNetworkImage(
                imageUrl: 'http://picsum.photos/id/240/200/300',
                fit: BoxFit.cover,
              ),
            );
          }
        },
      ),
    );
  }
}

class VideoScreen extends StatefulWidget {
  final String videoUrl;

  const VideoScreen({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    // initialize ChewieController
    _chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.network(
        widget.videoUrl,
      ),
      autoInitialize: true,
      looping: false,
      autoPlay: false,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    // dispose ChewieController
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('فیلم',style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Chewie(
        controller: _chewieController,
      ),
    );
  }
}