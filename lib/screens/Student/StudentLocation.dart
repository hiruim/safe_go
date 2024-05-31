class LocationService {
  LocationService._init();

  static LocationService? _instance;

  static LocationService get instance {
    _instance ??= LocationService._init();
    return _instance!;
  }

  Future<List<String>> getCities() async {
    try {
      // Replace this with your actual data retrieval logic
      List<String> cityList = await fetchDataFromSomeSource();
      return cityList;
    } catch (e) {
      return [];
    }
  }

  Future<String> getCityWithLicensePlate(int licensePlate) async {
    try {
      var cities = await getCities();
      return cities.length >= licensePlate
          ? cities[licensePlate - 1]
          : 'DefaultCity';
    } catch (e) {
      return 'DefaultCity';
    }
  }

  Future<List<String>> fetchDataFromSomeSource() async {
    // Replace this with your actual data retrieval logic
    // For example, you can fetch data from an API, a local database, or any other source
    return ['City1', 'City2', 'City3'];
  }
}
