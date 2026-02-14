import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadSongPage extends ConsumerStatefulWidget {
  const UploadSongPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UploadSongPageState();
}

class _UploadSongPageState extends ConsumerState<UploadSongPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload Song')),
      body: Column(
        children: [
          DottedBorder(
            child: Column(
              children: [
                Icon(Icons.folder_open, size: 40),
                Text('Select the thumbnail', style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
