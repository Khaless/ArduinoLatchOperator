#include <Servo.h> 

/*
 * Objects represent our servos (latches)
 */
Servo left_servo;  
Servo right_servo;  

/*
 * The Appropriate values to open and close our
 * servos (latches)
 */
const int LEFT_OPEN_ANGLE = 30;
const int LEFT_CLOSE_ANGLE = 140; 
const int RIGHT_OPEN_ANGLE = 120;
const int RIGHT_CLOSE_ANGLE = 0; 

/*
 * This is initialised as 1 because the first state read
 * from it will be (state ^= 1) = 0
 * and we want our first state to be closed
 */
int state = 1; 

void setup() { 
  
  left_servo.attach(11); 
  right_servo.attach(12); 
  
  /* Close latch explicitly on setup */
  close_latches();
  
} 

/*
 * OPEN and CLOSE latch functions
 * We open/close the left latch first followed by
 * the right latch a short time after
 * to reduce the overall load on our
 * architecture. It turns out, scotty
 * needs more power if we operate both latches
 * in sync.
 */
void open_latches() {
  left_servo.write(LEFT_OPEN_ANGLE);
  delay(250);
  right_servo.write(RIGHT_OPEN_ANGLE);
}

void close_latches() {
  left_servo.write(LEFT_CLOSE_ANGLE);
  delay(250);
  right_servo.write(RIGHT_CLOSE_ANGLE);
}

/* Out loop just sits there and open and closes every 5 seconds...
void loop() {   
  (state ^= 1) ? open_latches() : close_latches();
  delay(5000);
} 
