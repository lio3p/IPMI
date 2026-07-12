//https://youtu.be/XxbwAlrj4VQ?si=kppHyxwRj081rHpB
PImage OpArt;
float angulo=18;
float tam=400;

//RGB relleno
int rellenoR=192;
int rellenoG=192;
int rellenoB=192;
//RGB borde
int bordeR=13;
int bordeG=13;
int bordeB=14;

void setup() {
  size(800, 400);
  OpArt=loadImage("36.jpg");
  rectMode(CENTER);
}

void draw() {
  background(31, 23, 160);

  push();
  translate(width-width/4, height/2);

  for (int x=-200; x<200; x+=40) {
    for (int y=-200; y<200; y+=40) {

      float posX=(width-width/4);
      float posY=(height/2)+y+20;

      float d=dist(mouseX, mouseY, posX, posY);
      float tono=map(d, 0, 300, 60, 0);
      tono=constrain(tono, 0, 60);

      if (esPar((x+200)/40+(y+200)/40)) {
        fill(20);
      } else {
        fill(0+tono);
      }
      rect(x+20, y+20, 40, 40);
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

    cuadrados(0, 4, tamRect, anguloCapa, rellenoR, rellenoG, rellenoB, bordeR, bordeG, bordeB, grosorArriba, grosorCostado, grosorAbajo);
  }
  pop();
  image(OpArt, 0, 0, width/2, height);
}

void cuadrados(float x, float y, float tam, float angulo, int rellenoR, int rellenoG, int rellenoB, int bordeR, int bordeG, int bordeB, float grosorArriba, float grosorCostado, float grosorAbajo) {
  push();
  translate(x, y);
  rotate(angulo);

  fill(rellenoR, rellenoG, rellenoB);
  noStroke();
  rect(0, 0, tam, tam);

  fill(bordeR, bordeG, bordeB);
  float r=tam/2;

  rect(-r+grosorCostado/2, 0, grosorCostado, tam); //izq
  rect(r-grosorCostado/2, 0, grosorCostado, tam); //der

  rect(0, -r+grosorArriba/2, tam, grosorArriba);
  rect(0, r-grosorAbajo/2, tam, grosorAbajo);

  pop();
}

boolean esPar(int valor) {
  if (valor%2==0) {
    return true;
  } else {
    return false;
  }
}

void mouseDragged() {
  //movimiento en X
  float difX=mouseX-pmouseX;
  if (difX>0) {
    angulo+=2;
  } else if (difX<0) {
    angulo-=2;
  }
  //movimiento en Y
  float difY=mouseY-pmouseY;
  if (difY>0) {
    tam-=4;
  } else if (difY<0) {
    tam+=4;
  }

  tam=constrain(tam, 100, 500);
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

    rellenoR=192;
    rellenoG=192;
    rellenoB=192;

    bordeR=13;
    bordeG=13;
    bordeB=14;
  }
}
