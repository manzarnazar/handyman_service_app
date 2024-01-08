import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:share/share.dart';

class DynamicLinkHelper {
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  Future<void> initDynamicLinks(
      Function(PendingDynamicLinkData openLink) dataObj) async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      print("asdas");
      dataObj(dynamicLinkData);
    }).onError((error) {
      print('onLink error');
      print(error.message);
    });
  }

  Future<String> createDynamicLink(String screenPath) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://jawlah.page.link',
      link: Uri.parse("https://jawlah.org/${screenPath}"),
      androidParameters: const AndroidParameters(
        packageName: 'com.iqonic.handyman.admin',
        minimumVersion: 1,
      ),
      iosParameters: const IOSParameters(
        bundleId: 'com.iqonic.handyman.admin',
        minimumVersion: '1',
      ),
    );

    Uri url;

    final ShortDynamicLink shortLink =
        await dynamicLinks.buildShortLink(parameters);
    url = shortLink.shortUrl;
    return url.toString();
  }
}
