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
  
  
  fill(255,255,255);
  textAlign(LEFT,TOP);
  textSize(32);
  image(search_icon,70,15,40,40);
  fill(100,100,100,100);
  rect(140,15,width-248,40);
  fill(#FFFFFF);
  text(searchEntry, 150, 15); 
  textSize(12);
    
  for (int i=0; i < icons.length; i++) {
    
    
    
    
    if(icons[i].getName().toLowerCase().contains(searchEntry.toLowerCase()) || icons[i].getScientificName().toLowerCase().contains(searchEntry.toLowerCase()) || icons[i].getTaxonomy().toLowerCase().contains(searchEntry.toLowerCase()) ){
      icons[i].drawTarget(x,y);
      
      if (mousePressed){
        icons[i].mousePressed();
      }
     
      if (i+1 < icons.length && !icons[i].getTaxonomy().equals(icons[i+1].getTaxonomy())){
 
        x= x+diameter+2;
        y = height-80+diameter;
      }
     //Locatie volgende icoontje
      y = y-diameter-2;
      if (y<80){
        x= x+diameter+2;
        y = height-80;
        
      }
     
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
