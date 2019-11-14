/* In deze sketch voeg ik nog wat dingen toe. Zoals de hover text*/

import controlP5.*;
//for buttons
ControlP5 cp5;
int myColor = color(255);
int c1, c2;
float n, n1;

Table t;
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
  background(255);
  size(900, 900);
  noStroke();
  loadData();

  //addButtons();
}

void draw() {
  background(0);
    display();
  for (int i = 0; i<t.getRowCount(); i++) { // Access each row of the table one at a time, in a loop.
    TableRow r = t.getRow(i);
    hoverText(r);
    }
  }

  void loadData() {
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

      println(naam, verdwenen, ernstigBedreigd, bedreigd);
    }
  }

  void display() {
    for (int i = 0; i<t.getRowCount(); i++) {

      TableRow r = t.getRow(i);
      decideColor(i);
      ellipse(r.getFloat("Totaal bedreigd") * 4, r.getFloat("Totaal bedreigd") * 4, r.getFloat("Totaal"), r.getFloat("Totaal") ); // ellipse(random(diam, width - diam, etc.)
    }
  }
  
  void hoverText(TableRow r){
      if (dist(mouseX, mouseY, r.getFloat("Totaal bedreigd") * 4, r.getFloat("Totaal bedreigd") * 4) < r.getFloat("Totaal") / 2) {
      fill(255);
      textAlign(CENTER);
      text(r.getString("Nederlandse naam"), mouseX, mouseY + 40);
        }
  }
  
  void decideColor(int i){
          if (i == 0) {
        fill(#e6194B); // rood = steenvliegen
      }
      if (i == 1) {
        fill(#f58231); // oranje = reptielen
      }
      if (i==2) {
        fill(#ffe119); // geel = dagvlinders
      }
      if (i==3) {
        fill(#bfef45); // lime = haften
      }
      if (i==4) {
        fill(#3cb44b); // groen = bijen
      }
      if (i==5) {
        fill(#42d4f4); // cyan = kokerjuffers
      }
      if (i==6) {
        fill(#4363d8); // blauw = amfibieen
      }
      if (i==7) {
        fill(#911eb4); //paars = Weekdieren
      }
      if (i==8) {
        fill(#9A6324); // bruin = Vissen
      }
      if (i==9) {
        fill(#a9a9a9); // grijs = Zoogdieren
      }
      if (i==10) {
        fill(#808000); // olijf = Vogels
      }
      if (i > 10) {
        fill(i * 4, i*2, i * 6);
      }
  }

      

  //void addButtons(){
  //  cp5 = new ControlP5(this);

  //  // create a new button with name 'Dagvlinders'
  //  cp5.addButton("Dagvlinders")
  //    .setValue(0)
  //    .setPosition(30, 700)
  //    .setSize(200, 19)
  //    ;
  //  // and another one with name 'amfibieen'   
  //  cp5.addButton("Amfibieen")
  //    .setValue(100)
  //    .setPosition(30, 720)
  //    .setSize(200, 19)
  //    ;
  //}
