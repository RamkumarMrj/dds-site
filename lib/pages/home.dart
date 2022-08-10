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
      alignment: Alignment.center,
      child: Center(
        child: Column(
          children: <Widget>[
            const SelectableText(
              "Good things take time..🤍 Digital Document Scanner",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
              textScaleFactor: 4,
            ),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  ElevatedButton(
                    onPressed: _launchUrl,
                    child: Text("Visit Web App"),
                  ),
                  Text("\t\t\t"),
                  ElevatedButton(
                    onPressed: _launchUrl,
                    child: Text("Download App"),
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
