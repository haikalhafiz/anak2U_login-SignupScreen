import 'dart:core';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';



class LoginSignUp extends StatefulWidget {
  @override
  _LoginSignUpState createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUp> {

  bool isMale = true;
  bool isSignupPage = true;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      body: Stack(
        children: [
          Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Container(
                    height: 180,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                            boxShadow: [ BoxShadow(
                                      color: Colors.black.withOpacity(0.4),
                                      blurRadius: 15,
                                      spreadRadius: 5,
                                    )
                                  ],
                        image: DecorationImage(
                          image: AssetImage("assets/images/anak2u.jpeg"),
                          fit: BoxFit.fill
                        )
                      ),

                  ),
                ),

          AnimatedPositioned(
                 duration: Duration(milliseconds: 400),
                 curve: Curves.easeInCirc,
                 top: 180,
                 child: AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeInCirc,
                          height: isSignupPage? 400 :300,
                          padding: EdgeInsets.all(15), //add margin "login & sign up" from border of the box//
                          width: MediaQuery.of(context).size.width-40,
                          margin: EdgeInsets.symmetric(horizontal: 20),//margin 20 px from left&right//
                          decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                           BoxShadow(
                                             color: Colors.black.withOpacity(0.3),
                                             blurRadius: 15,
                                             spreadRadius: 5,
                                           )
                                              ]
                                      ),
                          child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            isSignupPage = false;
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            Text("LOGIN",style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: !isSignupPage? Colors.indigo[900]:Colors.indigo[50],
                                                  ),
                                                 ),
                                        if (!isSignupPage)
                                            Container(
                                              margin: EdgeInsets.only(top: 3),
                                                height: 2,
                                                width: 55,
                                                color: Colors.redAccent,
                                                 )
                                                ],
                                              ),
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            isSignupPage = true;
                                          });
                                        },

                                        child: Column(
                                          children: [
                                            Text("SIGN UP",style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: isSignupPage? Colors.indigo[900]: Colors.indigo[50]
                                            ),
                                            ),
                                        if(isSignupPage)
                                            Container(
                                              margin: EdgeInsets.only(top: 3),
                                              height: 2,
                                              width: 55,
                                              color: Colors.redAccent,
                                            )
                                          ],
                                        ),
                                      ),

                                           ],
                                        ),
                                  if (isSignupPage)
                                  buildSignUpSection(),
                                   Container(
                                     margin: EdgeInsets.only(top: 20),
                                     child: Column(
                                       children: [
                                         buildTextField(MaterialCommunityIcons.account_outline,
                                             "User Name",false,false ),
                                         SizedBox(height: 15,),
                                         buildTextField(MaterialCommunityIcons.lock_outline,
                                             "********",true,false ),
                                         Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: [
                                             Row(
                                             children: [
                                               Checkbox(
                                                   value: rememberMe,
                                                   activeColor: Colors.black,
                                                   onChanged: (value){
                                                     setState(() {
                                                       rememberMe =!rememberMe;
                                                     });
                                                   }
                                                    ),
                                               Text("Remember me",
                                                      style:TextStyle(fontSize: 12,color:Colors.black),
                                                      )
                                                 ],
                                               ),
                                            TextButton(
                                              onPressed: (){},
                                              child: Text("Forgot Password",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                            )
                                          ]
                                          )
                                              ],
                                     )
                                   )
                                      ],
                                   ),
                              ) ,
          ),  //Main Container for Login and Sign up//
          AnimatedPositioned(
              duration: Duration(milliseconds: 400),
              curve: Curves.easeInCirc,
              top: isSignupPage? 510 : 450,
              right: 0,
              left: 0,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    onTap: (){

                            },

                    onHover: (value){
                            setState(() {

                            });
                    },//inkwell widget to make the container clickable//
                    child: Container(
                        padding: EdgeInsets.all(3),
                        height: 60,
                        width: isSignupPage? 302: 150,

                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeInCirc,
                          decoration: BoxDecoration(
                            color: Colors.pink[300],
                            borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: isSignupPage? Colors.black.withOpacity(0.3): Colors.white.withOpacity(1),
                                  blurRadius: isSignupPage? 5: 0,
                                  spreadRadius: isSignupPage?4:2,

                                )
                              ]
                              ),
                          child: Center(child: isSignupPage? Text("Submit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold
                                    
                                ),)
                                 : Text("Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold

                            ),) ),


                             ),
                    ),
                  ),
                ),
              )
          ),
        ],

      ),
    );
  }

  Container buildSignUpSection() {
    return Container(
                                  margin: EdgeInsets.only(top: 25),
                                  child: Column(
                                        children: [
                                          buildTextField(MaterialCommunityIcons.account_outline,
                                           "User Name",false,false ),
                                          SizedBox(height: 15,),
                                          buildTextField(MaterialCommunityIcons.email_outline,
                                              "Email",false,true ),
                                          SizedBox(height: 15,),
                                          buildTextField(MaterialCommunityIcons.lock_outline,
                                              "Password",true,false ),

                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: (){
                                                  setState(() {
                                                    isMale = true;
                                                  });
                                                },
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 30,
                                                      height:30,
                                                      margin: EdgeInsets.only(right: 9,top: 10),
                                                      decoration: BoxDecoration(
                                                              color: isMale? Colors.tealAccent[700] : Colors.white,
                                                //if user choose MALE,, when they press male's radio, the radio turn color tealaccent,otherwise
                                                //if user chose FEMALE,the radio goes white//
                                                              border: Border.all(
                                                                width: 2,
                                                                color: Colors.blueGrey[100],
                                                                 ),
                                                              borderRadius: BorderRadius.circular(15)
                                                           ),
                                                      child: Icon(
                                                                  MaterialCommunityIcons.account_outline,
                                                                  color:isMale? Colors.white: Colors.blueGrey[100],
                                                                  ),
                                                       ),
                                                    Text("Male",style: TextStyle(color: Colors.teal[900]),)
                                                   ],
                                                 ),
                                              ),
                                              SizedBox(width: 30,),
                                              GestureDetector(
                                                onTap: (){
                                                  setState(() {
                                                    isMale = false;
                                                  });
                                                },
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 30,
                                                      height:30,
                                                      margin: EdgeInsets.only(right: 9,left: 10,top: 10),
                                                      decoration: BoxDecoration(
                                                          color: isMale? Colors.white: Colors.tealAccent[700],
                                                          border: Border.all(
                                                              width: 2,
                                                              color: Colors.blueGrey[100]
                                                          ),
                                                          borderRadius: BorderRadius.circular(15)
                                                      ),
                                                      child: Icon(
                                                        MaterialCommunityIcons.account_outline,
                                                        color: isMale? Colors.blueGrey[100] :Colors.white,
                                                      ),
                                                    ),
                                                    Text("Female",style: TextStyle(color: Colors.teal[900]),)
                                                  ],
                                                ),
                                              )],
                                          ) ,
                                          Container(
                                            width: 250,
                                            margin: EdgeInsets.only(top:10),
                                            child: RichText(
                                                textAlign: TextAlign.center,
                                                text: TextSpan(
                                                      text: "By pressing 'Submit' you agree to our ",
                                                      style: TextStyle(color: Colors.blueGrey[200]),
                                                      children: [
                                                              TextSpan(
                                                                text: "Term & Conditions",
                                                                style: TextStyle(color: Colors.blue[900])
                                                              )
                                                             ]
                                                      )
                                                  ),
                                          )
                                               ],
                                        ),
                                );
  }

  TextField buildTextField(
      IconData icon,String hintText,bool isPassword,bool isEmail
      )  {
    return TextField(
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress :TextInputType.text,
        decoration: InputDecoration(
            prefixIcon: Icon(
                icon,
                color: Colors.blueGrey[100]
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.teal[200]),
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.teal[200]),
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            contentPadding: EdgeInsets.all(10), //to make text field narrower//
            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey[350]
            )
        ),
    );
  }
}
