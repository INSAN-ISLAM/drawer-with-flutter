import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "INSAN ISLAM",
      debugShowCheckedModeBanner: false,
      home: MyhomePage(),
    );
  }
}

class MyhomePage extends StatelessWidget {
  const MyhomePage({super.key});


  MySnackBar(message,context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }
  MyAlertDialog(context){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return Expanded(
              child: AlertDialog(
                title: Text("Alert !"),
                content: Text("Do you know me?"),
                actions: [
                  TextButton(onPressed: (){
                    MySnackBar("thanks",context);
                    Navigator.of(context).pop();
                  }, child: Text("Yes")),
                  TextButton(onPressed: (){
                    MySnackBar("Bye",context);
                    Navigator.of(context).pop();}, child: Text("No")),
                ],
              )
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Flutter  Best AppBar ",
            style: TextStyle(
            fontStyle: FontStyle.italic,
           color: Colors.orange,
            fontSize: 15,
        ),
        ),
        elevation: 56,
        shadowColor: Colors.amber,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        //iconTheme: IconThemeData(color: Colors.green),
        actionsIconTheme: IconThemeData(color: Colors.yellow),
        leading: GestureDetector(
          onTap: () {MyAlertDialog(context);},
          child: Icon(
            Icons.menu,  // add custom icons also
          ),
        ),


        actions: [
          IconButton(onPressed: (){
            MySnackBar("I am search",context);}, icon: const Icon(Icons.search)),
          IconButton(onPressed: (){MySnackBar("I am favorite",context);}, icon: const Icon(Icons.favorite),color:Colors.black87),
          IconButton(onPressed: (){ MyAlertDialog(context);}, icon: const Icon(Icons.email),color:Colors.red ),
        ],


      ),
      body:Center(
        child:Text("I AM BODY PART.",
          style: TextStyle(fontStyle: FontStyle.italic,color: Colors.black,height: 10, fontSize: 20

          ),
    ),
      ),
    );
  }
}