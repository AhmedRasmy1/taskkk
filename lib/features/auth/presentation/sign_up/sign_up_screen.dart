import 'package:flutter/material.dart';
import 'package:taskkk/core/extensions/media_query_helper.dart';
import 'package:taskkk/core/resources/strings_manager.dart';
import 'package:taskkk/core/utils/validators.dart';
import 'package:taskkk/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:taskkk/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:taskkk/features/auth/presentation/widgets/labeled_switch.dart';
import 'package:taskkk/features/auth/presentation/widgets/password_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  bool _rememberMe = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _onSignUpPressed() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;
    // TODO(firebase): create the account with the entered data.
  }

  @override
  Widget build(BuildContext context) {
    final gap = context.verticalGap;

    return AuthScaffold(
      title: StringsManager.signUpTitle,
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFormField(
              controller: _usernameController,
              label: StringsManager.username,
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.newUsername],
              validator: Validators.username,
              isValid: Validators.isValidUsername,
            ),
            SizedBox(height: gap),
            PasswordFormField(
              controller: _passwordController,
              validator: Validators.password,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: gap),
            CustomTextFormField(
              controller: _emailController,
              label: StringsManager.emailAddress,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              autofillHints: const [AutofillHints.email],
              validator: Validators.email,
              isValid: Validators.isValidEmail,
              onFieldSubmitted: (_) => _onSignUpPressed(),
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
      buttonText: StringsManager.signUp,
      onButtonPressed: _onSignUpPressed,
    );
  }
}
