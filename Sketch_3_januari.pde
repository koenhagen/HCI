int x;
int y;
int diameter = 20;
Table table;
String searchEntry = "";
PImage search_icon;

TableRow row;
int verdwenen;
int ernstigBedreigd ;
int bedreigd;
int kwetsbaar;
int gevoelig;
int totaal;
int nietBedreigd;
int totBedreigd;

float[] angles = new float[6];

String filter = "";

Species[] icons;

void setup() {
  fullScreen();
  table = loadTable("Test3.csv", "header");
  noStroke();
  icons = new Species[table.getRowCount()];   

  search_icon = loadImage("search_icon.png");

  for (int i = 0; i < table.getRowCount(); i++) {
    TableRow soortTable = table.getRow(i);
    icons[i] = new Species(soortTable.getString("Nederlandse naam"), soortTable.getString("Klasse"), soortTable.getString("Wetenschappelijke naam"), table.getRow(i).getString("Status"), soortTable.getString("Trend"));
  }
}

void draw() {

  background(51);
  x = width/8;
  y = height/10*9;

  stroke(0);
  strokeWeight(2);

  //Status picker
  fill(255, 255, 255); 
  textSize(24);
  text("Filter trend:", 10, 490);
  stroke(51); 
  if (mouseX >= 10 && mouseX <= 10+15 && 
    mouseY >= 530 && mouseY <= 530+15) {
    if (mousePressed ) {
      filter = "";
    }
    stroke(153);
  }
  rect(10, 530, 15, 15);
  textSize(12);
  text("Alles zien", 30, 530);
  stroke(51); 

  stroke(51); 
  if (mouseX >= 10 && mouseX <= 10+15 && 
    mouseY >= 550 && mouseY <= 550+15) {
    if (mousePressed ) {
      filter = "onbekend";
    }
    stroke(153);
  }
  rect(10, 550, 15, 15);
  text("Trend onbekend", 30, 550);
  stroke(51); 

  if (mouseX >= 10 && mouseX <= 10+15 && 
    mouseY >= 570 && mouseY <= 570+15) {
    if (mousePressed ) {
      filter = "maximaal afgenomen";
    }
    stroke(153);
  }
  rect(10, 570, 15, 15);
  text("Maximaal afgenomen", 30, 570);
  stroke(51);

  if (mouseX >= 10 && mouseX <= 10+15 && 
    mouseY >= 590 && mouseY <= 590+15) {
    if (mousePressed ) {
      filter = "zeer sterk afgenomen";
    }
    stroke(153);
  }
  rect(10, 590, 15, 15);
  text("Zeer sterk afgenomen", 30, 590);
  stroke(51);

  if (mouseX >= 10 && mouseX <= 10+15 && 
    mouseY >= 610 && mouseY <= 610+15) {
    if (mousePressed ) {
      filter = "sterk afgenomen";
    }
    stroke(153);
  }
  rect(10, 610, 15, 15);
  text("Sterk afgenomen", 30, 610);
  stroke(51);

  if (mouseX >= 10 && mouseX <= 10+15 && 
    mouseY >= 630 && mouseY <= 630+15) {
    if (mousePressed ) {
      filter = "matig afgenomen";
    }
    stroke(153);
  }
  rect(10, 630, 15, 15);
  text("Matig afgenomen", 30, 630);
  stroke(51);

  if (mouseX >= 10 && mouseX <= 10+15 && 
    mouseY >= 650 && mouseY <= 650+15) {
    if (mousePressed) {
      filter = "niet afgenomen";
    }
    stroke(153);
  }
  rect(10, 650, 15, 15);
  text("Niet afgenomen", 30, 650);
  stroke(51);

  if (mouseX >= 10 && mouseX <= 10+15 && 
    mouseY >= 670 && mouseY <= 670+15) {
    if (mousePressed ) {
      filter = "stabiel of toegenomen";
    }
    stroke(153);
  }
  rect(10, 670, 15, 15);
  text("Stabiel of toegenomen", 30, 670);
  stroke(51);



  //Search bar
  textAlign(LEFT, TOP);
  textSize(32);
  image(search_icon, 70, 15, 40, 40);
  if (mousePressed && mouseX >= 70 && mouseX <= 140+width-248 && 
    mouseY >= 15 && mouseY <= 15+40) {
    stroke(153);
  }
  fill(100, 100, 100, 100);
  rect(140, 15, width-248, 40);
  fill(#FFFFFF);
  text(searchEntry, 150, 15); 
  textSize(12);

  println(searchEntry);

  //De namen van de dieren onder de kolommen
  if (searchEntry.equals("") && filter.equals("")) {
    noStroke();
    pushMatrix();
    translate(130, 870);
    rotate(PI/-4);
    fill(0, 255, 0, 150);
    rect(-5, 0, 70, 20);
    fill(255, 255, 255);
    text("Amfibieen", 0, 0);
    popMatrix();

    pushMatrix();
    translate(190, 860);
    rotate(PI/-4);
    fill(0, 0, 255, 150);
    rect(-5, 0, 50, 20);
    fill(255, 255, 255);
    text("Vogels", 0, 0);
    popMatrix();

    pushMatrix();
    translate(265, 860);
    rotate(PI/-4);
    fill(255, 255, 0, 150);
    rect(-5, 0, 50, 20);
    fill(255, 255, 255);
    text("Vissen", 0, 0);
    popMatrix();

    pushMatrix();
    translate(375, 850);
    rotate(PI/-4);
    fill(255, 0, 0, 150);
    rect(-5, 0, 40, 20);
    fill(255, 255, 255);
    text("Bijen", 0, 0);
    popMatrix();

    pushMatrix();
    translate(445, 870);
    rotate(PI/-4);
    fill(255, 0, 255, 150);
    rect(-5, 0, 73, 17);
    fill(255, 255, 255);
    text("Zoogdieren", 0, 0);
    popMatrix();

    pushMatrix();
    translate(475, 875);
    rotate(PI/-4);
    fill(255, 255, 255, 200);
    rect(-5, 0, 80, 17);
    fill(0, 0, 0);
    text("Sprinkhanen", 0, 0);
    popMatrix();

    pushMatrix();
    translate(525, 855);
    rotate(PI/-4);
    fill(120, 0, 0, 150);
    rect(-5, 0, 50, 17);
    fill(255, 255, 255);
    text("Libellen", 0, 0);
    popMatrix();

    pushMatrix();
    translate(540, 875);
    rotate(PI/-4);
    fill(0, 120, 120, 150);
    rect(-5, 0, 75, 17);
    fill(255, 255, 255);
    text("Platwormen", 0, 0);
    popMatrix();

    pushMatrix();
    translate(580, 875);
    rotate(PI/-4);
    fill(0, 0, 120, 150);
    rect(-5, 0, 75, 17);
    fill(255, 255, 255);
    text("Weekdieren", 0, 0);
    popMatrix();

    pushMatrix();
    translate(640, 875);
    rotate(PI/-4);
    fill(15, 150, 250, 150);
    rect(-5, 0, 80, 17);
    fill(255, 255, 255);
    text("Kokerjuffers", 0, 0);
    popMatrix();

    pushMatrix();
    translate(720, 855);
    rotate(PI/-4);
    fill(120, 120, 0, 150);
    rect(-5, 0, 50, 17);
    fill(255, 255, 255);
    text("Haften", 0, 0);
    popMatrix();

    pushMatrix();
    translate(750, 875);
    rotate(PI/-4);
    fill(0, 255, 255, 150);
    rect(-5, 0, 80, 17);
    fill(255, 255, 255);
    text("Dagvlinders", 0, 0);
    popMatrix();

    pushMatrix();
    translate(795, 875);
    rotate(PI/-4);
    fill(120, 0, 120, 150);
    rect(-5, 0, 80, 17);
    fill(255, 255, 255);
    text("Steenvliegen", 0, 0);
    popMatrix();

    pushMatrix();
    translate(840, 865);
    rotate(PI/-4);
    fill(0, 120, 0, 150);
    rect(-5, 0, 60, 17);
    fill(255, 255, 255);
    text("Reptielen", 0, 0);
    popMatrix();
  }

  //Icons
  for (int i=0; i < icons.length; i++) {
    if ( icons[i].getTrend().toLowerCase().equals(filter) || filter.equals("")) {
      if (icons[i].getName().toLowerCase().contains(searchEntry.toLowerCase()) || icons[i].getScientificName().toLowerCase().contains(searchEntry.toLowerCase()) || icons[i].getTaxonomy().toLowerCase().contains(searchEntry.toLowerCase()) ) {
        icons[i].drawTarget(x, y);

        //Locatie volgende icoontje
        y = y-diameter-2;
        if (y<80 && icons[i].getTaxonomy().equals(icons[i+1].getTaxonomy())) {
          x= x+diameter+2;
          y = height/10*9;
        }
      }
    }
    if (i+1 < icons.length && !icons[i].getTaxonomy().equals(icons[i+1].getTaxonomy())) {

      x= x+diameter+10;
      y = height/10*9;
    }
  }
}


void keyPressed() {
  if (key >= 'A' && key <= 'Z' || key >= 'a' && key <= 'z' || key == ' ') {
    searchEntry = searchEntry+key;
  } else if (key == BACKSPACE && searchEntry != "") {
    if (!searchEntry.equals("") ) {
      searchEntry = searchEntry.substring(0, searchEntry.length() - 1);
    }
  }
}
