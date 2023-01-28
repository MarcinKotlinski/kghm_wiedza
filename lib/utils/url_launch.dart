import 'package:url_launcher/url_launcher.dart';

class UrlLaunch {

  UrlLaunch._();

  static Future<void> openWebSite(String webSite) async {
    final Uri _url = Uri.parse(webSite);
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'Could not open website.';
    }
  }
}