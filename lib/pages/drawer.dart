import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/firebase.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({
    super.key,
  });

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
                    "users to access the visual summaries and podcasts released by The Emoroid Digest."
                    "Users are able to view and download visual summaries and listen to podcasts. See "),
            TextSpan(
                style: textStyle.copyWith(color: theme.colorScheme.primary),
                text:
                    'https://med.emory.edu/departments/medicine/divisions/digestive-diseases/education/emoroid-digest.html'),
            TextSpan(style: textStyle, text: ' for more info.'),
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
            )
            ),
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
                final uri = Uri.parse(urlString);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                } else {
                  throw 'Could not launch $urlString';
                }
              },
            )
      ]),
    );
  }
}
