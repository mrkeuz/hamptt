void(* reset) (void) = 0; //Reset function

#include "BluetoothSerial.h" 

BluetoothSerial ESP_BT; 

const int LED_PIN = 2;
const int TX_PIN = 15;

unsigned long currentMillis = 0;
unsigned long previousMillis = 0;
const long restBlinkInterval = 1000;

long runSign = random(0, 2147483646L);


// the setup routine runs once when you press reset:
void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
  ESP_BT.begin("Baofeng PTT 1");

  pinMode(TX_PIN, OUTPUT);
  pinMode(LED_PIN, OUTPUT);

  digitalWrite(TX_PIN, LOW);
  digitalWrite(LED_PIN, LOW);
}

// the loop routine runs over and over again forever:
void loop() {

  blinkTik();

  if (ESP_BT.available()) {

    readBlink();

    // read byte
    char incomingByte = toupper(ESP_BT.read());

    switch (incomingByte) {
      case 'T':
        ESP_BT.print("TX");
        digitalWrite(TX_PIN, HIGH);
        break;

      case 'C':
        ESP_BT.print("WORK");
        break;

      case 'L':
        //noop
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
        ESP_BT.println("  \"L\" - keepalive package");
        break;

      default:
        ESP_BT.print("RX");
        digitalWrite(TX_PIN, LOW);
    }
  }
}

void readBlink() {
  currentMillis = millis();
  digitalToggle(LED_PIN);
}

void blinkTik() {

  currentMillis = millis();

  if (currentMillis - previousMillis >= restBlinkInterval) {
    // save the last time you blinked the LED
    previousMillis = currentMillis;

    digitalToggle(LED_PIN);
  }

}

inline void digitalToggle(byte pin) {
  digitalWrite(pin, !digitalRead(pin));
}
