class Horoscope {
  final HoroscopeData data;
  final int status;
  final bool success;

  const Horoscope({required this.data, required this.status, required this.success});

  factory Horoscope.fromJson(Map<String, dynamic> map) {
    return Horoscope(
      data: HoroscopeData.fromJson(map['data']),
      status: map['status'],
      success: map['success'],
    );
  }
}

class HoroscopeData {
  final String date;
  final String horoscopeData;

  const HoroscopeData({required this.date, required this.horoscopeData});

  factory HoroscopeData.fromJson(Map<String, dynamic> map) {
    return HoroscopeData(
      date: map['date'],
      horoscopeData: map['horoscope_data'],
    );
  }
}
