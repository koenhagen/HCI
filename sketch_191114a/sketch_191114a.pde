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
  table = loadTable("Test.csv", "header");
  noStroke();
  icons = new Species[table.getRowCount()];   
  
  search_icon = loadImage("search_icon.png");
  
  for (int i = 0; i < table.getRowCount(); i++){
    TableRow soortTable = table.getRow(i);
    icons[i] = new Species(soortTable.getString("Nederlandse naam"),soortTable.getString("Klasse"),soortTable.getString("Wetenschappelijke naam"),table.getRow(i).getString("Beschrijving"));  
  }
}

void draw() {
  background(51);
  x = 200;
  y = height-80;
  
  stroke(0);
  strokeWeight(2);
  
  //Buttons
  fill(255,255,255);
  ellipse(50, 630, 15, 15);
  if (mousePressed && mouseX >= 50-7.5 && mouseX <= 50+7.5 && 
      mouseY >= 630-7.5 && mouseY <= 630+7.5) {
    filter = "";
  }
  ellipse(50, 650, 15, 15);
  if (mousePressed && mouseX >= 50-7.5 && mouseX <= 50+7.5 && 
      mouseY >= 650-7.5 && mouseY <= 650+7.5) {
    filter = "steenvlieg";
  }
  ellipse(50, 670, 15, 15);
  if (mousePressed && mouseX >= 50-7.5 && mouseX <= 50+7.5 && 
      mouseY >= 670-7.5 && mouseY <= 670+7.5) {
    filter = "paard";
  }
  
  //Search bar
  textAlign(LEFT,TOP);
  textSize(32);
  image(search_icon,70,15,40,40);
  if (mousePressed && mouseX >= 70 && mouseX <= 140+width-248 && 
      mouseY >= 15 && mouseY <= 15+40){
  }
  fill(100,100,100,100);
  rect(140,15,width-248,40);
  fill(#FFFFFF);
  text(searchEntry, 150, 15); 
  textSize(12);
  
    println(searchEntry);
  if (searchEntry.equals("") && filter.equals("")){
    pushMatrix();
    translate(190,710);
    rotate(PI/-4);
    textAlign(RIGHT);
    text("Amfibieen", 0,0);
    text("Vogels", 20,20);
    text("Vissen", 80,80);
    popMatrix();
  }
    
  //Icons
  for (int i=0; i < icons.length; i++) {
    if( icons[i].getTaxonomy().toLowerCase().contains(filter)){
      if(icons[i].getName().toLowerCase().contains(searchEntry.toLowerCase()) || icons[i].getScientificName().toLowerCase().contains(searchEntry.toLowerCase()) || icons[i].getTaxonomy().toLowerCase().contains(searchEntry.toLowerCase()) ){
        icons[i].drawTarget(x,y);
       
       //Locatie volgende icoontje
        y = y-diameter-2;
        if (y<80 && icons[i].getTaxonomy().equals(icons[i+1].getTaxonomy())){
          x= x+diameter+2;
          y = height-80;
          
        }
       
      }
    }
        if (i+1 < icons.length && !icons[i].getTaxonomy().equals(icons[i+1].getTaxonomy())){
   
          x= x+diameter+2;
          y = height-80;
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
