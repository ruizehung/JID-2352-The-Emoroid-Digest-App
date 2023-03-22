import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({super.key});

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  final _formKey = GlobalKey<FormState>();

  /// Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController medicalController = TextEditingController();
  TextEditingController detailController = TextEditingController();

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      const String scriptURL =
          "https://script.google.com/macros/s/AKfycbyk6vsnpVODhTh65u394rGpjatVZKCy9sOageFmHZoJftTZMniXeI586LhV2rDy5m6emQ/exec";
      DateTime currentDate = DateTime.now();
      String time = '${currentDate.year}-${currentDate.month}-${currentDate.day}';
      String name = nameController.text;
      String medicalInsitution = medicalController.text;
      String detail = detailController.text;

      String queryString = "?time=$time&?name=$name&sex=$medicalInsitution&age=$detail";

      var finalURI = Uri.parse(scriptURL + queryString);
      var response = await http.get(finalURI);

      if (response.statusCode == 200) {
        var bodyR = convert.jsonDecode(response.body);
        print(bodyR);
      }
      _clear();
      Navigator.of(context).pop();
    }
  }

  void _clear() {
    nameController.clear();
    medicalController.clear();
    detailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Feedback Form',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'What is your name?',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      minLines: 1,
                      maxLines: 2,
                      decoration: InputDecoration(
                        hintText: 'Enter your name here',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your answer';
                        }
                        return null;
                      },
                      controller: nameController,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'What is your medical insitution?',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      minLines: 1,
                      maxLines: 2,
                      decoration: InputDecoration(
                        hintText: 'Enter your medical insitution here',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your answer';
                        }
                        return null;
                      },
                      controller: medicalController,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Please describe your feedback:',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      minLines: 4,
                      maxLines: 10,
                      decoration: InputDecoration(
                        hintText: 'Please describe your feedback here',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your answer';
                        }
                        return null;
                      },
                      controller: detailController,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    _submitForm();
                  },
                  child: const Text('Submit Feedback'),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
