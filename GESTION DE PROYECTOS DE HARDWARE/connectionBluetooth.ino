#include <SoftwareSerial.h>
#define RX 3
#define TX 1

const int LEDR = D4;
const int LEDV = D5;

const char serialRead, portSerialRead;

SoftwareSerial serial(RX, TX); // RX, TX

void setup() {
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }
  pinMode(LEDR, OUTPUT);
  pinMode(LEDV, OUTPUT);

  digitalWrite(LEDR, LOW);
  digitalWrite(LEDV, LOW);

  Serial.println("Holiiiiiiis");
  serial.begin(9600);
  serial.println("Conectando blue.....");
}

void loop() { // run over and over
  switch(serial.available()){
    case "on":
      onMotor();
      break;
    case "off":
      offMotor();
      break;
  }
}

void onMotor(){
  digitalWrite(LEDV, HIGH);
}
void offMotor(){
  digitalWrite(LEDR, HIGH);
}
