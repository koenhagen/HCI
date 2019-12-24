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
  size(displayWidth, displayHeight);
  table = loadTable("Test3.csv", "header");
  noStroke();
  icons = new Species[table.getRowCount()];   
  
  search_icon = loadImage("search_icon.png");
  
  for (int i = 0; i < table.getRowCount(); i++){
    TableRow soortTable = table.getRow(i);
    icons[i] = new Species(soortTable.getString("Nederlandse naam"),soortTable.getString("Klasse"),soortTable.getString("Wetenschappelijke naam"),table.getRow(i).getString("Status"),soortTable.getString("Trend"));  
  }
}

void draw() {
  background(51);
  x = width/8;
  y = height/10*9;
  
  stroke(0);
  strokeWeight(2);
  
  //Status picker
  fill(255,255,255);  
   stroke(51); 
  if (mouseX >= 50 && mouseX <= 50+15 && 
  mouseY >= 530 && mouseY <= 530+15) {
    if (mousePressed ){
      filter = "";
    }
    stroke(153);
  }
  rect(50, 530, 15, 15);
  stroke(51); 
  
  stroke(51); 
  if (mouseX >= 50 && mouseX <= 50+15 && 
  mouseY >= 550 && mouseY <= 550+15) {
    if (mousePressed ){
      filter = "onbekend";
    }
    stroke(153);
  }
  rect(50, 550, 15, 15);
  stroke(51); 
  
  if (mouseX >= 50 && mouseX <= 50+15 && 
  mouseY >= 570 && mouseY <= 570+15) {
    if (mousePressed ){
      filter = "maximaal afgenomen";
    }
    stroke(153);
  }
  rect(50, 570, 15, 15);
  stroke(51);
  
  if (mouseX >= 50 && mouseX <= 50+15 && 
  mouseY >= 590 && mouseY <= 590+15) {
    if (mousePressed ){
      filter = "zeer sterk afgenomen";
    }
    stroke(153);
  }
  rect(50, 590, 15, 15);
  stroke(51);
  if (mouseX >= 50 && mouseX <= 50+15 && 
  mouseY >= 610 && mouseY <= 610+15) {
    if (mousePressed ){
      filter = "sterk afgenomen";
    }
    stroke(153);
  }
  rect(50, 610, 15, 15);
  stroke(51);
  
  if (mouseX >= 50 && mouseX <= 50+15 && 
      mouseY >= 630 && mouseY <= 630+15) {
    if (mousePressed ){
      filter = "matig afgenomen";
    }
    stroke(153);
  }
  rect(50, 630, 15, 15);
  stroke(51);
  
  if (mouseX >= 50 && mouseX <= 50+15 && 
      mouseY >= 650 && mouseY <= 650+15) {
    if (mousePressed){
      filter = "niet afgenomen";
    }
    stroke(153);
  }
  rect(50, 650, 15, 15);
  stroke(51);
  
  if (mouseX >= 50 && mouseX <= 50+15 && 
      mouseY >= 670 && mouseY <= 670+15) {
        if (mousePressed ){
          filter = "stabiel of toegenomen";
        }
        stroke(153);
  }
  rect(50, 670, 15, 15);
  stroke(51);
  

  
  //Search bar
  textAlign(LEFT,TOP);
  textSize(32);
  image(search_icon,70,15,40,40);
  if (mousePressed && mouseX >= 70 && mouseX <= 140+width-248 && 
      mouseY >= 15 && mouseY <= 15+40){
        stroke(153);
  }
  fill(100,100,100,100);
  rect(140,15,width-248,40);
  fill(#FFFFFF);
  text(searchEntry, 150, 15); 
  textSize(12);
  
    println(searchEntry);
  if (searchEntry.equals("") && filter.equals("")){
    pushMatrix();
    translate(150,750);
    rotate(PI/-4);
    text("Amfibieen", 0,0);
    text("V", 20,0);
    popMatrix();
  }
    
  //Icons
  for (int i=0; i < icons.length; i++) {
    if( icons[i].getTrend().toLowerCase().equals(filter) || filter.equals("")){
      if(icons[i].getName().toLowerCase().contains(searchEntry.toLowerCase()) || icons[i].getScientificName().toLowerCase().contains(searchEntry.toLowerCase()) || icons[i].getTaxonomy().toLowerCase().contains(searchEntry.toLowerCase()) ){
        icons[i].drawTarget(x,y);
       
       //Locatie volgende icoontje
        y = y-diameter-2;
        if (y<80 && icons[i].getTaxonomy().equals(icons[i+1].getTaxonomy())){
          x= x+diameter+2;
          y = height/10*9;
          
        }
       
      }
    }
        if (i+1 < icons.length && !icons[i].getTaxonomy().equals(icons[i+1].getTaxonomy())){
   
          x= x+diameter+2;
          y = height/10*9;
        }
  }
}


void keyPressed(){
  if (key >= 'A' && key <= 'Z' || key >= 'a' && key <= 'z' || key == ' ') {
    searchEntry = searchEntry+key;
  } else if (key == BACKSPACE && searchEntry != ""){
    if (!searchEntry.equals("") ){
      searchEntry = searchEntry.substring(0, searchEntry.length() - 1);       
    }
  }
}
