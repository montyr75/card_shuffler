@HtmlImport('main_app.html')
library card_shuffler.lib.main_app;

import 'dart:html';
import 'dart:convert';
import 'dart:js' as js;

import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer_elements/iron_ajax.dart';
import 'package:polymer_elements/iron_request.dart';
import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

import '../../model/global.dart';
import '../../model/cards.dart';

@PolymerRegister('main-app')
class MainApp extends PolymerElement {

  @property
  CardDeck cardDeck;

  MainApp.created() : super.created();

  void ready() {
    log.info("$runtimeType::ready()");
  }

  @reflectable
  void cardsLoaded(Event event, IronRequest req) {
    log.info("$runtimeType::cardsLoaded()");

    cardDeck = new CardDeck.fromMap((event.target as IronAjax).lastResponse);
  }

  @reflectable
  void shuffle([_, __]) {
    log.info("$runtimeType::shuffle()");

    cardDeck.shuffle();
  }

  @property
  String get cardDeckDataURL => CARD_DECK_DATA_URL;     // from global.dart
}

