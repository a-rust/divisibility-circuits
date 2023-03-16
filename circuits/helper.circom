pragma circom 2.1.4;

// Helper template most likely needed for IsDivisibleBy7 template, given the divisibility rule used
template Num2FirstNMinus1 (n) {
   signal input in;
   signal ld1;
   // Returns the first n-1 digits (ignoring the 1s place)
   //   Ex/ in = 185, out = [1, 8]
   signal output out[n-1];

   var total = 0;

   var exp10 = 10;

   // Isolating the coefficient of the ones place
   ld1 <-- (in % 10);

   for (var i = 0; i < n-1; i++) {
      var exp = 10**(i+1);
      var qoutient = (in \ exp) % 10;

      out[i] <-- qoutient;
 
      total += out[i] * exp10;
      exp10 = exp10 * 10;
   }

   // total plus ones place should return the original input in
   total + ld1 === in;

}