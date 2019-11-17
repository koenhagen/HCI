int x;
int y;
int diameter = 15;
Table table;
String searchEntry = "";
PFont fontBold;

Species[] icons;

void setup() {
  size(displayWidth, displayHeight);
  table = loadTable("Test.csv", "header");
  noStroke();
  fontBold   = createFont("Arial Bold", 12);
  icons = new Species[table.getRowCount()];   
  
  for (int i = 0; i < table.getRowCount(); i++){
    TableRow soortTable = table.getRow(i);
      
    icons[i] = new Species(soortTable.getString("Nederlandse naam"),soortTable.getString("Klasse"),soortTable.getString("Wetenschappelijke naam"));  
  }
}

void draw() {
  background(51);
  x = 200;
  y = 80;
  
  fill(255,255,255);
  textAlign(LEFT,TOP);
  textSize(32);
  text(searchEntry, 100, 15); 
  textSize(12);
    
  for (int i=0; i < icons.length; i++) {
    if(icons[i].getName().toLowerCase().contains(searchEntry.toLowerCase())){
      icons[i].drawTarget(x,y);
      
      //Locatie volgende icoontje
      x = x+diameter;
      if (x>width-200){
        y= y+diameter;
        x=200;
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

public class Species{
  String name;
  String scientificName;
  String taxonomy;
  boolean mouseOver;
  
  Species(String name_, String taxonomy_, String scientificName_) {
  //positionX = positionX_;
  //positionY = positionY_;
  name = name_;
  scientificName = scientificName_;
  taxonomy = taxonomy_;
  }
  
  String getName(){
    return name;
  }
  
  
  void drawTarget(int positionX, int positionY) {
    stroke(0);
    strokeWeight(2);
    
    //Kies kleur/icoontje
    if (taxonomy.equals("Insect")){
      fill(255,0,0);
    } else if ( taxonomy.equals("Amphibian")){
      fill(0,255,0);
    } else if (taxonomy.equals("Bird")){
      fill (0,0,255);
    } else if (taxonomy.equals("Mammal")){
      fill (255,0,255);
    } else if (taxonomy.equals("Fish")){
      fill (255,255,0);
    }
    
          
    //Plaats icoontje
    ellipse(positionX, positionY, diameter, diameter);
      
    mouseOver=positionX-diameter/2<=mouseX&&mouseX<=positionX+diameter/2 &&
                positionY-diameter/2<=mouseY&&mouseY<=positionY+diameter/2;
               
     textFont(fontBold);
     if (mouseOver) {
        fill(0,100,100);
        textAlign(LEFT,TOP);
        if(textWidth(name)>textWidth(scientificName)) {
          rect(positionX-textWidth(name)-diameter-5,positionY-diameter*3,textWidth(name)+diameter/2+3,diameter*2+5,3);     
          fill(255,255,255);
          text(name+"\n"+scientificName+"",positionX-textWidth(name)-diameter,positionY-diameter*3);
        } else {
          rect(positionX-textWidth(scientificName)-diameter-5,positionY-diameter*3,textWidth(scientificName)+diameter/2+5,diameter*2+5,3); 
          fill(255,255,255);
          text(name+"\n"+scientificName,positionX-textWidth(scientificName)-diameter,positionY-diameter*3);  
        }
     }
  }
}
