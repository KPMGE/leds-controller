#include <ESP8266WiFi.h>
#include <ESP8266WebServer.h>

// SSID & Password 
const char* ssid = "NodeMCU";  
const char* password = "123456789"; 

// server is gonna listen on port 80
ESP8266WebServer server(80);

// led pins
#define RED_PIN D4
#define GREEN_PIN D5
#define BLUE_PIN D6

enum LedStates { on, off };

// led statates
enum LedStates redState = off;
enum LedStates greenState = off;
enum LedStates blueState = off;

void handle_toggle_red();
void handle_toggle_green();
void handle_toggle_blue();
void handle_on_connect();

void setup() {
  Serial.begin(9600);
  // ports for the leds
  pinMode(D4, OUTPUT); 
  pinMode(D5, OUTPUT); 
  pinMode(D6, OUTPUT); 

  WiFi.softAP(ssid, password);

  IPAddress myIP = WiFi.softAPIP();
  Serial.print("Access Point IP:");
  Serial.println(myIP);

  server.on("/", handle_on_connect);
  server.on("/toggle_red", handle_toggle_red);
  server.on("/toggle_green", handle_toggle_green);
  server.on("/toggle_blue", handle_toggle_blue);
  server.onNotFound(handle_not_found);
  
  server.begin();
  Serial.println("HTTP Server Started...");
}

void loop() {
  server.handleClient();

  (redState == on) ? digitalWrite(RED_PIN, HIGH) : digitalWrite(RED_PIN, LOW);
  (greenState == on) ? digitalWrite(GREEN_PIN, HIGH) : digitalWrite(GREEN_PIN, LOW);
  (blueState == on) ? digitalWrite(BLUE_PIN, HIGH) : digitalWrite(BLUE_PIN, LOW);
}

void handle_on_connect() {
  Serial.println("All leds off");
  server.send(200, "application/json", "done!"); 
}

void handle_not_found(){
  server.send(404, "application/json", "Not found");
}

void handle_toggle_red() {
  redState = (redState == on) ? off : on;
  (redState == on) ? Serial.println("RED LED: ON"); : Serial.println("RED LED: OFF");
  server.send(200, "application/json", "RED LED TOGGLED"); 
}

void handle_toggle_green() {
  greenState = (greenState == on) ? off : on;
  (greenState == on) ? Serial.println("GREEN LED: ON"); : Serial.println("GREEN LED: OFF");
  server.send(200, "application/json", "GREEN LED TOGGLED"); 
}

void handle_toggle_blue() {
  blueState = (blueState == on) ? off : on;
  (blueState == on) ? Serial.println("BLUE LED: ON"); : Serial.println("BLUE LED: OFF");
  server.send(200, "application/json", "BLUE LED TOGGLED"); 
}
