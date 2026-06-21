PImage OpArt;
float angulo=18;
float tam=400;

//RGB borde
int bordeR=0;
int bordeG=0;
int bordeB=0;
//RGB relleno
int rellenoR=255;
int rellenoG=255;
int rellenoB=255;

void setup() {
  size(800,400);
  OpArt=loadImage("36.jpg");
  rectMode(CENTER);
}

void draw() {
  background(31,23,160);
  image(OpArt,0,0,width/2,height);

  push();
  translate(width-width/4,height/2);

  for (int x=-200; x<200; x+=40) {
    for (int y=-200; y<200; y+=40) {
      if (esPar((x+200)/40+(y+200)/40)) {
        fill(20);
      } else {
        fill(0);
      }
      rect(x+20,y+20,40,40);
    }
  }

  int capas=10;
  for (int i=capas; i>0; i--) {

    //bordes
    float grosorArriba=21;
    float grosorCostado=grosorArriba/2;
    float grosorAbajo=3;

    float tamRect=i*40*(tam/400);

    float anguloCapa=radians(angulo)*(capas-i+1)*0.15;
    
    cuadrados(0,4,tamRect,anguloCapa,rellenoR,rellenoG,rellenoB,bordeR,bordeG,bordeB,grosorArriba,grosorCostado,grosorAbajo);
  }
  pop();
}

void cuadrados(float x,float y,float tam,float angulo,int rellenoR,int rellenoG,int rellenoB,int bordeR,int bordeG,int bordeB,float grosorArriba,float grosorCostado,float grosorAbajo) {
  push();
  translate(x,y);
  rotate(angulo);

  fill(rellenoR,rellenoG,rellenoB);
  noStroke();
  rect(0,0,tam,tam);

  fill(bordeR,bordeG,bordeB);
  float r=tam/2;

  rect(-r+grosorCostado/2,0,grosorCostado,tam); //izq
  rect(r-grosorCostado/2,0,grosorCostado,tam); //der

  rect(0,-r+grosorArriba/2,tam,grosorArriba);
  rect(0,r-grosorAbajo/2,tam,grosorAbajo);

  pop();
}

boolean esPar(int valor) {
  if (valor%2==0) {
    return true;
  } else {
    return false;
  }
}

void mouseDragged(){
  //movimiento en X
  float difX=mouseX-pmouseX;
  if(difX>0){
    angulo+=2;
  }else if(difX<0){
    angulo-=2;
  }
  //movimiento en Y
  float difY=mouseY-pmouseY;
  if(difY>0){
    tam-=4;
  }else if(difY<0){
    tam+=4;
  }
  
  tam=constrain(tam,100,500);
}

void keyPressed() {
  //cambiar colores
  if (key=='c') {
    bordeR=int(random(255));
    bordeG=int(random(255));
    bordeB=int(random(255));

    rellenoR=int(random(255));
    rellenoG=int(random(255));
    rellenoB=int(random(255));
  }
  //reiniciar
  if (key=='r') {
    angulo=15;
    tam=400;
    
    rellenoR=255;    
    rellenoG=255;
    rellenoB=255;
    
    bordeR=0;
    bordeG=0;
    bordeB=0;
  }
}
