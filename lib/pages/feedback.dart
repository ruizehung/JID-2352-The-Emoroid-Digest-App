import 'dart:convert';
import 'package:emoroid_digest_app/utils/firebase.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({super.key});

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  final _formKey = GlobalKey<FormState>();
  String _feedbackOrBugs = 'Feedback';
  String _detailText = 'Please describe you feedback: ';
  var isFeedback = "true";

  /// Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController medicalController = TextEditingController();
  TextEditingController detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: <Widget>[
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
                    Row(children: const <Text>[
                      Text(
                        'What is your name? ',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text('*', style: TextStyle(color: Colors.red, fontSize: 18)),
                    ]),
                    const SizedBox(height: 3),
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
                    const SizedBox(height: 10),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'What is your email address?',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 3),
                    TextFormField(
                      minLines: 1,
                      maxLines: 2,
                      decoration: InputDecoration(
                        hintText: 'Enter your email address here',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                      ),
                      controller: emailController,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'What is your medical insitution?',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 3),
                    TextFormField(
                      minLines: 1,
                      maxLines: 2,
                      decoration: InputDecoration(
                        hintText: 'Enter your medical insitution here',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                      ),
                      controller: medicalController,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text(
                            'Feedback',
                          ),
                          value: 'Feedback',
                          groupValue: _feedbackOrBugs,
                          onChanged: _handleRadioValueChange,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Bugs Report'),
                          value: 'Bugs Report',
                          groupValue: _feedbackOrBugs,
                          onChanged: _handleRadioValueChange,
                        ),
                      ),
                    ],
                  ),
                ]),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(children: <Text>[
                      Text(
                        _detailText,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const Text('*', style: TextStyle(color: Colors.red, fontSize: 18)),
                    ]),
                    const SizedBox(height: 3),
                    TextFormField(
                      minLines: 4,
                      maxLines: 10,
                      decoration: InputDecoration(
                        hintText: 'Please describe it here',
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
                    const SizedBox(height: 10),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _submitForm();
                      // Navigator.of(context).pop();
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Feedback Submission'),
                              content: Text('Thank you for your $_feedbackOrBugs'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Close'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    }
                  },
                  child: const Text('Submit Feedback'),
                ),
              ],
            ),
          ),
        ),
      ),
    ]));
  }

  void _handleRadioValueChange(String? value) {
    setState(() {
      _feedbackOrBugs = value as String;
      if (value == 'Bugs Report') {
        _detailText = 'Please describe the bug: ';
        isFeedback = "false";
      } else {
        _detailText = 'Please describe your feedback: ';
        isFeedback = "true";
      }
    });
  }

  void _submitForm() async {
    final feedback = {
      "email": emailController.text,
      "name": nameController.text,
      "institution": medicalController.text,
      "isFeedback": isFeedback,
      "detail": detailController.text,
    };
    addFeedback(feedback);
    _clear();
  }

  void _clear() {
    nameController.clear();
    medicalController.clear();
    detailController.clear();
    emailController.clear();
  }
}
