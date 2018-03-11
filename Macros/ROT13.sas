%macro ROT13(tgt_var, out_var);
	%let bfLine = ABCDEFGHIJKLMNOPQRSTUVWXYZ;
	%let afLine = %sysfunc(substr(&bfLine., 14, 13))%sysfunc(substr(&bfLine., 1, 13));
	%let bfVals = &afLine.%sysfunc(lowcase(&afLine.));
	%let afVals = &bfLine.%sysfunc(lowcase(&bfLine.));

	&out_var. = translate(&tgt_var., "&bfVals.", "&afVals.");
%mend ROT13;


data sample;
	length Before $15.;
	Before = "Hello World!"; output;
	Before = "Stack Overflow"; output;
	Before = "1234567890"; output;
	Before = "あいうえお"; output;
run;

data result;
	set sample;
	%ROT13(Before, After);
run;
