int x = 10;
int y = 10;
int diameter = 15;
Table table;

Species[] icons;

void setup() {
  size(800, 600);
  table = loadTable("Test.csv", "header");
  noStroke();
    
  icons = new Species[table.getRowCount()];   
  
  for (int i = 0; i < table.getRowCount(); i++){
    TableRow soortTable = table.getRow(i);
      
    
    icons[i] = new Species(x, y, soortTable.getString("Nederlandse naam"),soortTable.getString("Klasse"));
    
    //drawTarget(x, y, diameter, soortTable);
    
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
  for (int i=0; i < icons.length; i++) {
    icons[i].drawTarget();
  }
  
}

public class Species{
  int positionX;
  int positionY;
  String name;
  String taxonomy;
  boolean mouseOver;
  
  Species(int positionX_, int positionY_, String name_, String taxonomy_) {
  positionX = positionX_;
  positionY = positionY_;
  name = name_;
  taxonomy = taxonomy_;
  }
  
  
  void drawTarget() {
    stroke(0);
    strokeWeight(2);
    
    //Kies kleur/icoontje
    if (taxonomy.equals("Insect")){
      fill(255,0,0);
    } else if ( taxonomy.equals("Amphibian")){
      fill(0,255,0);
    } else if (taxonomy.equals("Amphibian")){
      fill (0,0,255);
    }
    
    mouseOver=positionX-diameter/2<=mouseX&&mouseX<=positionX+diameter/2&&
                positionY-diameter/2<=mouseY&&mouseY<=positionY+diameter/2;
       
          
      //Plaats icoontje
      ellipse(positionX, positionY, diameter, diameter);
      
               
     if (mouseOver){
        fill(0,100,100);
        rect(positionX+diameter-5,positionY+diameter,textWidth(name)+diameter,diameter,3);
        fill(255,255,255);
        textAlign(LEFT,TOP);
        text(name,positionX+diameter,positionY+diameter);
        
     }
  }

}
