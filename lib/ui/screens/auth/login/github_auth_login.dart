part of 'login_screen.dart';

class GitHubSignInProvider {
  final Dio _dio = Dio();

  final String clientId = 'Ov23linoJovf7Nrih3Av';
  final String clientSecret = 'd88b5bbe17eb07750405160c224dd148616f6b7e';
  final String redirectUri =
      'https://crm-flutter-34719.firebaseapp.com/__/auth/handler';

  Future<void> signInWithGitHub(BuildContext context) async {
    final Uri authUrl = Uri.https('github.com', '/login/oauth/authorize', {
      'client_id': clientId,
      'redirect_uri': redirectUri,
      'scope': 'read:user user:email',
    });

    final String? code = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GitHubWebView(
          initialUrl: authUrl.toString(),
          redirectUri: redirectUri,
        ),
      ),
    );

    if (code != null) {
      final String? accessToken = await _getAccessTokenFromCode(code);
      if (accessToken != null) {
        final Map<String, dynamic>? userDetails =
            await _getUserDetailsFromGitHub(accessToken);
        if (userDetails != null) {
          final String? name = userDetails['name'];
          final String? email = await _getGitHubUserEmail(accessToken);

          getIt.get<AuthBloc>().add(AuthEvent.socialLogin(
                type: SocialLoginType.github,
                email: email,
                name: name,
              ));
        }
      }
    }
  }

  Future<String?> _getAccessTokenFromCode(String code) async {
    final response = await _dio.post(
      'https://github.com/login/oauth/access_token',
      options: Options(headers: {'Accept': 'application/json'}),
      data: {
        'client_id': clientId,
        'client_secret': clientSecret,
        'code': code,
        'redirect_uri': redirectUri,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = response.data;
      return responseBody['access_token'];
    }
    return null;
  }

  Future<Map<String, dynamic>?> _getUserDetailsFromGitHub(
    String accessToken,
  ) async {
    final response = await _dio.get(
      'https://api.github.com/user',
      options: Options(
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Accept': 'application/json',
        },
      ),
    );

    if (response.statusCode == 200) {
      return response.data;
    }
    return null;
  }

  Future<String?> _getGitHubUserEmail(String accessToken) async {
    final response = await _dio.get('https://api.github.com/user/emails',
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Accept': 'application/json',
          },
        ));

    if (response.statusCode == 200) {
      final List<dynamic> emails = response.data;
      final primaryEmail = emails.firstWhere(
        (email) => email['primary'] == true,
        orElse: () => null,
      );
      return primaryEmail != null ? primaryEmail['email'] : null;
    }
    return null;
  }
}

class GitHubWebView extends StatefulWidget {
  final String initialUrl;
  final String redirectUri;

  const GitHubWebView({
    super.key,
    required this.initialUrl,
    required this.redirectUri,
  });

  @override
  State<GitHubWebView> createState() => _GitHubWebViewState();
}

class _GitHubWebViewState extends State<GitHubWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(widget.redirectUri)) {
              final uri = Uri.parse(request.url);
              final code = uri.queryParameters['code'];
              Navigator.of(context).pop(code);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.initialUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GitHub Sign In')),
      body: WebViewWidget(controller: controller),
    );
  }
}
