#include <Adafruit_NeoPixel.h>
#include <SoftwareSerial.h>

// Define los pines y el número de LEDs en cada tira
#define LED_PIN_2 2
#define NUM_LEDS_2 13

#define LED_PIN_3 3
#define NUM_LEDS_3 13

#define LED_PIN_4 4
#define NUM_LEDS_4 14

#define LED_PIN_5 5
#define NUM_LEDS_5 2

#define LED_PIN_6 6
#define NUM_LEDS_6 2

#define LED_PIN_8 8
#define NUM_LEDS_8 2

// Define los pines para el módulo Bluetooth
#define BLUETOOTH_RX 9  
#define BLUETOOTH_TX 10

// Define los efectos o patrones de iluminación
enum Effect {
  SOLID,
  SOLID_2,
  WAVE,
  GRADIENT
};

// Crea objetos para cada una de las tiras de LEDs
Adafruit_NeoPixel strip2 = Adafruit_NeoPixel(NUM_LEDS_2, LED_PIN_2, NEO_GRB + NEO_KHZ800);
Adafruit_NeoPixel strip3 = Adafruit_NeoPixel(NUM_LEDS_3, LED_PIN_3, NEO_GRB + NEO_KHZ800);
Adafruit_NeoPixel strip4 = Adafruit_NeoPixel(NUM_LEDS_4, LED_PIN_4, NEO_GRB + NEO_KHZ800);
Adafruit_NeoPixel strip5 = Adafruit_NeoPixel(NUM_LEDS_5, LED_PIN_5, NEO_GRB + NEO_KHZ800);
Adafruit_NeoPixel strip6 = Adafruit_NeoPixel(NUM_LEDS_6, LED_PIN_6, NEO_GRB + NEO_KHZ800);
Adafruit_NeoPixel strip8 = Adafruit_NeoPixel(NUM_LEDS_8, LED_PIN_8, NEO_GRB + NEO_KHZ800);

// Crea un objeto para el módulo Bluetooth
SoftwareSerial bluetooth(BLUETOOTH_RX, BLUETOOTH_TX);

void setup() {
  // Inicia cada una de las tiras de LEDs
  strip2.begin();
  strip3.begin();
  strip4.begin();
  strip5.begin();
  strip6.begin();
  strip8.begin();

  // Inicializa todos los LEDs a 'apagado'
  strip2.show();
  strip3.show();
  strip4.show();
  strip5.show();
  strip6.show();
  strip8.show();

  // Inicializa todos los LEDs a 'apagado'
  turnOffAll();

  // Inicia la comunicación con el módulo Bluetooth
  bluetooth.begin(9600);

  // Imprime mensaje inicial
  Serial.begin(9600);
}

void loop() {
  // Verifica si se ha recibido algún dato desde el módulo Bluetooth
  if (bluetooth.available()) {
    char receivedChar = bluetooth.read();
    displayCombination(receivedChar);
  }
}

// Función para mostrar una combinación de color y patrón según el carácter recibido
void displayCombination(char combination) {
  switch (combination) {
    case 'a':
      setCombination(139, 69, 19, 34, 139, 34, 218, 165, 32, SOLID_2); // Otoño Frío 1
      break;
    case 'b':
      setCombination(128, 0, 0, 0, 128, 0, 128, 128, 0, WAVE); // Otoño Frío 2
      break;
    case 'c':
      setCombination(255, 0, 0, 0, 255, 0, 0, 0, 255, GRADIENT); // Otoño Frío 3
      break;
    case 'd':
      setCombination(0, 0, 255, 139, 0, 139, 0, 255, 255, SOLID_2); // Invierno Frío 1
      break;
    case 'e':
      setCombination(0, 128, 128, 128, 0, 128, 255, 0, 0, WAVE); // Invierno Frío 2
      break;
    case 'f':
      setCombination(0, 255, 255, 255, 0, 0, 0, 255, 0, GRADIENT); // Invierno Frío 3
      break;
    case 'g':
      setCombination(255, 160, 122, 32, 178, 170, 250, 128, 114, SOLID_2); // Verano Cálido 1
      break;
    case 'h':
      setCombination(240, 128, 128, 255, 99, 71, 255, 140, 0, WAVE); // Verano Cálido 2
      break;
    case 'i':
      setCombination(255, 182, 193, 255, 222, 173, 255, 69, 0, GRADIENT); // Verano Cálido 3
      break;
    case 'j':
      setCombination(255, 255, 0, 154, 205, 50, 255, 20, 147, SOLID_2); // Primavera Cálido 1
      break;
    case 'k':
      setCombination(124, 252, 0, 32, 178, 170, 255, 105, 180, WAVE); // Primavera Cálido 2
      break;
    case 'l':
      setCombination(255, 250, 205, 173, 216, 230, 255, 228, 196, GRADIENT); // Primavera Cálido 3
      break;
    case 'p':
      turnOffAll();
      break;
    default:
      break;
  }
}

