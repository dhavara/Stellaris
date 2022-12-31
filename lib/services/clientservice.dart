part of 'services.dart';

class ClientService extends OAuth2Client {
  ClientService({required String redirectUri, required String customUriScheme})
      : super(
            authorizeUrl: 'https://oauth.fatsecret.com/connect/authorize', //Your service's authorization url
            tokenUrl: 'https://oauth.fatsecret.com/connect/token', //Your service access token url
            redirectUri: 'redirectUri',
            customUriScheme: customUriScheme);
}
