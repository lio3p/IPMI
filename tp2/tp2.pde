int pantalla;
PFont fuente1;
PFont fuente2;
PImage fondo1;
PImage boton1;
PImage fondo2;
PImage overFondo2;
PImage astro;
PImage fondo3;
PImage overFondo3;
PImage scan;
PImage ruido;
PImage fondoFinal;
PImage puerta1;
PImage puerta2;
boolean boton1Activado;
boolean botonReiniciar;

//transicion
int crt=0;
float alto=0;
float ancho=0;
float punto=255;
//duracion pantallas
int inicioPantalla=0;
int duracionPantalla=380;
//elementos en movimiento
float opAstro=0;
float opTexto=0;
float scanY=0;

String texto="Christof: El creador, director y productor ejecutivo del show. Actúa como una especie de dios orquestador y manipulador. Aunque dice querer a Truman como a un hijo, su verdadera obsesión es el control y el éxito de su obra maestra.";
String textoParcial="";
void setup() {
  size(640, 480);

  background(115, 174, 235);

  fuente1=loadFont("SegoePrint-Bold-48.vlw");
  fuente2=loadFont("LucidaConsole-48.vlw");
  fondo1=loadImage("Casa.png");
  boton1=loadImage("boton.png");
  fondo2=loadImage("Fondo2.png");
  overFondo2=loadImage("Fondo2overlay.png");
  astro=loadImage("Astronauta.png");
  fondo3=loadImage("fondo3.png");
  overFondo3=loadImage("over2fondo3.png");
  scan=loadImage("scanlines.png");
  ruido=loadImage("ruido.png");
  fondoFinal=loadImage("fondoFinal.png");
  puerta1=loadImage("puertaCerrada.png");
  puerta2=loadImage("puertaAbierta.png");
  pantalla=1;
}

void draw() {
  //pantalla de inicio
  if (pantalla==1) {
    tint(255);
    image(fondo1, 0, 0, width, height);

    //boton
    if (mouseX>230 && mouseX<230+169 && mouseY> 435 && mouseY < 435 + 46) {
      tint(255, 0, 0);
    } else {
      noTint();
    }
    image(boton1, 230, 435, 169, 46);

    //transicion
    if (boton1Activado) {
      if (crt==0) {
        crt=1;
      }
      boton1Activado=false;
    }
  }
  //pantalla 2
  if (pantalla==2) {
    noTint();
    image(fondo2, 0, 0);

    int fpsTranscurrido=frameCount-inicioPantalla;
    //animacion astronauta
    if (fpsTranscurrido<51) {
      opAstro+=5;
    } else if (fpsTranscurrido>=51&&duracionPantalla<120) {
      opAstro=255;
    } else if (fpsTranscurrido>=120&&fpsTranscurrido<171) {
      opAstro-=5;
    }
    //animacion texto
    if (fpsTranscurrido<171) {
      opTexto=0;
    } else if (fpsTranscurrido>=171&&fpsTranscurrido<222) {
      opTexto+=5;
    } else if (fpsTranscurrido>=222&&fpsTranscurrido<300) {
      opTexto=255;
    } else if (fpsTranscurrido>=300&&fpsTranscurrido<360) {
      opTexto-=5;
    } else {
      opTexto=0;
    }
    //control de efectos
    if (opAstro<0) {
      opAstro=0;
    }
    if (opAstro>255) {
      opAstro=255;
    }
    if (opTexto<0) {
      opTexto=0;
    }
    if (opTexto>255) {
      opTexto=255;
    }

    tint(255, opAstro);
    image(astro, 0, 0, width, height);

    fill(255, opTexto);
    textFont(fuente1);
    textSize(25);
    text("Truman Burbank: Un hombre alegre,\nbondadoso y aparentemente común que,\nsin saberlo, es la estrella del reality show\nmás grande del planeta. Toda su vida ha\nsido filmada y transmitida en vivo las\n24 horas del día.", 50, 50);

    noTint();
    image(overFondo2, 0, 0);

    if (fpsTranscurrido>=duracionPantalla) {
      pantalla=3;
      inicioPantalla=frameCount;
      opAstro=0;
      opTexto=0;
    }
  }

  //pantalla 3
  if (pantalla==3) {
    noTint();
    image(fondo3, 0, 0);
    //efecto de texto
    int contadorP3=frameCount-inicioPantalla;
    int verLetras=contadorP3/2;

    if (verLetras>texto.length()) {
      verLetras=texto.length();
    }
    textoParcial=texto.substring(0, verLetras);
    fill(165, 255, 168);
    textFont(fuente2);
    textSize(20);
    text(textoParcial, 160, 60, 355, 245);
    text(textoParcial, 160, 61, 355, 245);

    scanY+=2;
    if (scanY>=0) {
      scanY=-height;
    }
    image(scan, 0, scanY);
    image(overFondo3, 0, 0);

    if (contadorP3>=520) {
      pantalla=4;
    }
  }
  //pantalla 4
  if (pantalla==4) {
    image(fondoFinal, 0, 0);
    image(puerta1, 0, 0);

    fill(255);
    textFont(fuente1);
    textSize(30);
    text("placeholder\n(la puerta reinicia)", 50, 50);

    if (mouseX>515&&mouseX<515+67&&mouseY>59&&mouseY<59+122) {
      image(puerta2, 0, 0);
    } else {
      noTint();
    }
    if (botonReiniciar==true) {
      pantalla=1;
    }
    if (pantalla==1) {
      botonReiniciar=false;
    }
  }

  //control de efecto
  if (crt>0) {
    noStroke();
    fill(0);

    if (crt==1) {
      alto+=25;
      if (alto>=(height/2)-3) {
        alto=(height/2)-3;
        crt=2;
      }
    } else if (crt==2) {
      ancho+=30;
      if (ancho>=(width/2)-3) {
        ancho=(width/2)-3;
        crt=3;
      }
    }
    rect(0, 0, width, alto);
    rect(0, height-alto, width, alto);
    if (crt>=2) {
      rect(0, 0, ancho, height);
      rect(width-ancho, 0, ancho, height);
    }
    if (crt==3) {
      punto-=15;

      fill(255, punto);
      ellipse(width/2, height/2, 8, 8);
      if (punto<=0) {
        pantalla=2;
        inicioPantalla=frameCount;
        reinicioCRT();
      }
    }
  }
}
void mousePressed() {
  if (pantalla==1) {
    if (mouseX>230 && mouseX<230+169 && mouseY> 435 && mouseY < 435 + 46) {
      boton1Activado=true;
    }
  }

  if (pantalla==4) {
    if (mouseX>515&&mouseX<515+67&&mouseY>59&&mouseY<59+122) {
      botonReiniciar=true;
    }
  }
}

void reiniciar() {
  pantalla=1;
  boton1Activado=false;
  inicioPantalla=frameCount;
  opAstro=0;
  opTexto=0;
  reinicioCRT();

  botonReiniciar=false;
}
void reinicioCRT() {
  crt=0;
  alto=0;
  ancho=0;
  punto=255;
}
