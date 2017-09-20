// Compute the logical AND and OR of inputs A and B
module AND_OR(andOut, orOut, A, B);
   output andOut, orOut;
   input A, B;
   and TheAndGate (andOut, A, B);
   or TheOrGate (orOut, A, B);
endmodule

// Compute the logical NAND and NOR of inputs X and Y.
module NAND_NOR(nandOut, norOut, X, Y);
   output nandOut, norOut;
   input X, Y;
   wire andVal, orVal;
   AND_OR aoSubmodule (andVal, orVal, X, Y);
   not n1 (nandOut, andVal);
   not n2 (norOut, orVal);
endmodule 

//Given A and B, calculate the notA, notB, AND of notA and notB, OR of notA notB, NAND of A and B, NOR of A and B from input A and B
module demorgan(A, B, nA, nB, and_nAnB, or_nAnB, nand_AB, nor_AB);
  output nA, nB, and_nAnB, or_nAnB, nand_AB, nor_AB;
  input A,B; 
  wire nA, nB;
  //find nA and nB
  not Ainv(nA, A);    // Top inverter is named Ainv, takes signal A as input and produces signal nA
  not Binv(nB, B);

  //Pass nA and nB into AND_OR submodule and calculate and_nAnB and or_nAnB
  AND_OR aoSubmodule (and_nAnB, or_nAnB, nA, nB);

  //Pass A and B into NAND_NOR submodule and calcualte nand_AB and nor_AB
  NAND_NOR aooSubmodule (nand_AB, nor_AB, A, B);

endmodule

