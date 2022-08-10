import 'package:flutter/material.dart';
import 'package:site/pages/modules/simple_animations_package.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("color1").add(
          const Duration(seconds: 3),
          ColorTween(
              begin: const Color(0xff8a113a), end: Colors.lightBlue.shade900)),
      Track("color2").add(const Duration(seconds: 3),
          ColorTween(begin: const Color(0xff440216), end: Colors.blue.shade600))
    ]);

    return ControlledAnimation(
      playback: Playback.MIRROR,
      tween: tween,
      duration: tween.duration,
      builder: (context, dynamic animation) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [animation["color1"], animation["color2"]])),
        );
      },
    );
  }
}

class CenteredText extends StatelessWidget {
  const CenteredText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      child: Center(
        child: Column(
          children: <Widget>[
            const Text("\n"),
            const Text(
              "🤍 Digital Document Scanner",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
              textScaleFactor: 4,
            ),
            const Divider(),
            const Text("\n"),
            const SelectableText(
              "Digital Document Scanner allows the user to scan and save documents either in local storage or in cloud. By using this type of scanner, nobody can face the issue while they are switching between various platforms like Android, IOS or any web application.",
              style: TextStyle(
                  color: Color(0xFFE8E3E3), fontWeight: FontWeight.w100),
              textScaleFactor: 4,
            ),
            const Text("\n"),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 50),
                      maximumSize: const Size(200, 50),
                    ),
                    onPressed: _launchUrl,
                    child: const Text("Visit Web App"),
                  ),
                  const Text("\t\t\t"),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 50),
                      maximumSize: const Size(200, 50),
                    ),
                    onPressed: _launchUrl2,
                    child: const Text("Download App"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_launchUrl() async {
  const url = 'https://digi.scanall.app';
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchUrl2() async {
  const url = 'https://github.com/RamkumarMrj/dds-site/releases';
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Could not launch $url';
  }
}
