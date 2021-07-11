void(* reset) (void) = 0; //Reset function

#include "BluetoothSerial.h" 

BluetoothSerial ESP_BT; 

const int LED_PIN = 2;
const int TX_PIN = 25;

unsigned long currentMillis = 0;
unsigned long previousMillis = 0;
unsigned long lastTxMillis = 0;
unsigned long lastCommandMillis = 0;
boolean tx = false;

const long txTimeout = 15000;
const long commandTimeout = 60000;


long runSign = random(0, 2147483646L);

void blinkTik();
void singleBlink();
void blinkTik();
void stopTx();
void startTx();

// the setup routine runs once when you press reset:
void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(115200);
  ESP_BT.begin("Baofeng PTT 1");

  pinMode(TX_PIN, OUTPUT);
  pinMode(LED_PIN, OUTPUT);

  digitalWrite(TX_PIN, LOW);
  digitalWrite(LED_PIN, LOW);

  Serial.println("Starting...");
}

// the loop routine runs over and over again forever:
void loop() {
  
  //Check hang bt or other problems
  if(tx && millis() > lastTxMillis + txTimeout){
      Serial.println("TX seems hang. Rebooting...");
      stopTx();
      reset();
  }

  //Check BT stack hang
  if(millis() > lastCommandMillis + commandTimeout){
      Serial.println("Timeout. No input commands. Seems BT hang. Rebooting...");
      stopTx();
      reset();
  }

  blinkTik();

  if (ESP_BT.available()) {

    lastCommandMillis = millis();

    singleBlink();

    // read byte
    char incomingByte = toupper(ESP_BT.read());

    switch (incomingByte) {
      case 'T':
        startTx();
        break;

      case 'C':
        ESP_BT.print("WORK");
        break;

      case 'S':
        ESP_BT.print("Run sign: ");
        ESP_BT.println(runSign);
        break;

      case 'K':
        ESP_BT.print("Reboot");
        reset();
        break;

      case 'H':
        ESP_BT.println("Commands: ");
        ESP_BT.println("  \"T\" - transmit (PTT ON)");
        ESP_BT.println("  \"R or any char\" - receive (PTT OFF)");
        ESP_BT.println("  \"C\" - check, print 'WORK' string");
        ESP_BT.println("  \"S\" - print unique run sign number (changes when restart or reconnect)");
        ESP_BT.println("  \"K\" - restart arduino");
        break;
    }
  }
}

void startTx(){
  ESP_BT.print("TX");
  digitalWrite(TX_PIN, HIGH);
  lastTxMillis = millis();
  tx = true;
}

void stopTx(){
  ESP_BT.print("RX");
  digitalWrite(TX_PIN, LOW);
  tx = false;
}

inline void digitalToggle(byte pin) {
  digitalWrite(pin, !digitalRead(pin));
}

void singleBlink() {
  currentMillis = millis();
  digitalToggle(LED_PIN);
}

void blinkTik() {

  long restBlinkInterval;

  if (tx){
    restBlinkInterval = 25;
  } else {
    restBlinkInterval = 1000;
  }

  currentMillis = millis();

  if (currentMillis - previousMillis >= restBlinkInterval) {
    // save the last time you blinked the LED
    previousMillis = currentMillis;

    digitalToggle(LED_PIN);
  }

}


