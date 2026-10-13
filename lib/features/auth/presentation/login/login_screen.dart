import 'package:flutter/material.dart';
import 'package:taskkk/core/extensions/media_query_helper.dart';
import 'package:taskkk/core/resources/color_manager.dart';
import 'package:taskkk/core/resources/strings_manager.dart';
import 'package:taskkk/core/theme/app_text_styles.dart';
import 'package:taskkk/core/utils/validators.dart';
import 'package:taskkk/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:taskkk/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:taskkk/features/auth/presentation/widgets/labeled_switch.dart';
import 'package:taskkk/features/auth/presentation/widgets/password_form_field.dart';
import 'package:taskkk/features/auth/presentation/widgets/terms_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;
    // TODO(firebase): sign in with the entered data.
  }

  void _onForgotPasswordPressed() {
    // TODO(firebase): reset password flow.
  }

  @override
  Widget build(BuildContext context) {
    final gap = context.verticalGap;

    return AuthScaffold(
      title: StringsManager.loginTitle,
      subtitle: StringsManager.loginSubtitle,
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFormField(
              controller: _usernameController,
              label: StringsManager.username,
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.username],
              validator: Validators.username,
              isValid: Validators.isValidUsername,
            ),
            SizedBox(height: gap),
            PasswordFormField(
              controller: _passwordController,
              validator: Validators.password,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => _onLoginPressed(),
            ),
            SizedBox(height: gap),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                onPressed: _onForgotPasswordPressed,
                style: TextButton.styleFrom(
                  foregroundColor: ColorManager.error,
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  textStyle: AppTextStyles.label,
                ),
                child: const Text(StringsManager.forgotPassword),
              ),
            ),
            SizedBox(height: gap),
            LabeledSwitch(
              label: StringsManager.rememberMe,
              value: _rememberMe,
              onChanged: (value) => setState(() => _rememberMe = value),
            ),
          ],
        ),
      ),
      footer: TermsText(onTermsPressed: () {}),
      buttonText: StringsManager.login,
      onButtonPressed: _onLoginPressed,
    );
  }
}
