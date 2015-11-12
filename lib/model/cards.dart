library card_shuffler.lib.model.cards;

import 'package:polymer/polymer.dart';

class Card extends JsProxy {
  @reflectable final String suit;
  @reflectable final String rank;
  @reflectable final String img;

  Card(String this.suit, String this.rank, String this.img);

  Card.fromMap(map) : this(map["suit"], map["rank"], map["img"]);

  // jokers don't have a suit, so only append suit data if there is a suit
  @override String toString() => "$rank${suit != null ? ' of $suit' : ''}";
}

class CardDeck extends JsProxy {
  String _backImg;
  bool _includeJokers;
  @reflectable List<Card> cards = [];

  CardDeck({bool includeJokers: false, String backImg: null}) {
    _includeJokers = includeJokers;
    _backImg = backImg;
  }

  CardDeck.fromMap(map, {bool includeJokers: false}) {
    _includeJokers = includeJokers;

    _backImg = map["backImg"];

    List cardMaps = map["cards"];

    cardMaps.forEach((card) {
      // jokers don't have a suit
      if (card["suit"] == null && !_includeJokers) {
        return;
      }

      cards.add(new Card.fromMap(card));
    });
  }

  void shuffle() => cards.shuffle();

  @override String toString() {
    StringBuffer sb = new StringBuffer();

    cards.forEach((Card card) => sb.writeln(card));

    return sb.toString();
  }
}