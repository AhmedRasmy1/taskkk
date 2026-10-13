import 'package:flutter/material.dart';
import 'package:taskkk/core/resources/app_constants.dart';
import 'package:taskkk/core/resources/strings_manager.dart';
import 'package:taskkk/core/routes/routes_manager.dart';
import 'package:taskkk/features/auth/presentation/widgets/auth_redirect_text.dart';
import 'package:taskkk/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:taskkk/features/auth/presentation/widgets/social_button.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: StringsManager.getStartedTitle,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // TODO(firebase): hook up the social sign-in providers.
          SocialButton.facebook(onPressed: () {}),
          const SizedBox(height: AppConstants.spaceSm),
          SocialButton.twitter(onPressed: () {}),
          const SizedBox(height: AppConstants.spaceSm),
          SocialButton.google(onPressed: () {}),
        ],
      ),
      footer: AuthRedirectText(
        prefix: StringsManager.alreadyHaveAccount,
        actionText: StringsManager.signIn,
        onPressed: () => Navigator.pushNamed(context, Routes.login),
      ),
      buttonText: StringsManager.createAccount,
      onButtonPressed: () => Navigator.pushNamed(context, Routes.signUp),
    );
  }
}
