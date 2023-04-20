import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/firebase.dart';
import 'global_navigation_state.dart';

class HomePageDrawer extends StatelessWidget {
  late GlobalKey<NavigatorState> navigatorKeyBody;

  HomePageDrawer({super.key, required this.navigatorKeyBody});

  final EmoroidDigestSiteURL = "https://med.emory.edu/departments/medicine/divisions/digestive-diseases/education/emoroid-digest.html";

  _launchURL(String url) async {
  Uri url0 = Uri.parse(url);
  if (await launchUrl(url0)) {
    await launchUrl(url0);
  } else {
    throw 'Could not launch $url0';
  }
}

  List<Widget> getAboutBoxChildren(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle textStyle = theme.textTheme.bodyMedium!;
    return <Widget>[
      const SizedBox(height: 24),
      RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
                style: textStyle,
                text: "The Emoroid Digest App is a mobile app available on both iOS and Android platforms that allow"
                    "users to access the visual summaries and podcasts released by The Emoroid Digest. "
                    "Users are able to view and download visual summaries and listen to podcasts."),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: Column(children: [
        Container(
            padding: const EdgeInsets.only(top: 80),
            child: ListTile(
              leading: const Icon(
                Icons.question_mark,
                size: 20,
              ),
              title: const Text(
                "About",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () async {
                Navigator.of(context).pop();
                showAboutDialog(
                  context: context,
                  applicationIcon: Image.asset(
                    "assets/logo.png",
                    width: 50,
                    height: 50,
                  ),
                  applicationName: 'Emoroid Digest App',
                  applicationVersion: 'April 2023',
                  applicationLegalese: '\u{a9} 2023 The Emoroid Digest Team',
                  children: getAboutBoxChildren(context),
                );
              },
            )),
        ListTile(
          leading: const Icon(
            Icons.privacy_tip_outlined,
            size: 20,
          ),
          title: const Text(
            "Privacy Policy",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          onTap: () async {
            Navigator.of(context).pop();
            final urlString = await getPrivacyPolicyURLFromFirestore();
            _launchURL(urlString);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.feedback_outlined,
            size: 20,
          ),
          title: const Text(
            "Feedback",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          //Need to add the Navigator function
          onTap: () {
            Navigator.of(context).pop();
            () async {
              Provider.of<GlobalNavigationState>(context, listen: false).page = 1;
              await navigatorKeyBody.currentState!.pushNamed("/feedback");
              // ignore: use_build_context_synchronously
              Provider.of<GlobalNavigationState>(context, listen: false).updateBasedOnRoute();
            }();
          },
        ),
      ]),
    );
  }
}
