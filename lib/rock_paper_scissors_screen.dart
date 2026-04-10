import 'package:flutter/material.dart';
import 'dart:math';

class RockPaperScissorsScreen extends StatefulWidget {
 final String? userName;
  const RockPaperScissorsScreen({super.key,this.userName});

  @override
  State<RockPaperScissorsScreen> createState() =>
      _RockPaperScissorsScreenState();
}

class _RockPaperScissorsScreenState extends State<RockPaperScissorsScreen> {
  int randomNumber = 1;
  int userChoice = 0;
  int computerChoice = 0;
  String rock = '✊';
  String paper = '✋';
  String scissors = '✌️';
  String computerIcon = '❔';
  String userIcon = '❔';
  String result = 'Make your move!';

  void _computer() {
    if (randomNumber == 1) {
      computerIcon = '✊';
    } else if (randomNumber == 2) {
      computerIcon = '✋';
    } else if (randomNumber == 3) {
      computerIcon = '✌️';
    }
    setState(() {});
  }

  void _findWinner() {
    if (userIcon == computerIcon) {
      result = 'It\'s a Draw! 🤝';
    } else if (userIcon == '✊' && computerIcon == '✌️') {
      result = 'You Win! 🎉';
      userChoice++;
    } else if (userIcon == '✊' && computerIcon == '✋') {
      result = 'Computer Wins! 🤖';
      computerChoice++;
    } else if (userIcon == '✋' && computerIcon == '✊') {
      result = 'You Win! 🎉';
      userChoice++;
    } else if (userIcon == '✋' && computerIcon == '✌️') {
      result = 'Computer Wins! 🤖';
      computerChoice++;
    } else if (userIcon == '✌️' && computerIcon == '✋') {
      result = 'You Win! 🎉';
      userChoice++;
    } else if (userIcon == '✌️' && computerIcon == '✊') {
      result = 'Computer Wins! 🤖';
      computerChoice++;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Play', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              userChoice = 0;
              computerChoice = 0;
              computerIcon = '❔';
              userIcon = '❔';
              result = 'Make your move!';
              setState(() {});
            },
            icon: Icon(Icons.refresh),
            tooltip: 'Reset Game',
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      '${widget.userName}(You)',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),

                    SizedBox(height: 10),
                    Text(
                      '$userChoice',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent, // Tumhare score ka color
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    Text(
                      ':',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Dark theme me white accha lagega
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    Text(
                      'Computer',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),

                    SizedBox(height: 10),

                    Text(
                      '$computerChoice',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent, // Computer ke score ka color
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'You',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 100,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      shape: BoxShape.circle,
                    ),
                    child: Text(userIcon, style: TextStyle(fontSize: 50)),
                  ),
                ],
              ),

              Column(
                children: [
                  Text(
                    'vs',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  Text(
                    'Computer',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 100,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      shape: BoxShape.circle,
                    ),
                    child: Text(computerIcon, style: TextStyle(fontSize: 50)),
                  ),
                ],
              ),
            ],
          ),

          Text(
            result,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),

          Container(
            height: 150,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF1E1E1E),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    randomNumber = 1 + Random().nextInt(3);
                    _computer();
                    userIcon = '✊';
                    _findWinner();
                    setState(() {});
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Text(rock, style: TextStyle(fontSize: 40)),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    randomNumber = 1 + Random().nextInt(3);
                    _computer();
                    userIcon = '✋';
                    _findWinner();
                    setState(() {});
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Text(paper, style: TextStyle(fontSize: 40)),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    randomNumber = 1 + Random().nextInt(3);
                    _computer();
                    userIcon = '✌️';
                    _findWinner();
                    setState(() {});
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Text(scissors, style: TextStyle(fontSize: 40)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
