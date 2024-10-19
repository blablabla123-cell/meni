import 'package:flutter/material.dart';
import 'package:meni/application/utils/key_storage.dart';
import 'package:meni/application/utils/storage_repository.dart';
import 'package:meni/presentation/boarding/data/models/boarding_data.dart';
import 'package:meni/presentation/boarding/data/boarding_data.dart';
import 'package:meni/presentation/boarding/widgets/boarding_page.dart';
import 'package:meni/presentation/user_info/user_name_screen.dart';

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

  final List<BoardingData> data = BoardingScreenData.boardingData;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          child: Image.asset(data[pageIndex].backgroundImageUrl, fit: BoxFit.cover),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: PageView.builder(
            controller: controller,
            itemCount: data.length,
            onPageChanged: (int index) {
              setState(() => pageIndex = index);
            },
            itemBuilder: (_, int index) => BoardingPage(
              data: data[index],
              controller: controller,
              pageIndex: pageIndex,
              totalPages: data.length,
              onPressed: () {
                if (index < 2) {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                } else {
                  widget.storage.write(KeyStorage.boarding, 'true');

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<UserNameScreen>(
                      builder: (BuildContext context) => UserNameScreen(storage: widget.storage),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
