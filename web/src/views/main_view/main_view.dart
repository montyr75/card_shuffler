library main_view;

import 'dart:html';
import 'dart:convert';
import 'package:polymer/polymer.dart';
import '../../model/global.dart';
import '../../model/cards.dart';

@CustomTag('main-view')
class MainView extends PolymerElement {

  @observable CardDeck cardDeck;

  MainView.created() : super.created() {
    HttpRequest.getString(CARD_DECK_DATA_URL).then((String jsonStr) {
      cardDeck = new CardDeck.fromMap(JSON.decode(jsonStr));
    });
  }

  @override void enteredView() {
    super.enteredView();
    print("MainView::enteredView()");
  }

  void shuffle(Event event, var detail, Element target) {
    print("MainView::shuffle()");

    cardDeck.shuffle();
  }
}

