import 'package:flutter/material.dart';

import './models/video.dart';
import './widgets/video_item.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favorite Videos',
      home: VideosList(videos: <Video>[
        Video('Youtuber 1', '1000'),
        Video('Youtuber 2', '2000'),
        Video('Youtuber 3', '3000'),
      ],),
    );
  }
}

class VideosList extends StatefulWidget {
  const VideosList({Key key, this.videos}) : super(key: key);

  final List<Video> videos;

  @override
  _VideosListState createState() => _VideosListState();
}

class _VideosListState extends State<VideosList> {
  Set<Video> _favoriteVideos = Set<Video>();

  void _handleFavoriteChanged(Video video, bool isFavorite) {
    setState(() {
      if (!isFavorite) {
        _favoriteVideos.add(video);
      } else {
        _favoriteVideos.remove(video);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Videos'),
      ),
      body: _buildListView(),
    );
  }

  Widget _buildListView() {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      children: widget.videos.map((Video video) {
        return VideoListItem(
          video: video,
          isFavorite: _favoriteVideos.contains(video),
          onFavoriteChanged: _handleFavoriteChanged,
        );
      }).toList(),
    );
  }
}
