import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_driver/flutter_driver.dart' as D;

void main() {
   group('App Test', () {
       D.FlutterDriver? driver;

      setUpAll(() async {
        driver = await D.FlutterDriver.connect(dartVmServiceUrl: 'ws://127.0.0.1:55985/IkUq5bl5ZRU=/ws' );
      });

      tearDownAll(() async {
        if (driver != null) {
          driver?.close();
        }
      });

      test('starts at 0', () async {
        expect(await driver?.getText(D.find.byValueKey('counter')), '0');
      });

      test('increments the counter', () async {
        await driver?.tap(D.find.byValueKey('increment'));
        expect(await driver?.getText(D.find.byValueKey('counter')), '1');
      });
    });
    
  
}
