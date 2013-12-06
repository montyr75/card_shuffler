library card_view;

import 'package:polymer/polymer.dart';
import '../../model/global.dart';
import '../../model/cards.dart';

@CustomTag('card-view')
class CardView extends PolymerElement {

  @published Card card;

  @observable String cardImgPath;     // this version of the path includes the filename

  CardView.created() : super.created();

  // initialization can be done here
  @override void enteredView() {
    super.enteredView();
    //print("CardView::enteredView()");

    // the card data isn't filled in until this point
    cardImgPath = "${CARD_IMAGE_PATH}/${card.img}";
  }

  // this lets the global CSS bleed through into the Shadow DOM of this element
  bool get applyAuthorStyles => true;
}

