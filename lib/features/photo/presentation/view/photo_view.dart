import 'package:task_app/core/common/exports.dart';

  import 'package:flutter/material.dart';

  class PhotoView extends StatefulWidget {
    const PhotoView({super.key});
  
    @override
    State<PhotoView> createState() => _PhotoViewState();
  }
  
  class _PhotoViewState extends State<PhotoView> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('PhotoView'),
        ),
        body: const Center(
          child: Text('PhotoView'),
        ),
      );
    }
  }
              
              