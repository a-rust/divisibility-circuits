pragma circom 2.1.4;

include "./base_10.circom";

template IsDivisibleBy3 (n) {
   signal input in;   
   signal a[n];
   signal mod;
   signal inv;
   // Output out will be 1 if in is divisible by 3; 0 otherwise
   signal output out;

   // Using Num2Digits in the following way:
   //    in will be the input given to Num2Digits
   //    a[m] will be the output of Num2Digits
   component digits = Num2Digits(n);
   digits.in <== in;
   digits.out --> a;

   // sum is a running total of the digits of in
   var sum = 0; 
   for (var i = 0; i < n; i++) {
      sum += a[i];
   }

   // If the sum of the digits of in are divisible by 3, then in is itself divisible by 3
   mod <-- sum % 3;
   // If mod != 0, then inv = 1/mod; otherwise 0
   // Similar to Num2Bits in circomlib (i.e., out constrained to 1 if true, 0 if false)
   inv <-- mod != 0 ? 1/mod : 0;
   out <== -mod*inv + 1;
}

template IsDivisibleBy9 (n) {
   signal input in;   
   signal a[n];
   signal mod;
   signal inv;
   signal output out;
   
   component digits = Num2Digits(n);
   digits.in <== in;
   digits.out --> a;

   var sum = 0; 
   for (var i = 0; i < n; i++) {
      sum += a[i];
   }

   // If the sum of the digits of in are divisible by 9, then in itself is divisible by 9
   mod <-- sum % 9;
   inv <-- mod != 0 ? 1/mod : 0;
   out <== -mod*inv + 1;
}


