import 'package:flutter/material.dart';
import 'package:meni/application/utils/storage_repository.dart';
import 'package:meni/core/constants.dart';
import 'package:meni/core/core_colors.dart';
import 'package:meni/core/widgets/core_elevated_button.dart';
import 'package:meni/models/boarding_data.dart';
import 'package:meni/presentation/user_info/user_info_screen.dart';

@immutable
class BoardingScreen extends StatefulWidget {
  const BoardingScreen({required this.fileStorage, super.key});
  final StorageRepository fileStorage;

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  final PageController controller = PageController();
  int pageIndex = 0;

  late final List<String> images;
  late final List<BoardingData> data;

  @override
  void initState() {
    super.initState();

    images = <String>[
      Constants.backgroundImage1,
      Constants.backgroundImage2,
      Constants.backgroundImage3,
    ];

    data = <BoardingData>[
      BoardingData(
          title: 'Welcome to Meni',
          subtitle: 'Your personal assistant for devination and reading hand online',
          loadValue: 33),
      BoardingData(
          title: 'Horoscope & compatibility',
          subtitle: 'Get a dailt horoscope corresponding to your zodiac sign, check compantibility with othe signs',
          loadValue: 67),
      BoardingData(
          title: 'Tarot & other',
          subtitle:
              'Get an individual astrologer\'s consultation, use the fortune-teller\'s knowledge to remember the best, be in the present and learn about the future',
          loadValue: 100),
    ];
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final double? size = TextSizeInheritedWidget.of(context)?.size;

    return Stack(
      children: <Widget>[
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: <Color>[
                Colors.transparent,
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.7),
                Colors.black.withOpacity(0.6),
              ],
              stops: const <double>[0.0, 0.2, 0.4, 0.6, 0.8],
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: Image.asset(images[pageIndex], fit: BoxFit.cover),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: PageView.builder(
            controller: controller,
            itemCount: data.length,
            onPageChanged: (int index) => setState(() => pageIndex = index),
            itemBuilder: (_, int index) => _DataItem(data: data[index],           
            onPressed: () {
              pageIndex++;
            controller.animateToPage(pageIndex, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
            if (pageIndex == 3) {
              Navigator.of(context).pushReplacement(MaterialPageRoute<UserInfoScreen>(builder: (BuildContext context){
                return UserInfoScreen(fileStorage: widget.fileStorage);
                
              },),);
            }
          },),
          ),
        ),
      ],
    );
  }
}

class _DataItem extends StatelessWidget {
  const _DataItem({required this.data, required this.onPressed,});
  final BoardingData data;
  final void Function() onPressed; 

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          data.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 10),
        Text(data.subtitle, textAlign: TextAlign.center),
        const SizedBox(height: 16),
        CoreElevatedButton(
          title: 'Continue',
          onPressed: onPressed,

        ),
      ],
    );
  }
}
