library card_view;

import 'package:polymer/polymer.dart';
import '../../model/global.dart';
import '../../model/cards.dart';

@CustomTag('card-view')
class CardView extends PolymerElement {

  static const CLASS_NAME = "CardView";

  @published Card card;

  @observable String cardImgPath;     // this version of the path includes the filename

  CardView.created() : super.created();

  @override void attached() {
    super.attached();
    //print("$CLASS_NAME::attached()");
  }

  // this fires even when "card" is initialized
  void cardChanged() {
    cardImgPath = "${CARD_IMAGE_PATH}/${card.img}";
  }
}

