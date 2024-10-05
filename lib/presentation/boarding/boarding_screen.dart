import 'package:flutter/material.dart';
import 'package:meni/application/utils/storage_repository.dart';
import 'package:meni/business_logic/text_size_inherited_widget.dart';
import 'package:meni/core/constants.dart';
import 'package:meni/core/widgets/core_elevated_button.dart';
import 'package:meni/presentation/boarding/widgets/page_indicator.dart';
import 'package:meni/presentation/user_info/user_info_screen.dart';

@immutable
class BoardingScreen extends StatefulWidget {
  const BoardingScreen({required this.storage, super.key});
  final StorageRepository storage;

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  final PageController controller = PageController();
  int pageIndex = 0;

  late final List<String> images;
  late final List<Text> pages;

  @override
  void initState() {
    super.initState();


    images = [
      Constants.backgroundImage1,
      Constants.backgroundImage2,
      Constants.backgroundImage3,
    ];

    pages = const <Text>[
      Text('Page 1', style: TextStyle(color: Colors.white)),
      Text('Page 2', style: TextStyle(color: Colors.white)),
      Text('Page 3', style: TextStyle(color: Colors.white)),
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
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,          
                Colors.black.withOpacity(0.1),
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.7), 
              ],
              stops: [0.0, 0.4, 0.6, 0.8, 1.0],  
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: Image.asset(
            images[pageIndex],  
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              PageView.builder(
                controller: controller,
                itemCount: pages.length, 
                onPageChanged: (int index) {
                  setState(() {
                    pageIndex = index; 
                  });
                },
                itemBuilder: (BuildContext context, int index) => Center(child: pages[index]),
              ),
              Positioned(
                bottom: 100,
                left: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Well Cum User ${pageIndex + 1}',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Your personal ass istant for devination and reading hand online ${pageIndex + 1}.', // не придумал чет как поставить свой текст на каждую страницу
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 50,
                child: PageIndicator(
                  right: () {
                    if (pageIndex < pages.length - 1) {
                      pageIndex++;
                      controller.animateToPage(
                        pageIndex,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      print('End');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}