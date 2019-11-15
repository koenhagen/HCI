float x = 10;
float y = 10;
int z = 0;
Table table;
String soort;
int i;

void setup() {
  size(640, 360);
  background(51);
  table = loadTable("Test.csv", "header");
  noStroke();
  i = 0;
}

void draw() {
  
  line(mouseX, 20, mouseX, 80);
  if (i<table.getRowCount()){
   
  //for (i = 0; i < table.getRowCount(); i++){
    TableRow soortTable = table.getRow(i);    
      
    i++;
    drawTarget(x, y, 10, soortTable);
    
    //Locatie volgende icoontje
    x = x+10;
    if (x>630){
      y= y+10;
      x=10;
    }
    
  }
  
}

void drawTarget(float xloc, float yloc, int size, TableRow soortTable) {
  
  //Kies kleur/icoontje
  soort = soortTable.getString("Klasse");
  if (soort.equals("Insect")){
    fill(255,0,0);
  } else if ( soort.equals("Amphibian")){
    fill(0,255,0);
  }
  
  if (mouseX > x-5 && mouseX < x+5 && 
    mouseY > y-5 && mouseY < y+5) {
      println("test!!");
      text(soortTable.getString("Nederlandse naam"),x+10,y-10);
  }
      
    //Plaats icoontje
    ellipse(xloc, yloc, size, size);
}
