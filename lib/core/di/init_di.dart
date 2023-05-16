import 'package:firebase/core/di/init_di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final locator = GetIt.instance;

@InjectableInit()
void initDi() {
  locator.init();
}
