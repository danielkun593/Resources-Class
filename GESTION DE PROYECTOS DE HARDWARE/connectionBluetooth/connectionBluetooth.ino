#include <SoftwareSerial.h>
#define RX 3
#define TX 1

const int LEDR = D4;
const int LEDV = D3;
char a;

SoftwareSerial serial(RX, TX); // RX, TX

void setup() {
  Serial.begin(9600);
  pinMode(LEDR, OUTPUT);
  pinMode(LEDV, OUTPUT);

  digitalWrite(LEDR, LOW);
  digitalWrite(LEDV, LOW);

  serial.begin(9600);
  serial.println("Conectando bluetooth...");
}

void loop() { // run over and over
  if(serial.available()){
    a = serial.read();
    if(a == '1'){
      onMotor();
    }else if(a == '2'){
      offMotor();
    }
  }else{
    Serial.println("No hay nada putito");
  }
  delay(1500);
  
  
}

void onMotor(){
  digitalWrite(LEDV, HIGH);
  Serial.println("MOTOR ENCENDIDO");
  digitalWrite(LEDR, LOW);
}
void offMotor(){
  digitalWrite(LEDR, HIGH);
  Serial.println("MOTOR APAGADO");
  digitalWrite(LEDV, LOW);
}
