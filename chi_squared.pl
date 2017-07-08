#!/usr/bin/perl

sub chi_squared_test {
	my %english_freq = ('A' => 8.17, 'B', 1.49, 'C', 2.78, 'D', 4.25, 'E', 12.7, 'F', 2.23, 'G', 2.02, 'H', 6.09, 'I', 7, 'J', 0.15, 'K', 0.77, 'L', 4.03, 'M', 2.41, 'N', 6.75, 'O', 7.51, 'P', 1.93, 'Q', 0.1, 'R', 5.99, 'S', 6.33, 'T', 9.06, 'U', 2.76, 'V', 0.98, 'W', 2.36, 'X', 0.15, 'Y', 1.97, 'Z', 0.07);
	
	my ($input_text) = @_;
	
	my @string = split("", $input_text);
	my $length = @string;
	
	
	my %counts = ();
	
	foreach my $char (@string) {
		$counts{$char} += 1;
	}
	
	my $value = 0;
	
	foreach $char (keys %english_freq) {
		my $count = exists $counts{$char} ? $counts{$char} : 0;
		
		my $expected = ($english_freq{$char} / 100 * $length);
		$value += ($count - $expected)**2 / $expected;
	}
	
	#print $value, " ", %counts, "\n"
	
	return $value;
}

1;