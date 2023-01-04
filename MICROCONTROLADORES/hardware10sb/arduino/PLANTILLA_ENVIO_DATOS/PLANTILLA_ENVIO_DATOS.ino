#include <ESP8266WiFi.h>
#include <DHT.h>


//conexion a red WiFi
const char* ssid= "RED_ARDUINO";
const char* pass = "aula10b84";

//FORMA LOCAL
const char* host = "192.168.137.2"; //IP DE SU COMPUTADORA SERVIDOR
const int   port = 8081; //PUERTO DE SU COMPUTADORA (DEPENDE DEL XAMPP)

//FORMA WEB
//const char* host = "www.paginaweb.com"; 
//const int   port = 80;

const int   watchdog = 5000;  
      
unsigned long previousMillis = millis(); 
float temperatura;
float humedad;
#define DHTPIN D0
#define DHTTYPE DHT11
DHT dht(DHTPIN, DHTTYPE);

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

  
  
}

void loop() {
       
       Serial.print("Conectando a ");
       Serial.println(host);

       unsigned long currentMillis = millis();

//CONEXION AL WIFI    
  if (currentMillis - previousMillis > watchdog ) {
    previousMillis = currentMillis;
    WiFiClient client;
  
    if (!client.connect(host, port)) {
      Serial.println("Fallo al conectar");
      return;
    }

//LECTURA DE UN SENSOR:
    temperatura = dht.readTemperature();
    humedad = dht.readHumidity();
    Serial.print("Temperatura: "); Serial.println(temperatura);
    Serial.print("Humedad"); Serial.println(humedad);
    String temp = String(temperatura);
    String hum = String(humedad);
//FIN DE LA LECTURA



//ENVIO DE DATOS A UNA PAGINA WEB    

    //LOCAL
    String url = "/hardware10b/arduino/php_funciones_insertar5.php?valor=" + temp + "&hum="+ hum;
    //WEB
    //String url = "/sens_temp/temperatura.php?valor=" + tempera + "&valor_h="+ humed;
    Serial.println(url);

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

     // Leemos la respuesta del servidor
    while(client.available()){
      String line = client.readStringUntil('\r');
      Serial.println(line);
    }
//FIN DE ENVIO DE DATOS
    
  }
  
  delay(5000);
       
}
