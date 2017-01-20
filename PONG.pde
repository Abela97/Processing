//PONG
//Ángel Luis Abela Fernández

int pantalla=0;
PFont NanumMyeongjo;

float ballPosX = 250; // posición pelota en eje x
float ballPosY = 250; // posición pelota en eje y
float ball_VelX = 4; // velocidad pelota en eje x
float ball_VelY = 8; // velocidad pelota en eje y
float ballRadio=12;

// Variables paleta
float posPalaX = width/2;
float posPalaY = 650;
float ancho_pala = 150;
float altura_pala = 25;

float difposx;


void setup() {
  size(700, 700);
  NanumMyeongjo = createFont("NanumMyeongjo", 10, true); //Fuente de letras
}


void draw() {


  // Cambio de pantalla
  switch (pantalla) {
  case 0:
    menu();
    break;
  case 1:
    juego();
    break;
  }
}

void menu () { 
  textFont(NanumMyeongjo, height/4);  //FUENTE DE TEXTO            
  fill(60);
  textAlign(CENTER); 
  text("ABEPONG", width/2, height/4); //Dibujamos string
  textFont(NanumMyeongjo, height/6); 
  fill(150, 150, 80);
  text("Play Game", width/2, height/2 + height/6 - height/50);
  textFont(NanumMyeongjo, 16); 
  fill(22, 45, 0);
  textAlign(RIGHT);
  text("Angel Luis Abela", width-20, height-15);
}


void rebote() {

  // Declaración variable difpox
  difposx=ballPosX-posPalaX-50;

  // REBOTE CON BORDES

  if (ballPosX > width-ballRadio || ballPosX < 0) { 
    ball_VelX = ball_VelX*-1;
  }
  if (ballPosY > width-ballRadio || ballPosY < 0) { 
    ball_VelY = ball_VelY*-1;
  }
  if (ballPosY >= height-10) {
    ball_VelY = ball_VelY*0;
    ball_VelX = ball_VelX*0;
  }
  // REBOTE BOLA-PALA
  if (difposx<=50 && difposx>=(-50)&& ballPosY>=450-19 && ballPosY>=posPalaY) {
    ball_VelY=ball_VelY*(-1);
  }
}

void pala() {
  // DIBUJO PALA
  stroke(0);
  strokeWeight(1);
  fill(ballPosX*255/width);
  rect (posPalaX, posPalaY, ancho_pala, altura_pala);

  // MOVIMIENTO PALA
  posPalaX=mouseX-50;
}
void bola() {

  // DIBUJO BOLA
  stroke(0);
  strokeWeight(1);
  fill(250, 0, 0);
  ellipse(ballPosX, ballPosY, ballRadio*2, ballRadio*2);

  // MOVIMIENTO BOLA
  ballPosX = ball_VelX + ballPosX; 
  ballPosY= ball_VelY +ballPosY;

void juego() {
    bola();
    pala();
  }
}
