import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bidding App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
        canvasColor: Colors.lightBlue.shade100, // Background color of the app
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            color: Colors.black, // Text color
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(color: Colors.black87),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green, // Button background color
            foregroundColor: Colors.white, // Button text color
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
      ),
      home: const MyHomePage(title: 'Bidding Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent, // AppBar background color
        title: Text(title, style: TextStyle(color: Colors.white)), // AppBar text color
      ),
      body: Center(
        child: MaximumBid(),
      ),
    );
  }
}

class MaximumBid extends StatefulWidget {
  const MaximumBid({super.key});

  @override
  _MaximumBidState createState() => _MaximumBidState();
}

class _MaximumBidState extends State<MaximumBid> {
  int _currentBid = 100; // Initial bid set to $100

  void _increaseBid() {
    setState(() {
      _currentBid += 50; // Increase bid by $50
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Your Current Maximum Bid:',
          style: Theme.of(context).textTheme.headlineMedium, // Text color and styling from the theme
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.yellow.shade700, // Background color of the bid amount display
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            '\$$_currentBid', // Display the current bid
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.black87, // Custom text color for the bid amount
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _increaseBid, // Increment bid on button press
          child: const Text('Increase Bid by \$50'),
        ),
      ],
    );
  }
}
