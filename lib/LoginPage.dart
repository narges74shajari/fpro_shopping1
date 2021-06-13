import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shopping_app/LoginResponceModel.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  var usernameController=TextEditingController();
  var passwordController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ورود",
          style: TextStyle(color: Colors.black45),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black45,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: LoginUI(),
    );
  }
Widget LoginUI(){
    return Builder(
      builder: (context) => Stack(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 20,right: 50),
          child:Text(
            "SignIn",
            style: TextStyle(fontSize:55,color: Colors.grey[400] ),
          ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: 70,right: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Material(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        hintText: "نام کاربری",
                        icon: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(Icons.perm_identity,color: Colors.grey[500],),
                        )
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                      controller: usernameController,
                    ),
                    elevation: 20,
                    borderRadius: BorderRadius.circular(40),
                    shadowColor: Colors.grey[200],

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Material(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          hintText: "رمز عبور",
                          icon: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Icon(Icons.lock_outline,color: Colors.grey[500],),
                          )
                      ),
                      obscureText: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                      controller: passwordController,
                    ),

                    elevation: 20,
                    borderRadius: BorderRadius.circular(40),
                    shadowColor: Colors.grey[200],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30,right: 30),
                    child: Material(
                      elevation: 20,
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.red[900],
                      child: InkWell(
                        onTap: (){
                          sendLoginReqest(context:context,username: usernameController.text, password: passwordController.text);
                        },
                        child: Container(
                          height: 80,

                          child: Center(
                            child: Text(
                              "ورود",
                              style: TextStyle(color: Colors.white,fontSize:20),
                            ),
                          ),

                        ),
                      ) ,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
}

void sendLoginReqest({@required BuildContext context ,@required String username,@required String password}) async{

    var url=Uri.parse("http://95.216.69.11:3000/db.json");
    var body=Map<String,dynamic>();
    body["username"]=username;
    body["password"]=password;
    Response response=await post(url,body: body);
    if(response.statusCode==200){
      //successful
      var loginJson=json.decode(utf8.decode(response.bodyBytes));
      var model=LoginResponseModel(loginJson["result"], loginJson["message"]);

      showMySnackBar(context, model.message);
      
    }
    else{
      //error
      showMySnackBar(context, "درخواست با خطا مواجه شد");
    }
}
void showMySnackBar(BuildContext context,String message){
    Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(message,style: TextStyle(fontSize: 15),),

        ));
}
}










