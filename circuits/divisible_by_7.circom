pragma circom 2.1.4;

include "./base_10.circom";
include "./helper.circom";


template IsDivisibleBy7 (n) {
   signal input in;   
   signal a[n];
   signal b;
   signal ld1;
   signal c[n-1];
   signal prefix;
   signal mod;
   signal inv;
   // Output out will be 1 if in is divisible by 7; 0 otherwise
   signal output out;

   // Converting in into an array of digits
   component digits = Num2Digits(n);

   digits.in <== in;
   digits.out --> a;

   // Isolating the coefficient of the 1s digit to be used in the ending sum
   ld1 <-- a[0];

   // Converting the array back into a field element
   component back2num = Digits2Num(n);

   back2num.in <== a;
   back2num.out ==> b;

   // Reconverting in into an array of the first n-1 digits (excluding ld1) 
   component lastdigits = Num2FirstNMinus1(n);
   lastdigits.in <== b;
   lastdigits.out --> c;

   // Concatinating the first n-1 digits of in
   component num = Digits2Num(n-1);

   num.in <== c;
   num.out --> prefix;


   // If the sum of the last digit times 5 and the (left-right) concatination of the remaining digits is 
   // equal to 0 mod 7, then in itself is divisible by 7
   //   Ex/ in = 497: 49 + (7*5) = 49 + 35 = 84, and 84 % 7 = 0. So 497 is divisible by 7
   mod <-- ((ld1*5) + prefix) % 7;
   inv <-- mod != 0 ? 1/mod : 0;
   out <== -mod*inv + 1;
}
