import 'package:flutter/material.dart';
import 'rock_paper_scissors_screen.dart';


class HomeScreen extends StatelessWidget {
  final String? userName;
  const HomeScreen({super.key,this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              'Rock Paper\nScissors',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                height: 1.2,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ).copyWith(
                overlayColor: MaterialStateProperty.all(Colors.white24),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> RockPaperScissorsScreen(userName: userName,)));
              },
              child: Text(
                'Start Game',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
