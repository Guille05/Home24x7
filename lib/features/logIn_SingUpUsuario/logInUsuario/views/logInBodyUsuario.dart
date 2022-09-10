import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../../../util/funcoesLogIn/funcaoPestadorLoginEmailNaoExiste.dart';
import '../../../../util/libraryComponents/colors/colorGradient.dart';
import '../../../../daos/firebase/authService.dart';
import '../../../../util/libraryComponents/popUps/popUpEmailNaoExiste.dart';
import '../../../../util/libraryComponents/popUps/popUpLogInSenhaIncorreta.dart';
import '../../../hubUsuario/presenterHub.dart';
import '../../esqueceuSenhaUsuario/esqueceuSenhaUsuaioScreen.dart';
import '../../signUpUsuario/views/signUpBody.dart';
import 'fazerAsFuncoesLOGINESALVAr.dart';

GoogleSignInAccount? _usuarioAtual;

class LogInBodyUsuario extends StatefulWidget {
  const LogInBodyUsuario({
    Key? key,
  }) : super(key: key);
  @override
  _LogInBodyUsuario createState() => _LogInBodyUsuario();
}

class _LogInBodyUsuario extends State<LogInBodyUsuario> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKeyAuthenticationLogIn = GlobalKey<FormState>();

  Map? _userData;
  bool _estaEscondido = false;

  GoogleSignInAccount? usuario = _usuarioAtual;
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return usuario == null && _userData == null
        ? _usuarioNaologado(context)
        : _usuarioLogado(context);
  }

  @override
  Widget _usuarioNaologado(BuildContext context) {
    FuncaoPestadorLogInEmailNaoExiste funcaoPestadorLogInEmailNaoExiste =
        FuncaoPestadorLogInEmailNaoExiste(emailController: emailController);
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecorationColorGradient(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(12, 36, 0, 0),
                child: SizedBox(child: BackArrowLogInScreen())),

            const SizedBox(height: 14),
            // #login, #welcome
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome back",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        // #email, #password
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(171, 171, 171, .7),
                                  blurRadius: 20,
                                  offset: Offset(0, 10)),
                            ],
                          ),
                          child: Form(
                            key: _formKeyAuthenticationLogIn,
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade200)),
                                  ),
                                  child: TextFormField(
                                    controller: emailController,
                                    cursorColor: Colors.indigoAccent,
                                    validator: (emailController) =>
                                        !EmailValidator.validate(
                                                emailController!)
                                            ? 'Invalid E-mail'
                                            : null,
                                    decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.close),
                                          onPressed: () =>
                                              emailController.clear(),
                                        ),
                                        hintText: "E-mail",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade200)),
                                  ),
                                  child: TextFormField(
                                    controller: passwordController,
                                    obscureText: _estaEscondido,
                                    cursorColor: Colors.indigoAccent,
                                    validator: (passwordController) {
                                      if (passwordController!.isEmpty ||
                                          !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
                                              .hasMatch(passwordController)) {
                                        return "Your password must contain an Upper Case letter, \n a lower case letter, a number and be at least 8 characters long";
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                        suffix: InkWell(
                                          onTap: _togglePasswordView,
                                          child: Icon(
                                            _estaEscondido
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                          ),
                                        ),
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        // #login
                        Container(
                          height: 50,
                          child: Center(
                            child: RoundedLoadingButton(
                              controller: _btnController,
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.blue.shade900,
                                        Colors.blue.shade500,
                                        Colors.blue.shade400
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0)),
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 350.0, minHeight: 50.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Continue',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                final formLogIn =
                                    _formKeyAuthenticationLogIn.currentState!;
                                if (await funcaoPestadorLogInEmailNaoExiste
                                        .checkIfEmailInUse() ==
                                    false) {
                                  await mostrarErroEmailInvalido();
                                } else if (formLogIn.validate()) {
                                  await AuthService().loginUser(emailController.text, passwordController.text);
                                  if(await AuthService().loginUser(emailController.text, passwordController.text)== null){
                                    print(await AuthService().loginUser(emailController.text, passwordController.text));
                                    mostrarSenhaIncorreta();
                                  }else{
                                    Navigator.pushAndRemoveUntil(context,
                                      MaterialPageRoute(builder: (BuildContext context) {
                                        return PresenterHubUsuario.presenter();
                                       },
                                      ),
                                          (route)=> false,);
                                  }
                                }
                                _btnController.reset();
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        GestureDetector(
                          child: Text(
                            'Forgot your password?',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue[600],
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EsqueceuSenhaUsuarioScreen())),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        GestureDetector(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Sign Up',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.blue[600],
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => SignUpUsuarioBody())),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                                child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors
                                      .white, //[Colors.blue.shade900,Colors.blue.shade500,  Colors.blue.shade400]
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(20.0),
                                  ),
                                ),
                                onPressed: () async {
                                  await signInWithFacebook();
                                  },
                                child: Center(
                                  child: Container(
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          FontAwesomeIcons.facebook,
                                          color: Colors.indigoAccent,
                                        ),
                                        SizedBox(
                                          width: screenWidth * 0.03,
                                        ),
                                        Text(
                                          'Sign-Up with Facebook',
                                          style: TextStyle(
                                              fontSize: screenWidth <348 ?15.5 :18,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )),
                            SizedBox(width: screenWidth * 0.02564 * .7),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future<UserCredential> signInWithFacebook() async {

    final LoginResult loginResult = await FacebookAuth.instance.login(
        permissions: [
          'email', 'public_profile', 'user_birthday'
        ]
    );

    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void _togglePasswordView() {
    setState(() {
      _estaEscondido = !_estaEscondido;
    });
  }

  Widget _usuarioLogado(BuildContext context) {
    return PresenterHubUsuario.presenter();
  }

  Future mostrarErroEmailInvalido() => showDialog(
        context: context,
        builder: (context) => PopUpEmailNaoExiste(),
      );
  Future mostrarSenhaIncorreta() => showDialog(
    context: context,
    builder: (context) => PopUpSenhaEstaIcorreta(),
  );
}
