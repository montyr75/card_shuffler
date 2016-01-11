@HtmlImport('main_app.html')
library card_shuffler.lib.main_app;

import 'dart:html';

import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer_elements/iron_ajax.dart';
import 'package:polymer_elements/iron_request.dart';
import 'package:polymer_elements/av_icons.dart';
import 'package:polymer_elements/paper_header_panel.dart';
import 'package:polymer_elements/paper_toolbar.dart';
import 'package:polymer_elements/paper_material.dart';
import 'package:polymer_elements/paper_icon_button.dart';
import 'package:polymer_elements/paper_tooltip.dart';
import "package:polymer_autonotify/polymer_autonotify.dart";
import "package:observe/observe.dart";
import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

import '../../services/logger.dart';
import '../../model/global.dart';
import '../../model/cards.dart';
import '../card_view/card_view.dart';

@PolymerRegister('main-app')
class MainApp extends PolymerElement with AutonotifyBehavior, Observable {

  @observable @property
  CardDeck cardDeck;

  MainApp.created() : super.created();

  void ready() {
    log.info("$runtimeType::ready()");
  }

  @reflectable
  void cardsLoaded(Event event, IronRequest req) {
    log.info("$runtimeType::cardsLoaded()");

    IronAjax ajax = event.target;
    cardDeck = new CardDeck.fromMap(ajax.lastResponse);
  }

  @reflectable
  void shuffle([_, __]) {
    log.info("$runtimeType::shuffle()");

    cardDeck.shuffle();
  }

  @property
  String get cardDeckDataURL => CARD_DECK_DATA_URL;     // from global.dart
}