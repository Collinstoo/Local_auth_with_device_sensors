import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class FaceFingerPrintAuth extends StatefulWidget {
  const FaceFingerPrintAuth({super.key});

  @override
  State<FaceFingerPrintAuth> createState() => _FaceFingerPrintAuthState();
}

class _FaceFingerPrintAuthState extends State<FaceFingerPrintAuth> {
  late final LocalAuthentication myauthentication;
  bool authState = false;
  @override
  void initState(){
    super.initState();
    myauthentication = LocalAuthentication();
    myauthentication.isDeviceSupported().then(
        (bool myAuth )=> setState(() {
          authState = myAuth;
        })
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('BIOMETRICS'),
        titleTextStyle: const TextStyle(
          fontSize: 17,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade100,
              ),
              onPressed: authentication,
                child: const Text(
                  'AUTHENTICATE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
  Future<void> authentication()async {
    try{
      bool isAuthenticate = await myauthentication.authenticate(
        localizedReason: 'local authentication',
        options: const AuthenticationOptions(
          stickyAuth: true,
          //if you have chosen biometricOnly to true it is not show other option to authenticate
          biometricOnly: true,
        ),
      );
      print('Authentication Status is : $isAuthenticate');
    } on PlatformException catch(e){
      print(e);
    }
    if(!mounted){
      return;
    }
  }
}



// import 'package:flutter/material.dart';
// import 'package:local_auth/local_auth.dart';
//
// class LocalAuthenticationScreen extends StatefulWidget {
//   @override
//   _LocalAuthenticationScreenState createState() => _LocalAuthenticationScreenState();
// }
//
// class _LocalAuthenticationScreenState extends State<LocalAuthenticationScreen> {
//   final LocalAuthentication _auth = LocalAuthentication();
//   bool _isAuthenticated = false;
//
//   Future<void> _authenticate() async {
//     try {
//       bool authenticated = await _auth.authenticate(
//         localizedReason: 'Please authenticate to access',
//         options: const AuthenticationOptions(
//           biometricOnly: true,
//         ),
//       );
//       setState(() {
//         _isAuthenticated = authenticated;
//       });
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Biometric Authentication'),
//       ),
//       body: Center(
//         child: _isAuthenticated
//             ? Text('Authenticated!', style: TextStyle(fontSize: 24))
//             : ElevatedButton(
//           onPressed: _authenticate,
//           child: Text('Authenticate'),
//         ),
//       ),
//     );
//   }
// }
