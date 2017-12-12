--Author: Jarrett Melnick
--Program to calculate the top 10 numbers with the largest Collatz sequences
with Text_IO, Ada.Integer_Text_IO;
use Text_IO, Ada.Integer_Text_IO;

procedure Collatz is

function sequence(num: Integer; counter: Integer) return Integer is
numChange : Integer := num;
seqCount: Integer := counter;
begin
	if num < 2 then
		return counter;
	else
		if num mod 2 = 1 then
			return sequence((3*numChange+1), (seqCount+1));
		else
			return sequence((numChange / 2), (seqCount+1));
		end if;
	end if;
end sequence;
--Variable Declarations
iterate: Integer := 15; 	--Change this to change max
smallest: Integer := 0;
largest: Integer := 0;
curCollatz: Integer := 0;
hasCollatz: Integer:= 0;
inp :Integer:=0;

--Array Declarations
ident1: array(0 .. 9) of Integer;
ident2: array(0 .. 9) of Integer;
seq1: array(0 .. 9) of Integer;
seq2: array(0 .. 9) of Integer;
begin
	--Set arrays equal to zero
	for i in 0 ..9 loop
		ident1(i) := 0;
		ident2(i) := 0;
		seq1(i) := 0;
		seq2(i) := 0;
	end loop;
--Find the top 10 numbers with the largest sequences
	For_Loop:
	for i in Integer range 2 .. iterate loop
		smallest := 0;
		hasCollatz:= 0;
		inp := i;
		curCollatz := sequence(inp, smallest);
		For_Loop2:
		for j in Integer range 0 .. 9 loop
			if seq1(smallest) > seq1(j) then
				smallest := j;
			end if;
			if seq1(j) = curCollatz then
			hasCollatz := 1;
			end if;
		end loop For_Loop2;
		if seq1(smallest) < curCollatz and hasCollatz = 0 then
			seq1(smallest) := curCollatz;
			seq2(smallest) := curCollatz;
			ident1(smallest) := i;
			ident2(smallest) := i;
		end if;
	end loop For_Loop;

	--Print Output
	put_line("SORTED BY SEQUENCE SIZE:");
	For_Loop4:
	for i in Integer range 0 .. 9 loop
		largest := 0;
		For_Loop5:
		for j in Integer range 0 .. 9 loop
			if seq1(largest) < seq1(j) then
				largest := j;
			end if;
		end loop For_Loop5;
		put(Integer'Image(ident1(largest)));
		put (" has a Collatz sequence of length ");
		put_line(Integer'Image(seq1(largest)));
		seq1(largest) := 0;
		ident1(largest) := 0;

	end loop For_Loop4;
	
	put_line("SORTED BY INTEGER SIZE:");
	For_Loop6:
	for i in Integer range 0 .. 9 loop
		largest := 0;
		For_Loop7:
		for k in Integer range 0 .. 9 loop
			if ident2(largest) < ident2(k)then
				largest := k;
			end if;
		end loop For_Loop7;

	put(Integer'Image(ident2(largest)));
	put(" has a Collatz sequence of length ");
	put_line(Integer'Image(seq2(largest)));
	seq2(largest) := 0;
	ident2(largest) := 0;
	end loop For_Loop6;

--	put_line(Long_Integer'Image(Collatz(z)));
end Collatz;
