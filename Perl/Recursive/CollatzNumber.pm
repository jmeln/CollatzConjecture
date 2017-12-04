package CollatzNumber;
sub new{
	my $class = shift;
	my $self = {
		_identity => shift,
		_sequence => shift,
	};
	bless $self, $class;
	return $self;
}
sub SetIdentity{
	my($self, $identity) = @_;
	$self->{_identity} = $identity if defined($identity);
	return $self->{_identity};
}
sub GetIdentity{
	my($self) = @_;
	return $self->{_identity};
}
sub SetSequence{
	my($self, $sequence) = @_;
	$self->{_sequence} = $sequence if defined($sequence);
	return $self->{_sequence};
}
sub GetSequence{
	my($self) = @_;
	return $self->{_sequence};
}
1;
