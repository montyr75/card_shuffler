library card_shuffler.lib.model.cards;

class Card {
  String _suit;
  String _rank;
  String _img;

  Card(String this._suit, String this._rank, String this._img);

  Card.fromMap(map) : this(map["suit"], map["rank"], map["img"]);

  // jokers don't have a suit, so only append suit data if there is a suit
  @override String toString() => "$_rank${_suit != null ? ' of $_suit' : ''}";

  String get suit => _suit;
  String get rank => _rank;
  String get img => _img;
}

class CardDeck {
  String _backImg;
  bool _includeJokers;
  List<Card> cards = [];

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