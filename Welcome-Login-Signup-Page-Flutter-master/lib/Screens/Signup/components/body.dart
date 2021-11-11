import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
//import 'package:flutter_auth/components/rounded_password_field.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
//import  'package:flutter/src/widgets/framework.dart';
//package:flutter/src/widgets/editable_text.dart;


class signup extends StatefulWidget{
  @override
 Body createState() => Body();
 
}

class Body extends State<signup> {
  TextEditingController _fullname = TextEditingController();
   TextEditingController _cellphone= TextEditingController();
  TextEditingController _numberplate = TextEditingController();
 // TextEditingController _password = TextEditingController();


   final GlobalKey<FormState> _formkey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          key: _formkey,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGN UP TO SANTACO",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
           

             Image.asset(
                "assets/images/logo.jpg",
              width: size.width * 0.3,
            ),
            RoundedInputField(
              hintText: "FULL NAME",
              onChanged: (value) {},
             /*controller: _cellphone,
              validator: (String value){
                    / if(value.isEmpty)
                     {
                        return 'Please a Enter full name';
                      }
                     return null;
                    },*/


            ),
            RoundedInputField(
              hintText: "CELLPHONE NUMBER",
              onChanged: (value) {},
              
            ),
            RoundedInputField(
              hintText: "NUMBER PLATE",
              onChanged: (value) {},
            ),
           /* RoundedPasswordField(
              onChanged: (value) {},
              

            ),*/
            RoundedButton(
              text: "SIGNUP",
              press: () {
               if(_formkey.currentState.validate())
                      {
                        RegistrationUser();

                        //userSignIn();
                        print("successful");
                     // Navigator.of(context).push(MaterialPageRoute(builder: (context) => login()));

                      }else{
                        print("UnSuccessfull");
                      }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

Future RegistrationUser() async{
    var APIURL = "http://192.168.88.22/flutter/signup.php";

    Map mapeddate = {
      'cellphone': _cellphone.text,
      'fullname': _fullname.text,
      'numberplate': _numberplate.text,
      'password': _cellphone.text,
     
    };
//print("JSON DATA: ${mapeddate}");

    http.Response reponse = await http.post(APIURL,body:mapeddate);

    var data = json.decode(reponse.body);


    print("DATA: ${data}");
  }

}
 

