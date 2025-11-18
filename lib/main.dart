import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.dark;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:
          themeMode == ThemeMode.dark
              ? MyAppThemeConfig.dark().getAppTheme()
              : MyAppThemeConfig.light().getAppTheme(),
      home: MyHomePage(toggleThemeMode: () {
        setState(() {
          if (themeMode == ThemeMode.dark) {
            themeMode = ThemeMode.light;
          } else {
            themeMode = ThemeMode.dark;
          }
        });
      }),
    );
  }
}

class MyAppThemeConfig {
  final Color surfaceColor;
  final Brightness brightness;
  final Color scaffoldBackgroundColor;
  final Color appBarColor;
  final Color appBarTextColor;
  final Color bodyLargeColor;

  MyAppThemeConfig.dark()
    : appBarColor = Colors.black,
      brightness = Brightness.dark,
      scaffoldBackgroundColor = Color.fromARGB(255, 30, 30, 30),
      surfaceColor = Color(0x0dffffff),
      appBarTextColor = Colors.white,
      bodyLargeColor = Color.fromARGB(200, 255, 255, 255);

  MyAppThemeConfig.light()
    : appBarColor = Colors.white,
      brightness = Brightness.light,
      scaffoldBackgroundColor = Colors.white,
      surfaceColor = Color(0x0d000000),
      appBarTextColor = Colors.black,
      bodyLargeColor = Color.fromARGB(200, 0, 0, 0);

  ThemeData getAppTheme() {
    return ThemeData(
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
      brightness: brightness,
      dividerColor: surfaceColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: surfaceColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.pink.shade400),
        ),
      ),
      appBarTheme: AppBarTheme(
        color: appBarColor,
        titleTextStyle: GoogleFonts.lato(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: appBarTextColor,
        ),
      ),
      textTheme: GoogleFonts.latoTextTheme(
        TextTheme(
          bodyMedium: TextStyle(fontSize: 15),
          bodyLarge: TextStyle(fontSize: 13, color: bodyLargeColor),
          titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Function() toggleThemeMode;
  const MyHomePage({super.key, required this.toggleThemeMode});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum SkillType { photoshop, xd, illustrator, afterEffect, lightRoom, nothing }

class _MyHomePageState extends State<MyHomePage> {
  SkillType skillType = SkillType.nothing;

  void updateSelectedSkill(SkillType type) {
    setState(() {
      skillType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Curriculum Vitae"),
        actions: [
          Icon(CupertinoIcons.chat_bubble),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
            child: InkWell(
              onTap: widget.toggleThemeMode,
              child: Icon(CupertinoIcons.ellipsis_vertical),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/profile_image.png',
                      width: 60,
                      height: 60,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ali Hajiabdollahi',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(height: 2),
                          Text('Mobile applications Developer'),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.location_solid,
                                size: 14,
                                color:
                                    Theme.of(
                                      context,
                                    ).textTheme.bodyLarge!.color,
                              ),
                              SizedBox(width: 3),
                              Text(
                                "Italy, Torino",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Icon(
                    CupertinoIcons.heart,
                    color: Colors.pink,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
              child: Text(
                "Passionate about Flutter, mobile app development, and artificial intelligence Dedicated to continuous learning and building impactful real-world applications.",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Divider(),

            Padding(
              padding: const EdgeInsets.fromLTRB(32, 12, 32, 10),
              child: Row(
                children: [
                  Text(
                    "Skills",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(CupertinoIcons.chevron_down, size: 12),
                ],
              ),
            ),

            Center(
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 8,
                runSpacing: 8,
                children: [
                  SkillItems(
                    type: SkillType.photoshop,
                    title: "Photoshop",
                    imagePath: "assets/images/app_icon_01.png",
                    shadowColor: Colors.blue,
                    isActive: skillType == SkillType.photoshop,
                    onClick: () {
                      updateSelectedSkill(SkillType.photoshop);
                    },
                  ),
                  SkillItems(
                    type: SkillType.lightRoom,
                    title: "Lightroom",
                    imagePath: "assets/images/app_icon_02.png",
                    shadowColor: Colors.blue,
                    isActive: skillType == SkillType.lightRoom,
                    onClick: () {
                      updateSelectedSkill(SkillType.lightRoom);
                    },
                  ),
                  SkillItems(
                    type: SkillType.afterEffect,
                    title: "AfterEffect",
                    imagePath: "assets/images/app_icon_03.png",
                    shadowColor: Colors.blue.shade800,
                    isActive: skillType == SkillType.afterEffect,
                    onClick: () {
                      updateSelectedSkill(SkillType.afterEffect);
                    },
                  ),
                  SkillItems(
                    type: SkillType.illustrator,
                    title: "Illustrator",
                    imagePath: "assets/images/app_icon_04.png",
                    shadowColor: Colors.orange,
                    isActive: skillType == SkillType.illustrator,
                    onClick: () {
                      updateSelectedSkill(SkillType.illustrator);
                    },
                  ),
                  SkillItems(
                    type: SkillType.xd,
                    title: "Adobe XD",
                    imagePath: "assets/images/app_icon_05.png",
                    shadowColor: Colors.pink,
                    isActive: skillType == SkillType.xd,
                    onClick: () {
                      updateSelectedSkill(SkillType.xd);
                    },
                  ),
                ],
              ),
            ),
            Divider(),

            Padding(
              padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Personal Informations",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 12),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(CupertinoIcons.at),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(CupertinoIcons.lock),
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Save"),
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
}

class SkillItems extends StatelessWidget {
  final SkillType type;
  final String title;
  final String imagePath;
  final Color shadowColor;
  final bool isActive;
  final Function() onClick;
  const SkillItems({
    super.key,
    required this.title,
    required this.imagePath,
    required this.shadowColor,
    required this.isActive,
    required this.type,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 110,
        height: 110,
        decoration:
            isActive
                ? BoxDecoration(
                  color: Theme.of(context).dividerColor,
                  borderRadius: BorderRadius.circular(12),
                )
                : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration:
                  isActive
                      ? BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: shadowColor.withValues(alpha: 0.5),
                            blurRadius: 20,
                          ),
                        ],
                      )
                      : null,
              child: Image.asset(imagePath, width: 45, height: 45),
            ),
            SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }
}
