#!/usr/bin/perl
#use strict #all variables must be declared before use


#Comment

=begin
Comment in here
=cut



$a = 10;

print "Double quotes interpolate variables \$a = $a\n";
print 'Single quotes... \$a = $a\n';

$var = <<"IDENTIFIER";
Multi
line
quotes
IDENTIFIER
print "$var\n";

$var1 = 10; #Scalars
@var2 = 20; #Arrays of scalars
%var3 = ('1', 'First value', 3, '2nd Value'); #Hashes of scalers (mapping)

print "$var1 @var2 $var3{1} $var3{'1'} $var3{'3'}\n";




print "\up \UddwaEa\Eaweewae\cJwdaejewajew" . 'dawe';

$vstring = v77.97.114.116.105.110; 
print "v string $vstring\n\n" . 

print "File name ". __FILE__ . "\n";
print "Line Number " . __LINE__ ."\n";
print "Package " . __PACKAGE__ ."\n";

@array = (1, 2, 'Hello');

@var_10 = (1..10);
@var_20 = (10..20);
@var_abc = (a..z);

print "@var_10\n";   # Prints number from 1 to 10
print "@var_20\n";   # Prints number from 10 to 20
print "@var_abc\n";  # Prints number from a to z

print "Size: ",scalar @var_abc,"\n";



# create a simple array
@coins = ("Quarter","Dime","Nickel");
print "1. \@coins  = @coins\n";

# add one element at the end of the array
push(@coins, "Penny");
print "2. \@coins  = @coins\n";

# add one element at the beginning of the array
unshift(@coins, "Dollar");
print "3. \@coins  = @coins\n";

# remove one element from the last of the array.
pop(@coins);
print "4. \@coins  = @coins\n";

# remove one element from the beginning of the array.
shift(@coins);
print "5. \@coins  = @coins\n";



@days = qw/Mon Tue Wed Thu Fri Sat Sun/;

@weekdays = @days[0..4,-1];

print "@weekdays\n";