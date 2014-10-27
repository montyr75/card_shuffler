library app_view;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:logging/logging.dart';
import 'package:intl/intl.dart' show DateFormat;
import '../../model/global.dart';
import '../../model/cards.dart';

@CustomTag('app-view')
class AppView extends PolymerElement {

  @observable CardDeck cardDeck;

  AppView.created() : super.created() {
    _initLog();
  }

  void _initLog() {
    DateFormat dateFormatter = new DateFormat("H:m:s.S");

    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((LogRecord rec) {
      print('${rec.level.name} (${dateFormatter.format(rec.time)}): ${rec.message}');
    });
  }

  @override void attached() {
    super.attached();
    log.info("$runtimeType::attached()");
  }

  void cardsLoaded(Event event, var detail, Element target) {
    log.info("$runtimeType::cardsLoaded()");

    cardDeck = new CardDeck.fromMap(detail["response"]);
  }

  void shuffle(Event event, var detail, Element target) {
    print("$runtimeType::shuffle()");

    cardDeck.shuffle();
  }

  String get cardDeckDataURL => CARD_DECK_DATA_URL;     // from global.dart
}

