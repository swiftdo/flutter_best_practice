import 'package:flutter/material.dart';
import 'views/buttom_consumer.dart';
import 'views/joke_consumer.dart';

class JokePages extends StatelessWidget {
  const JokePages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jokes'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            JokeConsumer(),
            SizedBox(height: 50),
            ButtonConsumer(),
          ],
        ),
      ),
    );
  }
}
