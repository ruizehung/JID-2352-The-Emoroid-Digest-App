import 'package:emoroid_digest_app/utils/isar_service.dart';
import 'package:flutter/material.dart';
import '../../models/visual_summary.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Go back"),
        ),
        ElevatedButton(
          onPressed: () {
            print(IsarService().getUniqueKeywords());
          },
          child: const Text("Go back"),
        ),
        TextField(
            onChanged: (value) {},
            controller: null,
            decoration: const InputDecoration(
                labelText: "Search",
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25))))),
        const Text("This is search page"),
      ],
    );
  }
}
