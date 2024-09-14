import 'package:flutter/material.dart';
import 'package:meni/logger.dart';
import 'package:meni/presentation/widgets/background_image.dart';

@immutable
class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  _BoardingScreenState();

  final Logger logger = Logger();
  String name = 'Meirzhan';
  String imageUrl = 'https://img.freepik.com/free-photo/gradient-iphone-wallpaper-oil-bubble-water-background_53876-176849.jpg?w=740&t=st=1726265909~exp=1726266509~hmac=96af254e144e22bf45ad06b53c04bdacc86c803e03b65fec54fcdfd0992d739c';

  @override
  Widget build(BuildContext context) {
    logger.log('Build');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Well Cum'),
      ),
      body: Column(
        children: <Widget>[
          Text(
            'Welcome $name' ,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          TextButton(
          onPressed: () => setState(() => name = 'Vadim'),
          child: const Text('Skip'),
       ),
       BackgroundImage(
        name,
        imageUrl: imageUrl,
       )
        ],
      ),
    );


   // return Column(
    //  children: <Widget>[
     //   Text('Welcome! $name'),
     //   TextButton(
     //     onPressed: () => setState(() => name = 'Vadim'),
    //      child: const Text('Skip'),
    //    ),
   //     BackgroundImage(name),
   //   ],
  //  );
  }
}

