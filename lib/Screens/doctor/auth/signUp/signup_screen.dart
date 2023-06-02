import 'package:design/AppConstant/app_color.dart';
import 'package:design/Screens/doctor/auth/signIn/signin_screen.dart';
import 'package:design/Screens/doctor/auth/signUp/signup_otp_screen.dart';
import 'package:design/Screens/widgets/appbar.dart';
import 'package:design/Screens/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String dropdownValue = "";

  @override
  void initState() {
    dropdownValue = "0";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset : false,
      body: Column(
        children: [
          const SecondAppbar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(38),
                const CommonText.semiBold("Doctor Sign up", size: 25, color: AppColor.black),
                const Gap(38),
                const CommonText.medium("Mobile No.", size: 18, color: AppColor.greyText),
                Padding(
                  padding: const EdgeInsets.only(right: 35),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Mobile',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor.greyText),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor.greyText),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (input) {
                      final isDigitsOnly = int.tryParse(input!);
                      return isDigitsOnly == 10 ? 'Input needs to be digits only' : null;
                    },
                  ),
                ),
                const Gap(65),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUpOtpScreen()));
                    },
                    child: Container(
                      height: 53,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: AppColor.black, borderRadius: BorderRadius.circular(6)),
                      child: const CommonText.medium("Send OTP", size: 22, color: AppColor.white),
                    ),
                  ),
                ),
                const Gap(89),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    const CommonText.medium("Have an account ? ", size: 16, color: Color(0xFF313131)),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignInScreen()));
                        },
                        child: const CommonText.semiBold("Login", size: 16, color: AppColor.blueText)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
