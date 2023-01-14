#include <ESP8266WiFi.h>

const char* ssid= "TOLEDO_CNT";
const char* pass = "BRCGS2021*";
WiFiClient client;

//FORMA LOCAL
//const char* host = "192.168.137.2"; //IP DE SU COMPUTADORA SERVIDOR
//const int   port = 8081; //PUERTO DE SU COMPUTADORA (DEPENDE DEL XAMPP)
//FORMA WEB
const char* host = "www.paginaweb.com"; 
const int   port = 80;

const int watchdog = 5000;        
unsigned long previousMillis = millis(); 

//VARIABLES PARA OBTENER DE LA BASE DE DATOS
String var="1";
String texto="";

//LEDS PARA ENCENDER Y APAGAR
const int rele = D4;

void setup() {
  Serial.begin(9600);
  Serial.println();
  Serial.println();
  Serial.print("Connectando a: ");
  Serial.println(ssid);

  WiFi.begin(ssid, pass);

  while(WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("Conexion exitosa");
  Serial.println("Dirección IP: ");
  Serial.println(WiFi.localIP());

  pinMode(rele, OUTPUT);

}

void loop() {
  Serial.print("Conectando a ");
  Serial.println(host);

  unsigned long currentMillis = millis();
    
  if ( currentMillis - previousMillis > watchdog ) {
    previousMillis = currentMillis;
 
    if (!client.connect(host, port)) {
      Serial.println("Fallo al conectar");
      return;
    }

    //LOCAL
    String url = "/hardware10b/arduino/php_funciones_obtener5.php";
    //WEB
    //String url = "/ardu/revisar_led.php";
    Serial.println(url);
    
    // Enviamos petición al servidor
    client.print(String("GET ") + url + " HTTP/1.1\r\n" +
               "Host: " + host + "\r\n" + 
               "Connection: close\r\n\r\n");
   
    
    unsigned long timeout = millis();
    while (client.available() == 0) {
      if (millis() - timeout > 5000) {
        Serial.println(">>> Client Timeout !");
        client.stop();
        return;
      }
    }


    //RECEPCION DE DATOS DE BASE DE DATOS
    String line = "";
    String linetmp = "";
    // Leemos la respuesta del servidor
    while(client.available()){
      linetmp = client.readStringUntil('\r');
      Serial.print(line);
      if(linetmp.length()>4) {//SI TIENE MAS DE 4 CARACTERES
          line = linetmp;
      }
    }
    var = line.substring(5,6);
    // variable2 = line.substring(7,8);
    // variable3 = line.substring(9,10);    
    
    Serial.print("VARIABLE: ");
    Serial.println(var);

    //DESPUES DE LA LECTURA HACE LA ACCION

    // VARIABLE 1
    if (var == "1"){
      digitalWrite(rele, LOW);
    }else{
      digitalWrite(rele, HIGH);
    }
        
  }

  delay(5000);

      
}
