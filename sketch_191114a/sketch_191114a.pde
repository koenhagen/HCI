int x;
int y;
int diameter = 15;
Table table;
String searchEntry = "";

Species[] icons;

void setup() {
  size(800, 600);
  table = loadTable("Test.csv", "header");
  noStroke();
    
  icons = new Species[table.getRowCount()];   
  
  for (int i = 0; i < table.getRowCount(); i++){
    TableRow soortTable = table.getRow(i);
      

    icons[i] = new Species(soortTable.getString("Nederlandse naam"),soortTable.getString("Klasse"));
    
    //Locatie volgende icoontje
    x = x+diameter;
    if (x>800){
      y= y+diameter;
      x=10;
    }
  
  }
}

void draw() {
  background(51);
  x = 10;
  y = 50;
  
  fill(255,255,255);
  textAlign(LEFT,TOP);
  textSize(32);
  text(searchEntry, 0, 10); 
  textSize(12);
    
  for (int i=0; i < icons.length; i++) {
    if(icons[i].getName().toLowerCase().contains(searchEntry.toLowerCase())){
      icons[i].drawTarget(x,y);
      
      //Locatie volgende icoontje
      x = x+diameter;
      if (x>800){
        y= y+diameter;
        x=10;
      }
    }
  }
}

void keyPressed(){
  if (key >= 'A' && key <= 'Z' || key >= 'a' && key <= 'z') {
    searchEntry = searchEntry+key;
    println(searchEntry);
  }
}

public class Species{
  //int positionX;
  //int positionY;
  String name;
  String taxonomy;
  boolean mouseOver;
  
  Species(String name_, String taxonomy_) {
  //positionX = positionX_;
  //positionY = positionY_;
  name = name_;
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
    }
    
          
      //Plaats icoontje
      ellipse(positionX, positionY, diameter, diameter);
      
    mouseOver=positionX-diameter/2<=mouseX&&mouseX<=positionX+diameter/2&&
                positionY-diameter/2<=mouseY&&mouseY<=positionY+diameter/2;
       
               
     if (mouseOver){
        fill(0,100,100);
        rect(positionX+diameter-5,positionY+diameter,textWidth(name)+diameter/2+3,diameter,3);
        fill(255,255,255);
        textAlign(LEFT,TOP);
        text(name,positionX+diameter,positionY+diameter);
     }
  }
}
