import '../../../injection_container.dart';
import '../../../presentation/auth/domain/model/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'box_kes.dart';

class HiveServices {
  Future<void> init() async {
    await Hive.initFlutter();
    _registerAdapters();
    await Future.wait([_initAppBox(), _initializeBoxModel<User>(boxName: BoxKeys.userData)]);
  }

  void _registerAdapters() {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter<User>(UserAdapter());
    }
  }

  Future<void> _initAppBox() async {
    final appBox = await Hive.openBox(BoxKeys.appBox);
    sl.registerSingleton<Box>(appBox, instanceName: BoxKeys.appBox);
  }

  Future<void> _initializeBoxModel<T>({required String boxName}) async {
    final Box<T> box = await Hive.openBox<T>(boxName);
    if (!sl.isRegistered<Box<T>>()) {
      sl.registerSingleton<Box<T>>(box);
    }
  }
}
