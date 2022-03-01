
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final Color purple = Colors.purple.shade800;
const Color yellow = Colors.yellow;

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
   Home({
    Key? key,
  }) : super(key: key);



  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   List<Map<String, dynamic>> data = [{"name": "abhishek","pts":90},{"name": "Rajesh","pts":490},{"name": "--","pts":290},{"name": "HARSH","pts":190}];

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data.sort((a, b) => (b["pts"])?.compareTo(a["pts"]));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration:  BoxDecoration(
          color: Colors.purpleAccent.shade700
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 12),
              height: MediaQuery.of(context).size.height * 0.45,
              decoration:const BoxDecoration(
                  color: yellow,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 30, 0, 15),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.arrow_back_rounded, color: purple,),
                        SizedBox(width: MediaQuery.of(context).size.width *.24,),
                        Text("Leaderboard", style: TextStyle(fontSize: 25,color: Colors.purpleAccent.shade700,fontWeight: FontWeight.bold),),

                      ],
                    ),
                  ),
                  const CircleAvatar(
                    radius: 60,
                    child: FlutterLogo(size: 100,),
                  ),
                  const SizedBox(height: 10,),
                  const Text("Mustafa",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(3),
                        width: 130,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.purple.shade400,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const[
                             Text("Your Score",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
                            Text('0',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(3),
                        width: 130,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.purple.shade400,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                             Text("Global Rank",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
                             Text('-',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400)),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.475,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                        color: yellow,
                      ),
                      child:  Text("Leaderboard",style: TextStyle(fontSize: 18,color: purple,fontWeight: FontWeight.bold),),

                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: const Text("Your Score",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.475,
                      alignment: Alignment.center,
                      decoration:  BoxDecoration(
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                        color: Colors.purple.shade700,
                      ),            )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18,vertical: 0),
                  decoration:  BoxDecoration(
                    color: purple,
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context,index){
                    return ListTile(
                      leading: Text("#${index+1} ${data[index]["name"]}",style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),),
                      trailing: Text("${data[index]["pts"]} pts",style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),),
                    );
                  }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

