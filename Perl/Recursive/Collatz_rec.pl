#!/usr/bin/perl
use CollatzNumber;
#use warnings;
use strict;
#use diagnostics;


sub Collatz{
	#Calculates the length of the Collatz Sequence at $_[0].
	my $num = $_[0];
	my $seq = $_[1];
	if($num < 2){
		return $seq;
	}
	else{
		return ($num%2 == 1) ? Collatz((3*$num+1), $seq+1) : Collatz(($num/2), $seq+1);
	}
}
sub Sort{
	#Sorts the given array in $_[0] by their sequence lengths
	my @numArray = @{$_[0]};
	my $sorted = 0;
	do{
		$sorted = 0;
		for(my $i = 1; $i < 10; $i++){
			my $seq1 = $numArray[$i-1]->GetSequence();
			my $seq2 = $numArray[$i]->GetSequence();
			if($seq1 < $seq2){
				my $temp = $numArray[$i-1];
				$numArray[$i-1] = $numArray[$i];
				$numArray[$i] = $temp;
				$sorted = 1;
			}
		}
	}while($sorted == 1);
	return @numArray;
}
sub HasCollatzNumber{
	#Checks the given array at $_[0] if there is a number with the same collatz value as $_[1]. Returns 1 if true 0 if false
	my @numArray = @{$_[0]};
	my $val = $_[1];
	foreach $a (@numArray){
		my $aSequence = $a->GetSequence();
		if($aSequence == $val){
			return 1;
		}
	}
	return 0;
}
sub PrintArray{
	#Prints the contents of the given array at $_[0].
	my @numArray = @{$_[0]};
	@numArray = Sort(\@numArray);
	foreach $a (@numArray){
		my $aIdentity = $a->GetIdentity();
		my $aSequence = $a->GetSequence();
		print "$aIdentity has a Collatz Sequence of length $aSequence.\n";
	}
}
print "Please enter the maximum value to be considered: ";
my $input = <>;
chomp $input;

my @nums = ();
foreach my $i(0..9){
	#initializes 10 places in the array of CollatzNumbers
	my $num = new CollatzNumber(0, 0);
	push(@nums, $num)
}
print "\nCalculating Collatz Sequences...\n";
for(my $i = 2; $i <= $input; $i++){
	my $curCollatz = Collatz($i,0);
	my $seq = $nums[9]->GetSequence();
	if(($curCollatz > $seq) and not(HasCollatzNumber(\@nums, $curCollatz))){
		my $num = CollatzNumber->new($i, $curCollatz);
		$nums[9] = $num;
		@nums = Sort(\@nums);
	}
}
PrintArray(\@nums);

exit 0;