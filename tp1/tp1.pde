PImage img;

void setup(){
size(800,400);
img=loadImage("bici.png");
}
void draw(){
background(50,93,197);
image(img,0,0,400,400);
translate(400,0);
//fondo
fill(95,222,255);
noStroke();
rect(340,0,60,124);
fill(31,194,253);
quad(398,0,331,218,0,350,0,0);

fill(174,242,253);
beginShape();
vertex(331,218);
vertex(400,277);
vertex(400,400);
vertex(0,400);
vertex(0,347);
endShape();

//sombras
fill(30,160,243);
stroke(30,160,243);
strokeWeight(5);
quad(232,300,209,180,170,170,117,288);
beginShape();
vertex(78,362);
vertex(46,223);
vertex(9,205);
vertex(0,215);
vertex(0,350);
vertex(78,362);
endShape();

triangle(139,129,174,105,208,141);
triangle(73,86,94,64,100,97);

line(75,86,30,135);
line(30,135,0,111);
line(30,135,34,219);
line(31,155,171,138);
line(31,155,68,190);
line(171,138,137,212);
line(171,138,190,175);
//piso
strokeWeight(1);
stroke(0);
strokeWeight(1);
line(332,218,0,347);
line(346,232,37,400);
line(360,242,169,400);
line(372,252,257,400);
line(389,266,323,400);
line(400,314,380,400);

//triangulos
strokeWeight(3);
fill(0);
stroke(0);
triangle(30,30,53,57,23,61);
triangle(143,45,172,28,170,57);
triangle(203,94,246,69,254,104);
//ruedas
fill(22,141,209);
stroke(0);
beginShape();
vertex(223,156);
vertex(303,163);
vertex(293,273);
vertex(233,298);
vertex(183,222);
vertex(223,156);
endShape();

beginShape();
vertex(77,179);
vertex(147,221);
vertex(146,314);
vertex(78,360);
vertex(26,256);
vertex(77,179);
endShape();

fill(0);
beginShape();
vertex(182,193);
vertex(200,214);
vertex(199,238);
vertex(183,247);
vertex(159,236);
vertex(161,205);
vertex(182,193);
endShape();

beginShape();
vertex(246,199);
vertex(270,209);
vertex(265,234);
vertex(247,238);
vertex(236,222);
vertex(246,199);
endShape();

quad(92,255,99,262,92,271,87,265);
//lineas bici
line(53,57,100,99);
line(100,99,143,45);
line(100,99,93,263);
line(101,122,220,114);
line(101,122,176,222);
line(176,222,226,99);
line(220,114,253,219);
line(220,114,227,154);
line(179,221,255,222);
line(246,199,182,193);
line(247,238,183,247);

}
