
#include <Timer.h>
#include "WSNProject.h"

configuration WSNProjectAppC {
}
implementation {
  components MainC;
  components LedsC;
  components WSNProjectC as App;
  components new TimerMilliC() as Timer0;
  //components new TimerMilliC() as Timer1;
  components ActiveMessageC;
  components new AMSenderC(AM_BLINKTORADIO);
  components new AMReceiverC(AM_BLINKTORADIO);
  components RandomC;
  components new QueueC(QueueEntry, MAX_QUEUE_SIZE) as Queue;
  

  App.Boot -> MainC;
  App.Timer0 -> Timer0;
  //App.Timer1 -> Timer1;
  App.Packet -> AMSenderC;
  App.AMPacket -> AMSenderC;
  App.AMControl -> ActiveMessageC;
  App.AMSend -> AMSenderC;
  App.Receive -> AMReceiverC;
  App.PacketAcknowledgements -> ActiveMessageC;
  App.Random -> RandomC;
  App.msgQueue -> Queue;
}
