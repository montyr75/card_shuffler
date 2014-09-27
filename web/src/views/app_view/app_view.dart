library app_view;

import 'dart:html';
import 'dart:convert';
import 'package:polymer/polymer.dart';
import '../../model/global.dart';
import '../../model/cards.dart';

@CustomTag('app-view')
class AppView extends PolymerElement {

  static const CLASS_NAME = "AppView";

  @observable CardDeck cardDeck;

  AppView.created() : super.created() {
    HttpRequest.getString(CARD_DECK_DATA_URL).then((String jsonStr) {
      cardDeck = new CardDeck.fromMap(JSON.decode(jsonStr));
    });
  }

  @override void attached() {
    super.attached();
    print("$CLASS_NAME::attached()");
  }

  void shuffle(Event event, var detail, Element target) {
    print("$CLASS_NAME::shuffle()");

    cardDeck.shuffle();
  }
}

