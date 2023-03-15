pragma circom 2.1.4;

include "./base_10.circom";


template IsDivisibleBy6 (n) {
   signal input in;   
   signal a[n];
   signal mod;
   signal inv;
   // Output out will be 1 if in is divisible by 6; 0 otherwise
   signal output out;
   
   
   component digits = Num2Digits(n);
   digits.in <== in;
   digits.out --> a;


   // One way of checking if in is divisible by 6 is to:
   //    sum the 1s digit with (4 * \sum_{i=1}^{n}a[i])
   //        sum % 6 == 0 iff in itself is divisible by 6
   var sum = a[0]; 
   for (var i = 1; i < n; i++) {
      sum += a[i]*4;
   }
   
   mod <-- sum % 6;
   // If ldsum != 0, then inv = 1/mod; otherwise 0
   inv <-- mod != 0 ? 1/mod : 0;
   out <== -mod*inv + 1;
}

