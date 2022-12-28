part of 'services.dart';

class AccessTokenService {
  var client = ClientService(
      redirectUri: 'stellaris.site/',
      customUriScheme: 'stellaris.dietaryminder.app');

  Future<AccessTokenResponse> requestAccessToken(
      String clientId, String clientSecret) async {
    AccessTokenResponse accessToken = await client
        .getTokenWithClientCredentialsFlow(
            clientId: clientId, clientSecret: clientSecret, scopes: ['basic']);

    return accessToken;
  }

  Future<AccessTokenResponse> refreshAccessToken(
      AccessTokenResponse accessToken, String clientId) async {
    AccessTokenResponse refreshToken = await client
        .refreshToken(accessToken.refreshToken!, clientId: clientId);

    return refreshToken;
  }
}
