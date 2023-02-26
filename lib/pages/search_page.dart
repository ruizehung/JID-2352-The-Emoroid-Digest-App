import 'package:flutter/material.dart';
import '../../models/visual_summary.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("This is search page"),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Go back"),
        ),
      ],
    );
  }
}
