include "./base_10.circom";

template IsDivisbleBy5 (n) {
   signal input in;   
   signal a[n];
   signal ldsum;
   signal inv;
   // Output out will be 1 if in is divisible by 5; 0 otherwise
   signal output out;
   
   
   component digits = Num2Digits(n);
   digits.in <== in;
   digits.out --> a;
   
   // If the last digit of in is 0 or 5, then in itself is divisible by 5
   //   A simple check is to add the last digit of in to itself, and mod by 10
   //      If result is 0, then in is divisible by 5; 0 otherwise
   ldsum <-- (a[0] + a[0]) % 10;
   // If ldsum != 0, then inv = 1/mod; otherwise 0
   inv <-- ldsum != 0 ? 1/ldsum : 0;
   out <== -ldsum*inv + 1;
}

