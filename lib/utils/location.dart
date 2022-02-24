import 'package:location/location.dart';

class LocationHelper {
  var latitude; //paralel
  var longitude; // meridyen

  //kullanıcının koordinatlarını bize getirecek bir fonksiyon oluşturduk

  Future<void> getCurrentLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    //Location için servis ayata mı?
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      // eğerki servis ayakta değilse ona bir istek gönderdik
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return; // gönderdiğimiz isteğe rağmaen servi hala ayakte değilse boş olarak dönderiyoruz
      }
    }

    //kullanıcı konum bilgisini almaa izin vermiş mi?
    //konum izni kontrolü
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();

      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    //izinler tamam ise
    _locationData = await location.getLocation();
    latitude = _locationData.latitude;
    longitude = _locationData.longitude;
  }
}
