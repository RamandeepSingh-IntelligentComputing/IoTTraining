
#include <WiFi.h>
#include <PubSubClient.h>
#include<Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BME280.h>

Adafruit_BME280 bme;

char ssid[] = "Rmn";                                 // Change this to your network SSID (name).
char pass[] = "singh1313";                                // Change this to your network password.
const char* server = "mqtt.thingspeak.com";
char mqttUserName[] = "IoTCoach";                // Use any name.
char mqttPass[] = "BG2NVIFUUSRAVW2L";                 // Change to your MQTT API key from Account > MyProfile.

//Read Key is for IoTCoachControl to keep I/O separate
long readChannelID = 1384754;
char readAPIKey[]= "GLQOFT91Q18HV6QU";//"7L0UD3VX5GSEUQFA";

//Write Key is for IoTCoach 
long writeChannelID=1296076;
char writeAPIKey[]   = "T1ECHF0AA1EYFQH2";

String clientName = "#$3@e1&8$q!3$%#RamandeepSingh";

WiFiClient client;                                    // Initialize the Wi-Fi client library.
PubSubClient mqttClient( client );      

// Handle messages from MQTT subscription.
int mqttSubscriptionCallback(char* topic, byte* payload, unsigned int length);  

// Generate a unique client ID and connect to MQTT broker.
void mqttConnect();  

// Subscribe to a field or feed from a ThingSpeak channel.
int mqttSubscribe( long subChannelID,int field,char* readKey, int unSub);

// Publish messages to a channel feed.
void mqttPublish(long pubChannelID, char* pubWriteAPIKey, float dataArray[], int fieldArray[]);

// Connect to a given Wi-Fi SSID
int connectWifi();

bool ledStatus = false;
int onBoardLed = 2;
bool updateStatus = false;

String UsrCmd = "";
volatile bool cmdReceived = false;
volatile int UsrCmdValue=0;

void setup() {
  Serial.begin(115200);
  pinMode(onBoardLed,OUTPUT);
   
  connectWifi();
  mqttClient.setServer(server,1883);
  mqttClient.setCallback( mqttSubscriptionCallback);
  
}

void loop() {
  
   if (WiFi.status() != WL_CONNECTED) {
        connectWifi();
    }

    if (mqttClient.state() != 0)
    {     
      mqttConnect(); // Connect if MQTT client is not connected.
      
     if(mqttSubscribe( readChannelID,1,readAPIKey,0 )==1 ){
            Serial.println( " Subscribed " );
        }
    }
    
    mqttClient.loop(); // Call the loop to maintain connection to the server.                         
    digitalWrite(onBoardLed,ledStatus);

    if(updateStatus){
      updateStatus = false;
      if(UsrCmd.startsWith("LED"))
      {
        ledStatus = UsrCmdValue;
        Serial.print("ledStatus = ");
        Serial.println(ledStatus);
      }
    }
}

/**
 * Process messages received from subscribed channel via MQTT broker.
 *   topic - Subscription topic for message.
 *   payload - Field to subscribe to. Value 0 means subscribe to all fields.
 *   mesLength - Message length.
 */
 
int mqttSubscriptionCallback( char* topic, byte* payload, unsigned int mesLength ) {

    //int CmdValue =0;
    Serial.println("Subscription Callback Initiated");
    char p[mesLength + 1];
    memcpy( p, payload, mesLength );
    p[mesLength] = NULL;
    Serial.print("Received Msg ");
    Serial.println(p);   
    
    Serial.print( "Topic: " );
    Serial.println( String(topic) );
    Serial.print( "Answer: " );  
    UsrCmd = String(p);
    UsrCmd.replace("'","");
    Serial.println( UsrCmd );
    
    UsrCmdValue = atoi(p);
    //Serial.print("UsrCmdValue: ");
    //Serial.println(UsrCmdValue);
    updateStatus = true;
}

void mqttConnect()
{
    char clientID[ 9 ];
    
    // Loop until connected.
    while ( !mqttClient.connected() )
    {
       
        // Connect to the MQTT broker.
        Serial.print( "Attempting MQTT connection..." );
        if ( mqttClient.connect( (char*) clientName.c_str(), mqttUserName, mqttPass ) )
        {
            Serial.println( "Connected with Client ID:  " + String( clientName ) + " User "+ String( mqttUserName ) + " Pwd "+String( mqttPass ) );
           
        } else
        {
            Serial.print( "failed, rc = " );
            // See https://pubsubclient.knolleary.net/api.html#state for the failure code explanation.
            Serial.print( mqttClient.state() );
            Serial.println( " Will try again in 5 seconds" );
            delay( 5000 );
        }
    }
}

/**
 * Subscribe to fields of a channel.
 *   subChannelID - Channel to subscribe to.
 *   field - Field to subscribe to. Value 0 means subscribe to all fields.
 *   readKey - Read API key for the subscribe channel.
 *   unSub - Set to 1 for unsubscribe.
 */
 
int mqttSubscribe( long subChannelID, int field, char* readKey, int unsubSub ){
    String myTopic;
    
    // There is no field zero, so if field 0 is sent to subscribe to, then subscribe to the whole channel feed.
    if (field==0){
        myTopic="channels/"+String( subChannelID )+"/subscribe/json/"+String( readKey );
    }
    else{
        myTopic="channels/"+String( subChannelID )+"/subscribe/fields/field"+String( field )+"/"+String( readKey );
    }
    
    Serial.println( "Subscribing to " +myTopic );
    Serial.println( "State= " + String( mqttClient.state() ) );

    if ( unsubSub==1 ){
        return mqttClient.unsubscribe(myTopic.c_str());
    }
    return mqttClient.subscribe( myTopic.c_str() ,0 );    
}

/**
 * Unsubscribe channel
 *   subChannelID - Channel to unsubscribe from.
 *   field - Field to unsubscribe subscribe from. The value 0 means subscribe to all fields.
 *   readKey - Read API key for the subscribe channel.
 */

int mqttUnSubscribe(long subChannelID,int field,char* readKey){
    String myTopic;
    
    if (field==0){
        myTopic="channels/"+String( subChannelID )+"/subscribe/json/"+String( readKey );
    }
    else{
        myTopic="channels/"+String( subChannelID )+"/subscribe/fields/field"+String( field )+"/"+String( readKey );
    }
    return mqttClient.unsubscribe( myTopic.c_str() );   
}

int connectWifi()
{
    
    while ( WiFi.status() != WL_CONNECTED ) {
        WiFi.begin( ssid, pass );
        delay( 2500 );
        Serial.println( "Connecting to Wi-Fi" ); 
    }
    Serial.println( "Connected" );
}
