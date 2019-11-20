/*
Still to add: 
 - map the size of the ellipse to the size of the 1) screen or 2) the biggest ellipse. In this way, the small ellipses become a bit bigger and more visible
 - change the program such that the user can change what he/she wants to compare. Now it only compares totaal bedreigd with totaal
 - change cursor if hover over so that the user knows he can click
 - make sure that the text that comes with each ellipse, as well as the hover text is clearly visible
 */

class Circle {

  float xpos, ypos;
  float r;
  String naam;
  float verdwenen, ernstigBedreigd, bedreigd, kwetsbaar, gevoelig, nietBedreigd, totaal, totBedreigd; // these are the different columns
  boolean compare = false;

  Circle(String _naam, float _verdwenen, float _ernstigBedreigd, float _bedreigd, float _kwetsbaar, float _gevoelig, float _nietBedreigd, float _totaal, float _totBedreigd) {

    // all circles should be fully in the frame
    xpos = r + random(width - 2 * r);
    ypos = r + random(height - 2 * r);
    naam = _naam;
    verdwenen = _verdwenen;
    ernstigBedreigd = _ernstigBedreigd;
    bedreigd = _bedreigd;
    kwetsbaar = _kwetsbaar;
    gevoelig = _gevoelig;
    nietBedreigd = _nietBedreigd;
    totaal = _totaal;
    r = _totBedreigd / 2; // THIS IS WHERE I STRUGGLE... If I declare the radius here, it will only work with the displayTotBedreigd() function. I would like it to be dependend on the function I call
  }

  boolean overlapping( float _xpos, float _ypos) {
    for (int i = 0; i < numCircles; i++) {
      // make new objects
      Circle other = circles[i];
      // if the distance is smaller than the diameter, they overlap
      if (dist(other.xpos, other.ypos, _xpos, _ypos) < 2 * r) {
        return true;
      }
    }
    return false;
  }
  void update() {

    float _xpos = r + random(width - 2 * r);
    float _ypos = r + random(height - 2 * r);

    //check if the position is free
    if (overlapping(_xpos, _ypos) == false) { //NO OVERLAP
      xpos = _xpos;
      ypos = _ypos;
    } else { // OVERLAP
      update(); // go find yourself some new _xpos and _ypor
    }
  }

/*The following methods are not (yet) correct. Only the last one, totaal bedreigd, works. This is because I don't yet know how to make the r change accordingly, but also make then the 
 overlapping function work*/


void displayVerdwenen() {
  r = verdwenen; // If I declare r here, the overlapping function doesn't work

  noStroke();
  fill(150);
  ellipse(xpos, ypos, r*2, r*2);
  text(naam, xpos, ypos);
}

void displayErnstigBedreigd() {
  r = ernstigBedreigd;

  noStroke();
  fill(150);
  ellipse(xpos, ypos, r*2, r*2);
  text(naam, xpos, ypos);
}

void displayBedreigd() {
  r = bedreigd;

  noStroke();
  fill(150);
  ellipse(xpos, ypos, r*2, r*2);
  text(naam, xpos, ypos);
}

void displayKwetsbaar() {
  r = kwetsbaar;

  noStroke();
  fill(150);
  ellipse(xpos, ypos, r*2, r*2);
  text(naam, xpos, ypos);
}

void displayGevoelig() {
  r = gevoelig;

  noStroke();
  fill(150);
  ellipse(xpos, ypos, r*2, r*2);
  text(naam, xpos, ypos);
}

void displayNietBedreigd() {
  r = nietBedreigd;
  noStroke();
  fill(150);
  ellipse(xpos, ypos, r*2, r*2);
  text(naam, xpos, ypos);
}

void displayTotaal() {
  r = totaal;
  noStroke();
  fill(150);
  ellipse(xpos, ypos, r*2, r*2);
  text(naam, xpos, ypos);
}

void displayTotBedreigd() {
  fill(255);
  text("Totaal aantal bedreigde soorten per klasse", width/3, 20);
  noStroke();
  fill(255, 0, 0);
  ellipse(xpos, ypos, r*2, r*2);
  fill(255);
  text(naam, xpos, ypos + r + 10);

  if (compare) {
    fill(255, 0, 0, 50);
    ellipse(xpos, ypos, totaal, totaal);
  }
}
}
