library app_view;

import 'dart:html';
import 'package:polymer/polymer.dart';
import '../../model/global.dart';
import '../../model/cards.dart';

@CustomTag('app-view')
class AppView extends PolymerElement {

  // initialize system log
  bool _logInitialized = initLog();

  @observable CardDeck cardDeck;

  AppView.created() : super.created();

  @override void attached() {
    super.attached();
    log.info("$runtimeType::attached()");
  }

  void cardsLoaded(Event event, var detail, Element target) {
    log.info("$runtimeType::cardsLoaded()");

    cardDeck = new CardDeck.fromMap(detail["response"]);
  }

  void shuffle(Event event, var detail, Element target) {
    log.info("$runtimeType::shuffle()");

    cardDeck.shuffle();
  }

  String get cardDeckDataURL => CARD_DECK_DATA_URL;     // from global.dart
}

