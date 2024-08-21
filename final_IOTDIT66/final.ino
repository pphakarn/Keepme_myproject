#include <OneWire.h>
#include <DallasTemperature.h>
#include <ESP8266WiFi.h>
#include <ESP8266WiFiMulti.h>

#define BLYNK_PRINT Serial

#define BLYNK_TEMPLATE_ID "TMPL6rFS6a6EI"
#define BLYNK_TEMPLATE_NAME "projece"
#define BLYNK_AUTH_TOKEN "YtP1lVZxlpMw2NLxNttreym1ozwXCGVq"
#include <BlynkSimpleEsp8266.h>
#define ONE_WIRE_BUS D4 // กำหนดขาที่จะเชื่อมต่อ Sensor

OneWire oneWire(ONE_WIRE_BUS);
DallasTemperature sensors(&oneWire);

#define SSID_1    "pphakarn"
#define PASS_1    "pphakarn02"
#define LINE_TOKEN "eFEoj7Zl0jWDOWyBXG9JuwTfERKY3Py0SFuRY63TuLK"

ESP8266WiFiMulti WiFiMulti;

const int Relay1 = D1;
float temp = 0;
bool notifiedHigh = false;
bool notifiedNormal = false;
int ss = 0;

void setup() {
  Serial.begin(115200);
  Blynk.begin(BLYNK_AUTH_TOKEN, SSID_1, PASS_1); // ใช้ค่า SSID และ Password ที่กำหนดไว้
  pinMode(Relay1, OUTPUT);
  WiFiMulti.addAP(SSID_1, PASS_1);
  WiFiMulti.addAP("AndroidAP", "ifmd0883");
  sensors.begin();
}

void loop() {
  Blynk.run();
  CheckWiFi();
  chktemp();
  reley(); // เรียกใช้ฟังก์ชัน reley เพื่อควบคุม Relay ตามอุณหภูมิ
  updateLabel(); // อัปเดต Label Widget
}

void chktemp() {
  sensors.requestTemperatures();
  temp = sensors.getTempCByIndex(0);
  Serial.print("Temperature is: ");
  Serial.print(temp);
  Serial.println(" *C");
}

void CheckWiFi() {
  if (WiFiMulti.run() != WL_CONNECTED) {
    Serial.println("WiFi not connected!");
    delay(1000);
  }
}

void LINE_Notify(String Message) {
  axTLS::WiFiClientSecure client;

  if (!client.connect("notify-api.line.me", 443)) {
    Serial.println("Connection failed");
    return;
  }

  String req = "";
  req += "POST /api/notify HTTP/1.1\r\n";
  req += "Host: notify-api.line.me\r\n";
  req += "Authorization: Bearer " + LINE_TOKEN + "\r\n";
  req += "Cache-Control: no-cache\r\n";
  req += "User-Agent: ESP8266\r\n";
  req += "Content-Type: application/x-www-form-urlencoded\r\n";
  req += "Content-Length: " + String(String("message=" + Message).length()) + "\r\n";
  req += "\r\n";
  req += "message=" + Message;

  client.print(req);
  delay(20);

  while (client.connected()) {
    String line = client.readStringUntil('\n');
    if (line == "\r") {
      break;
    }
  }
  Serial.println("Send Successfully");
}

void reley() {
  if (temp >= 23 && temp <= 27) {
    digitalWrite(Relay1, (ss == 1) ? HIGH : LOW); // ใช้ค่า ss เพื่อควบคุมรีเลย์
    if (!notifiedNormal) {
      LINE_Notify("Temp: " + String(temp) + "\nclose_sensors");
      notifiedNormal = true;
    }
    if (notifiedHigh) {
      notifiedHigh = false;
    }
  } else if (temp > 27) {
    digitalWrite(Relay1, (ss == 1) ? HIGH : LOW); // ใช้ค่า ss เพื่อควบคุมรีเลย์
    if (!notifiedHigh) {
      LINE_Notify("Temp: " + String(temp) + "\nOpen_sensors");
      notifiedHigh = true;
    }
    if (notifiedNormal) {
      notifiedNormal = false;
    }
  }
}

BLYNK_WRITE(V0) {
  ss = param.asInt(); // อ่านค่าจาก Blynk (0 หรือ 1)
  Serial.println(ss);
  aa();
}

void aa() {
  digitalWrite(Relay1, (ss == 1) ? HIGH : LOW); // ใช้ค่า ss เพื่อควบคุมรีเลย์
}

void updateLabel() {
  Blynk.virtualWrite(V1, "Temperature: " + String(temp) + " *C"); // ส่งค่าอุณหภูมิไปยัง Label Widget
}
