pragma circom 2.1.4;

include "./base_10.circom";

template IsDivisibleBy2 (n) {
   signal input in;   
   signal a[n];
   signal mod;
   signal inv;
   // Output out will be 1 if in is divisible by 2; 0 otherwise
   signal output out;


   component digits = Num2Digits(n);
   digits.in <== in;
   digits.out --> a;

   // If the last digit of in is divisible by 2, then in itself is divisible by 2
   mod <-- a[0] % 2;
   inv <-- mod != 0 ? 1/mod : 0;
   out <== -mod*inv + 1;
}

template IsDivisibleBy4 (n) {
   signal input in;   
   signal a[n];
   signal suffix;
   signal mod;
   signal inv;
   // Output out will be 1 if in is divisible by 4; 0 otherwise
   signal output out;

   component digits = Num2Digits(n);
   digits.in <== in;
   digits.out --> a;

   component num = Digits2Num(2);

   // Conctination of last 2 digits of in
   num.in <-- [a[0], a[1]];
   num.out ==> suffix;

   // If the concatination of the last 2 digits of in is divisible by 4, then in itself is divisible by 4
   mod <-- suffix % 4;
   inv <-- mod != 0 ? 1/mod : 0;
   out <== -mod*inv + 1;
}

template IsDivisibleBy8 (n) {
   signal input in;   
   signal a[n];
   signal suffix;
   signal mod;
   signal inv;
   // Output out will be 1 if in is divisible by 8; 0 otherwise
   signal output out;

   component digits = Num2Digits(n);
   digits.in <== in;
   digits.out --> a;

   component num = Digits2Num(3);

   // Conctination of last 3 digits of in
   num.in <-- [a[0], a[1], a[2]];
   num.out ==> suffix;

   // If the concatination of the last 3 digits of in is divisible by 8, then in itself is divisible by 8
   mod <-- suffix % 8;
   inv <-- mod != 0 ? 1/mod : 0;
   out <== -mod*inv + 1;
}