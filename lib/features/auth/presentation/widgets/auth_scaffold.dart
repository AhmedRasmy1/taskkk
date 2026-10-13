import 'package:flutter/material.dart';
import 'package:taskkk/core/extensions/media_query_helper.dart';
import 'package:taskkk/core/resources/app_constants.dart';
import 'package:taskkk/features/auth/presentation/widgets/auth_header.dart';
import 'package:taskkk/features/auth/presentation/widgets/bottom_action_button.dart';

/// Shared responsive layout of the auth screens:
/// header at the top, [body] centered in the free space, optional [footer]
/// above a full-width [BottomActionButton] pinned to the bottom.
class AuthScaffold extends StatelessWidget {
  const AuthScaffold({
    super.key,
    required this.title,
    this.subtitle,
    required this.body,
    this.footer,
    required this.buttonText,
    required this.onButtonPressed,
  });

  final String title;
  final String? subtitle;
  final Widget body;
  final Widget? footer;
  final String buttonText;
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    final gap = context.verticalGap;

    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: AppConstants.maxContentWidth,
                    ),
                    child: CustomScrollView(
                      slivers: [
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.pageHorizontalPadding,
                              vertical: gap,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                AuthHeader(title: title, subtitle: subtitle),
                                const Spacer(),
                                body,
                                const Spacer(),
                                if (footer != null) ...[
                                  footer!,
                                  SizedBox(height: gap),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BottomActionButton(
                text: buttonText,
                onPressed: onButtonPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
