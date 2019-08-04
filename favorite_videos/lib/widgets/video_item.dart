import 'package:flutter/material.dart';

import '../models/video.dart';

// A typedef can be used to specify a function signature that we want specific
// functions to match.
typedef void VideoChangedCallback(Video video, bool isFavorite);

class VideoListItem extends StatelessWidget {
  const VideoListItem(
      {Key key, this.video, this.isFavorite, this.onFavoriteChanged})
      : super(key: key);

  final Video video;
  final bool isFavorite;
  final VideoChangedCallback onFavoriteChanged;

  Color _getColor(BuildContext context) {
    return isFavorite ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!isFavorite) return null;

    return TextStyle(
        color: Colors.black54, decoration: TextDecoration.lineThrough);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onFavoriteChanged(video, isFavorite);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(video.name[0]),
      ),
      title: Text(
        video.name,
        style: _getTextStyle(context),
      ),
      subtitle: Text(
        video.views,
        style: _getTextStyle(context),
      ),
    );
  }
}
