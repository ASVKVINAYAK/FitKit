import 'package:flutter/material.dart';
import 'package:gym_app/Screens/Healthy_Diet/healthy_diet.dart';
import 'package:gym_app/Screens/bmi_calculator/bmi_screen.dart';
import 'package:gym_app/Screens/video_player/yoga_screen.dart';
import './components/color_filters.dart';
import '../video_player/VideoScreen.dart';

class MainPage extends StatefulWidget {
  
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            buildTrainingImageCard(),
            buildChallengesImageCard(),
            buildCalculatorImageCard(),
            buildHealthyDietImageCard(),
            buildReminderImageCard(),
          ],
        ),
      );

      Widget buildTrainingImageCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        elevation: 10,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Z3ltfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
              ),
              child: InkWell(
                onTap: ()=> Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoScreen(),
                ),
              ),
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              "Gym Training\nand Warm Up Exercises",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );

      Widget buildChallengesImageCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        elevation: 10,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1593810450967-f9c42742e326?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1052&q=80',
              ),
              child: InkWell(
                onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => YogaScreen(),
                ),
              ),
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              "Daily Yoga",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );

      Widget buildCalculatorImageCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        elevation: 10,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1553343801-5d4a45829f2a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Njh8fHdlaWdodHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
              ),
              child: InkWell(
                onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InputPage(),
                ),
              ),
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              "\nBMI Calculator",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );


      Widget buildHealthyDietImageCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        elevation: 10,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1498837167922-ddd27525d352?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGhlYWx0aHklMjBkaWV0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
              ),
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HealthyDiet(),
                  ),
                ),
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              "Healthy Diet",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );

      Widget buildReminderImageCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        elevation: 10,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1563986768609-322da13575f3?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cmVzdWx0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
              ),
              child: InkWell(
                onTap: () {},
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              " Daily Reports",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );
}