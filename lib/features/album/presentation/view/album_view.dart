import 'package:task_app/core/common/exports.dart';

  import 'package:flutter/material.dart';

  class AlbumView extends StatefulWidget {
    const AlbumView({super.key});
  
    @override
    State<AlbumView> createState() => _AlbumViewState();
  }
  
  class _AlbumViewState extends State<AlbumView> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('AlbumView'),
        ),
        body: const Center(
          child: Text('AlbumView'),
        ),
      );
    }
  }
              
              