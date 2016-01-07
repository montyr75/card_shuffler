@HtmlImport('card_view.html')
library card_shuffler.lib.card_view;

import 'dart:html';

import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer_elements/iron_image.dart';
import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

import '../../services/logger.dart';
import '../../model/global.dart';
import '../../model/cards.dart';

@PolymerRegister('card-view')
class CardView extends PolymerElement {

  @property
  Card card;

  CardView.created() : super.created();

  void ready() {
    log.info("$runtimeType::ready()");
  }

  @reflectable
  String cardImagePath(Card card) => "${CARD_IMAGE_PATH}/${card.img}";
}

