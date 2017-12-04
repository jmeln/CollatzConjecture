use CollatzNumber;
use warnings;
use strict;
use diagnostics;
#=begin comment
my $num = new CollatzNumber(9,19);
my $numI = $num->GetIdentity();
my $numSeq = $num->GetSequence();
print "$numI, $numSeq\n"