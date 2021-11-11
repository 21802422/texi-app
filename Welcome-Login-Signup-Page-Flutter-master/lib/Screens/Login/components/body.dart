import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';

class Body extends StatelessWidget {
  //TextEditingController _cellphone = TextEditingController();
  //TextEditingController _password = TextEditingController();
 // const Body({
   // Key key,
 // }) //: super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN TO SANTACO",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
             Image.asset(
                "assets/images/logo.jpg",
              width: size.width * 0.3,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Cellphone Number",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                
                /*if(_formkey.currentState.validate())
                      {

                        userSignIn();
                        print("successful");


                      }else{
                        print("UnSuccessfull");
                      }   */                                      
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
                
                 //SizedBox(height: size.height * 0.04),
           // Forgot_password(
             // press: () {
              //  Navigator.push(
                 // context,
                 // MaterialPageRoute(
                  //  builder: (context) {
                    //  return SignUpScreen();
                  //  },
                  //),
              //  );
              
              },
            ),
          ],
        ),
      ),
    );
  }

 /*Future userSignIn() async{

    var url = "http://192.168.88.22/flutter/login.php";
    var data = {
      "cellphone": _cellphone.text,
      "password": _password.text,
    };
    print("JSON DATA: ${data}");
    var res = await http.post(url, body:data);

    if(json.decode(res.body) == "i dont have an account"){
      print('you unfortunately dont have account');
      // Fluttertoast.showToast(msg: "Please create an account first!",toastLength: Toast.LENGTH_SHORT);
      // _showToast(context);
    }else{
      if(jsonDecode(res.body) == "false"){
        print('the wrong password');
        // _showToast(context);

      }else{
        if(json.decode(res.body) == "true"){
          print('successful login');
        };

      }

    }

  }*/

}
