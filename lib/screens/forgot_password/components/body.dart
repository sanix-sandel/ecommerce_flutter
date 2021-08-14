import 'package:ecommerce/components/custom_suffix_icon.dart';
import 'package:ecommerce/components/default_buttom.dart';
import 'package:ecommerce/components/form_error.dart';
import 'package:ecommerce/components/no_account_text.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.04,
                  ),
                  Text(
                    "Forgot Password",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(28),
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Please enter your email and we will send \nyou a link to return your account",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.1,
                  ),
                  ForgotPasswordForm()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  late String email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => this.email = newValue!,
            onChanged: (value) {
              //remove the error message when using started typing
              if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                setState(() {
                  errors.remove(kEmailNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.remove(kInvalidEmailError);
                });
              }
              return null;
            },
            validator: (value) {
              if ((value == null || value.isEmpty) &&
                  !errors.contains(kEmailNullError)) {
                setState(() {
                  errors.add(kEmailNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value!) &&
                  !errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.add(kInvalidEmailError);
                });
              }
              return null;
            },
            decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg")),
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          FormError(errors: errors),
          SizedBox(
            height: SizeConfig.screenHeight * 0.1,
          ),
          DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState!.validate()) {
                  //send an email to the user
                }
              }),
          SizedBox(
            height: SizeConfig.screenHeight * 0.1,
          ),
          NoAccountText()
        ],
      ),
    );
  }
}
