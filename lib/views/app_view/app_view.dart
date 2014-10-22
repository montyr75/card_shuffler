library app_view;

import 'dart:html';
import 'package:polymer/polymer.dart';
import '../../model/global.dart';
import '../../model/cards.dart';

@CustomTag('app-view')
class AppView extends PolymerElement {

  static const CLASS_NAME = "AppView";

  @observable CardDeck cardDeck;

  AppView.created() : super.created();

  @override void attached() {
    super.attached();
    print("$CLASS_NAME::attached()");
  }

  void cardsLoaded(Event event, var detail, Element target) {
    print("$CLASS_NAME::cardsLoaded()");

    cardDeck = new CardDeck.fromMap(detail["response"]);
  }

  void shuffle(Event event, var detail, Element target) {
    print("$CLASS_NAME::shuffle()");

    cardDeck.shuffle();
  }

  String get cardDeckDataURL => CARD_DECK_DATA_URL;
}

