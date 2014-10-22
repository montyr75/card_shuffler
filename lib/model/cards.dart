library cards;

// include Polymer to have access to @observable
import 'package:polymer/polymer.dart';

class Card {
  String _suit;
  String _rank;
  String _img;

  Card(String this._suit, String this._rank, String this._img);

  Card.fromMap(Map<String, String> map) : this(map["suit"], map["rank"], map["img"]);

  // jokers don't have a suit, so only append suit data if there is a suit
  String toString() => "$_rank${_suit != null ? ' of $_suit' : ''}";

  String get suit => _suit;
  String get rank => _rank;
  String get img => _img;
}

class CardDeck {
  String _backImg;
  bool _includeJokers;
  List<Card> cards = toObservable([]);

  CardDeck({bool includeJokers: false, String backImg: null}) {
    _includeJokers = includeJokers;
    _backImg = backImg;
  }

  CardDeck.fromMap(Map<String, Object> map, {bool includeJokers: false}) {
    _includeJokers = includeJokers;

    _backImg = map["backImg"];

    List<Map<String, String>> cardMaps = map["cards"];

    cardMaps.forEach((Map<String, String> card) {
      // jokers don't have a suit
      if (card["suit"] == null && !_includeJokers) {
        return;
      }

      cards.add(new Card.fromMap(card));
    });
  }

  void shuffle() => cards.shuffle();

  String toString() {
    StringBuffer sb = new StringBuffer();

    cards.forEach((Card card) => sb.writeln(card));

    return sb.toString();
  }
}