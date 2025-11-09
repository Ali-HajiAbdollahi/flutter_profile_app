import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 9, 25, 172)),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Curriculum Vitae"),
        actions: [
          Icon(CupertinoIcons.chat_bubble),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
            child: Icon(CupertinoIcons.ellipsis_vertical),
          )
        ],
        ),
      
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 15, 30, 15), 
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset('assets/images/profile_image.png', width: 60, height: 60,)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 15, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ali Hajiabdollahi',),
                      SizedBox(height: 2,),
                      Text('Mobile applications Developer'),
                      SizedBox(height: 4,),
                      Row(
                        children: [
                          Icon(CupertinoIcons.location_solid, size: 15,),
                          SizedBox(width : 8,),
                          Text("Italy, Torino")
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16,),
            Text("Passionate about Flutter, mobile app development, and artificial intelligence Dedicated to continuous learning and building impactful real-world applications."),
            
          ],
        ),
      ));

  }

}