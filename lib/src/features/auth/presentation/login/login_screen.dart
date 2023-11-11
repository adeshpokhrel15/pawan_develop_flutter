import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mechanic_baato/src/common/botons/submit_button.dart';
import 'package:mechanic_baato/src/common/butons/facebook_button.dart';
import 'package:mechanic_baato/src/common/butons/google_button.dart';
import 'package:mechanic_baato/src/common/form_fields/divider_field.dart';
import 'package:mechanic_baato/src/common/widgets/id_field.dart';
import 'package:mechanic_baato/src/common/widgets/password_field.dart';
import 'package:mechanic_baato/src/features/auth/presentation/login/login_screen_controller.dart';
import 'package:mechanic_baato/src/features/auth/presentation/login_signup_label.dart';
import 'package:mechanic_baato/src/features/core/application/user_service.dart';
import 'package:mechanic_baato/src/utils/extensions/async_value_extensions.dart';
import 'package:mechanic_baato/src/utils/extensions/string_extensions.dart';
import 'package:mechanic_baato/src/utils/managers/default_manager.dart';
import 'package:mechanic_baato/src/utils/managers/values_manager.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _idController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _emailFocusNode = FocusNode();

  final _passwordFocusNode = FocusNode();

  _login(BuildContext context, WidgetRef ref) async {
    if (_formKey.currentState!.validate()) {
      // pop the soft keyboard
      FocusScope.of(context).unfocus();
      final response = await ref
          .read(loginScreenControllerProvider.notifier)
          .signInWithIdAndPassword(
              _idController.text, _passwordController.text);
      if (response) {
        // context.goNamed(appRoute.home.name);
        //     context.goNamed(appRoute.trackMechanic.name);
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(loginScreenControllerProvider,
        (previous, state) => state.showError(context));

    String name = "Krishna";
    final user = ref.watch(watchUserStateChangesProvider).value;
    final state = ref.watch(loginScreenControllerProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: user != null ? Text('Hello, ${user.name}'.hardcoded()) : null,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IdField(
                      title: 'Id'.hardcoded(),
                      labelText: "Phone/email".hardcoded(),
                      hintText: "Enter your number or your valid email address"
                          .hardcoded(),
                      controller: _idController,
                      focusNode: _emailFocusNode,
                    ),
                    const SizedBox(
                      height: DefaultManager.defaultSpace,
                    ),
                    PasswordField(
                      title: "Password".hardcoded(),
                      labelText: "Password".hardcoded(),
                      hintText: "Enter your password".hardcoded(),
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                    ),
                    const SizedBox(
                      height: AppHeight.h30,
                    ),
                    SubmitButton(
                      showSpinner: state.isLoading,
                      label: 'Login'.hardcoded(),
                      onPressed: () => _login(context, ref),
                    ),
                    DividerField(
                      text: 'Or'.hardcoded(),
                    ),
                    GoogleButton(
                        labelText: "Sign in with Google".hardcoded(),
                        onPressed: () {}),
                    FacebookButton(
                        labelText: 'Log in with Facebook'.hardcoded(),
                        onPressed: () {}),
                    LoginSignUpLabel(
                      infoText: 'Don\'t have an account ?'.hardcoded(),
                      labelText: 'Register'.hardcoded(),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
