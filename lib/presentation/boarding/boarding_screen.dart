import 'package:flutter/material.dart';
import 'package:meni/application/utils/storage_repository.dart';
import 'package:meni/core/widgets/background_gradient.dart';
import 'package:meni/core/constants.dart';
import 'package:meni/core/widgets/core_elevated_button.dart';
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

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  late final List<Text> pages;

  @override
  void initState() {
    super.initState();
    pages = const <Text>[
      Text('Page 1', style: TextStyle(color: Colors.white)), //0
      Text('Page 2', style: TextStyle(color: Colors.white)), //1
      Text('Page 3', style: TextStyle(color: Colors.white)), //2
      Text('Page 4', style: TextStyle(color: Colors.white)), //3
    ];
  }

  @override
  Widget build(BuildContext context) {
    // final double? size = TextSizeInheritedWidget.of(context)?.size;

    return Stack(
      children: <Widget>[
        const BackgroundGradient(colors: Constants.boardingGradientColors),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              PageView.builder(
                controller: controller,
                itemCount: pages.length,
                itemBuilder: (BuildContext context, int index) => Center(child: pages[index]),
              ),
              CoreElevatedButton(
                onPressed: () {
                  if (pageIndex == 3) {
                    Navigator.of(context).push(MaterialPageRoute<UserInfoScreen>(
                      builder: (BuildContext context) => UserInfoScreen(fileStorage: widget.storage),
                    ));
                    return;
                  }

                  pageIndex++;

                  controller.animateToPage(
                    pageIndex,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                },
                title: 'Continue',
              )
              // PageIndicator(
              //   left: () {
              //     if (pageIndex == 0) return;
              //     pageIndex--;

              //     controller.animateToPage(
              //       pageIndex,
              //       duration: const Duration(milliseconds: 400),
              //       curve: Curves.easeInOut,
              //     );
              //   },
              //   right: () {
              //     if (pageIndex == 3) {
              //       Navigator.of(context).push(MaterialPageRoute<UserInfoScreen>(
              //         builder: (BuildContext context) => UserInfoScreen(fileStorage: widget.storage),
              //       ));
              //       return;
              //     }

              //     pageIndex++;

              //     controller.animateToPage(
              //       pageIndex,
              //       duration: const Duration(milliseconds: 400),
              //       curve: Curves.easeInOut,
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
