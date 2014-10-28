library model.global;

import 'package:logging/logging.dart';
import 'package:intl/intl.dart' show DateFormat;

// define logger
final Logger log = new Logger('card_shuffler');

// constants
const String CARD_IMAGE_PATH = "resources/images/cards";
const String CARD_DECK_DATA_URL = "resources/data/card_deck.json";

bool initLog() {
  DateFormat dateFormatter = new DateFormat("H:m:s.S");

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name} (${dateFormatter.format(rec.time)}): ${rec.message}');
  });

  return true;
}