#!usr/bin/perl
use strict;
use Quote;

my $phrase = "Foo";
my $author = "Bar";

my $quote1 = Quote->new();
my $quote2 = Quote->new();
$quote1->set_phrase($phrase);
$quote1->set_author($author);
$quote1->is_approved(1);

$phrase = "Baz";
$author = "Foo";
$quote2->set_phrase($phrase);
$quote2->set_author($author);

print STDOUT $quote1->get_phrase(), "\n";
print STDOUT $quote1->get_author(), "\n";
print STDOUT ($quote1->is_approved() ? "Is approved":"Is not approved"),
print STDOUT $quote2->get_phrase(), "\n";
print STDOUT $quote2->get_author(), "\n";
print STDOUT ($quote2->is_approved() ? "Is approved":"Is not approved"),

exit 0;    