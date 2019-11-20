Table t; 
int numCircles;
Circle [] circles;


TableRow row;
String naam;
float verdwenen;
float ernstigBedreigd ;
float bedreigd;
float kwetsbaar;
float gevoelig;
float totaal;
float nietBedreigd;
float totBedreigd;

void setup() {
  size(800, 800);
  t = loadTable("aantallen_aangepast_geordend.csv", "header");
  numCircles = t.getRowCount(); // 14!
  println("number " + numCircles);
  loadData();

  for (int i = 0; i < numCircles; i++) { // update the circles that have been created but overlapped
    circles[i].update();
  }
}


void draw() {

  background(0);

  //draw all the circles
  for (int i = 0; i < numCircles; i ++) {
    circles[i].displayTotBedreigd();
    hoverText(circles[i]);
    //circles[i].displayTotaal();
  }
}

void loadData() {
  circles = new Circle[numCircles]; // create array called circles filled with 14 Circle objects
  t = loadTable("aantallen_aangepast_geordend.csv", "header");

  for (int i = 0; i<t.getRowCount(); i++) { // Access each row of the table one at a time, in a loop.
    row = t.getRow(i);
    naam = row.getString("Nederlandse naam");
    verdwenen = row.getInt("Verdwenen");
    ernstigBedreigd = row.getInt("Ernstig bedreigd");
    bedreigd = row.getInt("Bedreigd");
    kwetsbaar = row.getInt("Kwetsbaar");
    gevoelig = row.getInt("Gevoelig");
    nietBedreigd = row.getInt("Niet bedreigd");
    totaal = row.getInt("Totaal");
    totBedreigd = row.getInt("Totaal bedreigd");

    circles[i] = new Circle(naam, verdwenen, ernstigBedreigd, bedreigd, kwetsbaar, gevoelig, nietBedreigd, totaal, totBedreigd);

    println(naam, verdwenen, ernstigBedreigd, bedreigd);
  }
}

void hoverText(Circle c) {

  if (dist(mouseX, mouseY, c.xpos, c.ypos) < c.r) {
    fill(255);
    text((int)c.r*2, mouseX, mouseY + 30);
  }
}

void mousePressed() {
  // if you want to compare the number with the total, you can click on the circle. The boolean compare will then switch, which shows or hides the ellipse with r of total
  for (int i = 0; i < numCircles; i++) {
    if (dist(mouseX, mouseY, circles[i].xpos, circles[i].ypos) <= circles[i].r) {
      if (circles[i].compare == false) {
        circles[i].compare = true;
      } else {
        circles[i].compare = false;
      }
    }
  }
}
