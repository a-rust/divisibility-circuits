pragma circom 2.1.4;

template Num2Digits (n) {
   // input in = a_n*10^n + ... + a_1*10^1 + a_0*10^0, where a_i \in {0, 1, ... , 9}
   signal input in;
   // out = [a_n, ... , a_1, a_0], where a_i \in {0, 1, ... , 9}
   signal output out[n];

   // running total to keep track of place value; constrained to equal in at the end 
   var total = 0;

   // exp10 represents 10^i, starting with i = 0
   var exp10 = 1;

   for (var i = 0; i < n; i++) {
      // qoutient represents each digit (right to left)
      var qoutient = (in \ 10**i) % 10;

      // assign out[i] to be the leading digit
      out[i] <-- qoutient;
 
      // total keeps track of completed powers of 10
      // exp10 moves to the next power of 10
      total += out[i] * exp10;
      exp10 = exp10 * 10;
   }

   // constraint that the running total equals the original input in
   total === in;

}
