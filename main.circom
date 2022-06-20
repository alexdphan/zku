// All files with .circom extension should start with a first pragma instruction specifying the compiler version, like this:
// This is to ensure that the circuit is compatible with the compiler version indicated after the pragma instruction.
// Otherwise, the compiler throws a warning.
pragma circom 2.0.3;

// This circuit template checks that c is the multiplication of a and b.
// Let us notice that in each template, we first declare its signals, and after that, the associated constraints.
template Multiplier2(){

    // Declaration of signals
    // Declares in1 and in2 as an input
    // Declares out as an output
    // signal is always private
   signal input in1;
   signal input in2;
   signal output out;

   // Since circom 2.0.4, it's also allowed initialization of intermediate and outputs signals right after their declaration. 
   // In this example, we did not initialize intermediate and output signals right after. We kept it separate from declaration instead.
   // Constraint generation can be combined with signal assignment with the operator <== with the signal to be assigned on the left hand side of the operator.
   // Finally, we use <== to set that the value of out is the result of multiplying the values of in1 and in2. Equivalently, we could have also used the operator ==>, e.g., in1 * in2 ==> out.   
   out <== in1 * in2;
   // This is equal to:
        // out === in1 * in2;
        // out <-- in1 * in2;
   // assigning a value to a signal using <-- and --> is considered dangerous and should, in general, be combined with adding constraints with ===
   // Only quadratic expressions are allowed to be included in constraints. 
   // Other arithmetic expressions beyond quadratic or using other arithmetic operators like division or power are not allowed as constraints.

   // log is an operation that can be used while developing circuits to help the programmer debug (note that there are no input/output operations on the standard input/output channels).
   // The execution of this instruction prints the result of the evaluation of the expression in the standard error stream.
   log(out);
}

component main {public [in1,in2]} = Multiplier2();

/* INPUT = {
    "in1": "10",
    "in2": "7"
} */
