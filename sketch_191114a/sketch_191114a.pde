float x = 10;
float y = 10;
int z = 0;
Table table;
String soort;

void setup() {
  size(640, 360);
  background(51);
  table = loadTable("Test.csv", "header");
  noStroke();
  noLoop();
}

void draw() {
  background(0);
  for (int i = 0; i < table.getRowCount(); i++){
    
    TableRow soortTable = table.getRow(i);
    println(soortTable.getString("Klasse"));
    if(over){
     text("test",x,y+25);
    }
    drawTarget(x, y, 10, 10, soortTable);
    
    
    x = x+10;
    if (x>630){
      y= y+10;
      x=10;
    }
    
  }
  
}

void drawTarget(float xloc, float yloc, int size, int num, TableRow soortTable) {
  soort = soortTable.getString("Klasse");
  if (soort.equals("Insect")){
    fill(255,0,0);
  } else if ( soort.equals("Amphibian")){
    fill(0,255,0);
    
  }
  float steps = size/num;
  for (int i = 0; i < num; i++) {
    ellipse(xloc, yloc, size - i*steps, size - i*steps);
  }
}

boolean over = false;
void rollover(float px, float py){
   float d = dist(px,py,x,y);
   if(d<5){
     over = true;
   } else {
    over = false; 
   }
}

 void display(){
 }
