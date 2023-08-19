import 'package:flutter/material.dart';
import 'package:flutter_login_ui/language/language_items.dart';
import 'package:flutter_login_ui/utils/customColors.dart';
import 'package:flutter_login_ui/utils/customTextStyle.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _suffixIcon = false;
  bool _obscureText = true;

  void _changeSuffixIcon() {
    setState(() {
      _suffixIcon = !_suffixIcon;
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: CustomColors.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topImage(height),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleText(),
                  customSizedBox(),
                  usernameTextField(context),
                  customSizedBox(),
                  passwordTextField(context),
                  customSizedBox(),
                  forgotPasswordButton(context),
                  customSizedBox(),
                  loginButton(width, context),
                  customSizedBox(),
                  signUpButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Center signUpButton(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: Text(
          LanguageItems().hesapOlustur,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: CustomColors.textColor),
        ),
      ),
    );
  }

  Center loginButton(double width, BuildContext context) {
    return Center(
      child: SizedBox(
        width: width * 0.50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: CustomColors.loginButtonColor),
          onPressed: () {},
          child: Text(
            LanguageItems().girisYap,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: CustomColors.loginButtonTextColor,
                ),
          ),
        ),
      ),
    );
  }

  Center forgotPasswordButton(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: Text(
          LanguageItems().sifremiUnuttum,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: CustomColors.textColor),
        ),
      ),
    );
  }

  TextField passwordTextField(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      obscuringCharacter: LanguageItems().obscuringCharacter,
      keyboardType: TextInputType.visiblePassword,
      autofillHints: const [AutofillHints.password],
      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: CustomColors.textFieldTextColor),
      decoration: InputDecoration(
        hintText: CustomTextFieldItems.sifre.getText(),
        hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(color: CustomColors.hintTextColor),
        suffixIcon: IconButton(
          onPressed: () {
            _changeSuffixIcon();
          },
          icon: AnimatedCrossFade(
            firstChild: const Icon(Icons.visibility_outlined),
            secondChild: const Icon(Icons.visibility_off_outlined),
            crossFadeState: _suffixIcon ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(seconds: 2),
          ),
        ),
      ),
    );
  }

  TextField usernameTextField(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
      autofillHints: const [AutofillHints.name],
      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: CustomColors.textFieldTextColor),
      decoration: InputDecoration(
        hintText: CustomTextFieldItems.kullaniciAdi.getText(),
        hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(color: CustomColors.hintTextColor),
        suffixIcon: const Icon(Icons.person),
      ),
    );
  }

  Text titleText() {
    return Text(
      LanguageItems().titleText,
      style: CustomTextStyle.titleTextStyle,
    );
  }

  SizedBox customSizedBox() => const SizedBox(height: 25);

  SizedBox topImage(double height) {
    return SizedBox(
      height: height * 0.25,
      child: Image.asset(
        LanguageItems().topImagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}

enum CustomTextFieldItems {
  kullaniciAdi,
  sifre,
}

extension textFieldExtension on CustomTextFieldItems {
  String getText() {
    switch (this) {
      case CustomTextFieldItems.kullaniciAdi:
        return "Kullanıcı Adı";
      case CustomTextFieldItems.sifre:
        return "Şifre";
      default:
        return "";
    }
  }
}
