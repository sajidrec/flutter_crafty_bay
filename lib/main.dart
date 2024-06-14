import 'package:crafty_bay/app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CraftyBay());
}

// APP ARCHITECTURE
// 1. Layer First
// 2. Feature First - More Optimized

// Feature-name -> data, controller, presentation

/* TODO:
assignment assigned in class time
1. (done) countdown timer in otp verification screen
2. (done) read profile screen to complete profile screen(or home screen) navigation process:
   a. If success, then call another api named "readProfile". Create Read profile controller
   b. check if data is "null" or not,
   if null then move to the Complete profile screen, then move to home page. Create complete profile controller
   c. Otherwise back to the home page

Complete the full project including-
Assignment(*):
1. Review list -> (done)
2. create review -> (done)
3. delete cart -> (done)
4. delete wishlist -> (done)
5. complete profile -> (done)
*/
