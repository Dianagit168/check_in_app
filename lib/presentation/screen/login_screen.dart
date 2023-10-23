import 'dart:ui';
import 'package:check_in_app/funtional.dart';
import 'package:check_in_app/index.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  
  final LoginUcImpl loginUcImpl = LoginUcImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(46, 37, 67, 148),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://d2yy7txqjmdbsq.cloudfront.net/fundraiserevents/c15a39a1-6022-4a18-9cba-5ddcf0153bcd/logo_profile.jpg'))),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(
                  color: const Color.fromARGB(46, 37, 67, 148),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Please login now !',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _fieldLogin(
                          context,
                          const Icon(
                            LucideIcons.user,
                            color: Colors.white,
                          ),
                          'User Name',
                          loginUcImpl.emailController,
                        ),
                        _fieldLogin(
                          context,
                          const Icon(
                            LucideIcons.lock,
                            color: Colors.white,
                          ),
                          'Password',
                          loginUcImpl.passwordController,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 120, right: 120),
                    child: ElevatedButtonCust(
                      tit: 'Login',
                      btnHigh: 40,
                      onNavigator: () {
                        fetchUser(context, loginUcImpl.emailController.value.text, loginUcImpl.passwordController.value.text);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fieldLogin(
    BuildContext context,
    final Icon? icon,
    final String title,
    final TextEditingController? controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 3,
              color: const Color.fromARGB(255, 37, 67, 148),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: icon!,
            ),
            controller: controller,
          ),
        ),
      ],
    );
  }
}