// Función para establecer una combinación de colores y un efecto para las tiras de LEDs
void setCombination(uint8_t r1, uint8_t g1, uint8_t b1, uint8_t r2, uint8_t g2, uint8_t b2, uint8_t r3, uint8_t g3, uint8_t b3, Effect effect) {
  setColor(strip5, NUM_LEDS_5, r1, g1, b1);
  setEffect(strip5, NUM_LEDS_5, effect);
  
  setColor(strip6, NUM_LEDS_6, r2, g2, b2);
  setEffect(strip6, NUM_LEDS_6, effect);
  
  setColor(strip8, NUM_LEDS_8, r3, g3, b3);
  setEffect(strip8, NUM_LEDS_8, effect);
  
  setColorIntercalated(strip2, NUM_LEDS_2, r1, g1, b1);
  setEffect(strip2, NUM_LEDS_2, effect);
  
  setColorIntercalated(strip4, NUM_LEDS_4, r2, g2, b2);
  setEffect(strip4, NUM_LEDS_4, effect);
  
  setColorIntercalated(strip3, NUM_LEDS_3, r3, g3, b3);
  setEffect(strip3, NUM_LEDS_3, effect);
}

// Función para establecer el color de una tira de LEDs
void setColor(Adafruit_NeoPixel &strip, int num_leds, uint8_t red, uint8_t green, uint8_t blue) {
  for (int i = 0; i < num_leds; i++) {
    strip.setPixelColor(i, strip.Color(red, green, blue));
  }
  strip.show();
}

// Función para establecer el color intercalado de una tira de LEDs
void setColorIntercalated(Adafruit_NeoPixel &strip, int num_leds, uint8_t red, uint8_t green, uint8_t blue) {
  for (int i = 0; i < num_leds; i++) {
    if (i % 2 == 0) {
      strip.setPixelColor(i, strip.Color(red, green, blue));
    } else {
      strip.setPixelColor(i, strip.Color(0, 0, 0)); // LED apagado
    }
  }
  strip.show();
}

// Función para aplicar un efecto o patrón a una tira de LEDs
void setEffect(Adafruit_NeoPixel &strip, int num_leds, Effect effect) {
  switch (effect) {
    case SOLID_2:
      solid2(strip, num_leds);
      break;
    case WAVE:
      wave(strip, num_leds);
      break;
    case GRADIENT:
      gradient(strip, num_leds);
      break;
  }
}

// Función para el efecto SOLID_2 (color intercalado cada 2 LEDs)
void solid2(Adafruit_NeoPixel &strip, int num_leds) {
  // Esta función ya se maneja con setColorIntercalated, por lo que no necesita lógica adicional aquí.
}

// Función para el efecto de onda (wave)
void wave(Adafruit_NeoPixel &strip, int num_leds) {
  for (int j = 0; j < 256; j++) {
    for (int i = 0; i < num_leds; i++) {
      strip.setPixelColor(i, Wheel((i * 256 / num_leds + j) & 255));
    }
    strip.show();
    delay(20);
  }
}

// Función para el efecto de gradiente (gradient)
void gradient(Adafruit_NeoPixel &strip, int num_leds) {
  for (int i = 0; i < num_leds; i++) {
    strip.setPixelColor(i, Wheel(i * 256 / num_leds));
  }
  strip.show();
}

// Función para generar colores en rueda
uint32_t Wheel(byte WheelPos) {
  WheelPos = 255 - WheelPos;
  if (WheelPos < 85) {
    return strip2.Color(255 - WheelPos * 3, 0, WheelPos * 3);
  } else if (WheelPos < 170) {
    WheelPos -= 85;
    return strip2.Color(0, WheelPos * 3, 255 - WheelPos * 3);
  } else {
    WheelPos -= 170;
    return strip2.Color(WheelPos * 3, 255 - WheelPos * 3, 0);
  }
}

// Función para apagar todos los LEDs
void turnOffAll() {
  for (int i = 0; i < NUM_LEDS_2; i++) {
    strip2.setPixelColor(i, 0);
  }
  strip2.show();

  for (int i = 0; i < NUM_LEDS_3; i++) {
    strip3.setPixelColor(i, 0);
  }
  strip3.show();

  for (int i = 0; i < NUM_LEDS_4; i++) {
    strip4.setPixelColor(i, 0);
  }
  strip4.show();

  for (int i = 0; i < NUM_LEDS_5; i++) {
    strip5.setPixelColor(i, 0);
  }
  strip5.show();

  for (int i = 0; i < NUM_LEDS_6; i++) {
    strip6.setPixelColor(i, 0);
  }
  strip6.show();

  for (int i = 0; i < NUM_LEDS_8; i++) {
    strip8.setPixelColor(i, 0);
  }
  strip8.show();
}
