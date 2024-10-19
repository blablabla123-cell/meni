import 'package:meni/core/constants.dart';
import 'package:meni/presentation/boarding/data/models/boarding_data.dart';

abstract class BoardingScreenData {

  // static parameter
  static final List<BoardingData> boardingData = <BoardingData>[
      BoardingData(
        title: 'Welcome to Meni',
        subtitle: 'Your personal assistant for devination and reading hand online',
        progressValue: 33,
        backgroundImageUrl: Constants.backgroundImage1,
      ),
      BoardingData(
        title: 'Horoscope & compatibility',
        subtitle: 'Get a daily horoscope corresponding to your zodiac sign, check compatibility with other signs',
        progressValue: 67,
        backgroundImageUrl: Constants.backgroundImage2,
      ),
      BoardingData(
        title: 'Tarot & other',
        subtitle:
            'Get an individual astrologer\'s consultation, use the fortune-teller\'s knowledge to remember the best, be in the present and learn about the future',
        progressValue: 100,
        backgroundImageUrl: Constants.backgroundImage3,
      ),
    ];
}