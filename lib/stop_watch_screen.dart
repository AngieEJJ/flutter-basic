import 'package:flutter/material.dart';

class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({super.key});

  @override
  State<StopWatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('스톱워치',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 30),
             const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('0',
                style: TextStyle(fontSize: 50),
                ),
                Text('00'),

              ],),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.orange,
                  child: const Icon(Icons.refresh),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.blue,
                  child: const Icon(Icons.play_arrow),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
