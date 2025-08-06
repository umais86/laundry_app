import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CustomSizedVideo extends StatefulWidget {
  final double width;
  final double height;

  const CustomSizedVideo({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  State<CustomSizedVideo> createState() => _CustomSizedVideoState();
}

class _CustomSizedVideoState extends State<CustomSizedVideo> {
  late VideoPlayerController _controller;
  bool _isError = false;
  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      _controller = VideoPlayerController.asset('assets/videos/akoya_home.mp4');
      await _controller.initialize();
      _controller
        ..setLooping(true)
        ..setVolume(0)
        ..play();
      if (mounted) setState(() {});
    } catch (e) {
      if (mounted) setState(() => _isError = true);
      debugPrint('Video error: $e');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isError) {
      return Container(
        width: widget.width,
        height: widget.height,
        color: Colors.grey[200],
        child: const Center(child: Icon(Icons.error)),
      );
    }
    return _controller.value.isInitialized
        ? SizedBox(
            width: widget.width,
            height: widget.height,
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          )
        : Container(
            width: widget.width,
            height: widget.height,
            color: Colors.grey[200],
            child: const Center(child: CircularProgressIndicator()),
          );
  }
}
