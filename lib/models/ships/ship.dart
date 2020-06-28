enum SHIP_STATUS { LIVE, SUNK }

abstract class Ship {
  double width;
  double height;
  double x;
  double y;

  Ship();

  String name;
  var status = SHIP_STATUS.LIVE;

  String get getName => this.name;

  double get getX => this.x;

  double get getY => this.y;
}
