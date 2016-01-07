library card_shuffler.web.index;

import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer/polymer.dart';

import 'package:card_shuffler/views/main_app/main_app.dart';
import 'package:card_shuffler/services/logger.dart' as Logger;

const String APP_NAME = "card_shuffler";

main() async {
  Logger.log = Logger.initLog(APP_NAME);
  await initPolymer();
}
