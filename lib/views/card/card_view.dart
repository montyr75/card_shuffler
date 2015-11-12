@HtmlImport('card_view.html')
library card_shuffler.lib.card_view;

import 'dart:html';

import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

import '../../model/global.dart';
import '../../model/cards.dart';

@PolymerRegister('card-view')
class CardView extends PolymerElement {

//  @published Card card;
//
//  @observable String cardImgPath;     // this version of the path includes the filename

  CardView.created() : super.created();

  void ready() {
    log.info("$runtimeType::ready()");
  }

  // this fires even when "card" is initialized
  void cardChanged() {
//    cardImgPath = "${CARD_IMAGE_PATH}/${card.img}";
  }
}

