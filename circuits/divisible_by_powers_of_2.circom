pragma circom 2.1.4;

include "./base_10.circom";

template IsDivisbleBy2 (n) {
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

