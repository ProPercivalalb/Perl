#!/usr/bin/perl
use Time::HiRes
require "./chi_squared.pl";

$text = "PIZZGQPIDMAKIVVMLBPMMVKZGXBMLVWBMBPMXWTQKMNWCVLWVRIUMTQIALMASIVLIBBIKPMLQBNWZGWCBWTWWSIBBPMXWTQKMLMKZGXBMLQBNWZBPMUAMTDMAQBQADMZGABZIQOPBNWZEIZLWVKMGWCZMITQAMBPIBQBPIAJMMVEZQBBMVJIKSEIZLAQBRCABCAMAIKIMAIZAPQNBKQXPMZBPMWNNQKMZQVKPIZOMWNBPMQVDMABQOIBQWVUILMQBKTMIZBWUMBPIBPMBPQVSABPQAXZWDMARIUMTQIALMIBPQARCABIXMZAWVITBZIOMLGKIZMTMAACAMWNBPMEWZLRCABMDMVQNPMQAZQOPBJCBQLWVBBPQVSPMQAQPIDMAXWSMVBWPMZKWTTMIOCMAIVLRIUMTQILWMAVBABZQSMUMIAIRCUXMZAPMEIAXZMBBGLZQDMVIVLPMZEWZSEIAOWQVOMFBZMUMTGEMTTIXXIZMVBTGAPMEIACVPIXXGIJWCBPMZJWGNZQMVLTMIDQVOJCBIYCQKSAKIVWNPMZAMIZKPPQABWZGACOOMABAAPMEIAXZMBBGIKBQDMQVBZGQVOBWBZIKSPQULWEVBPMXWTQKMBPQVSBPIBAPWEAPWELMAXMZIBMAPMEIAQBPQVSQBAPWEABPIBAPMEIAVBBPMAWZBBWOQDMCXMIAQTGWVWVMBPQVOQLWIOZMMEQBPBPMXWTQKMQBLWMAVBAMMUDMZGTQSMTGBPIBIXPGAQKQABEWZSQVOWVOZIDQBGEIDMAQAKICOPBCXQVIVGBPQVOBWWACAXQKQWCAPMZIZMIQAEMTTNCVLMLIVLAQVKMBPMLQAKWDMZGWNOZIDQBGEIDMAINMEUWVBPAIOWQBQAQVBPMAXWBTQOPBPMZPMILWNLMXIZBUMVBAIGARIUMTQIEIALMABQVMLNWZIOWWLKIZMMZIVLQKIVBAMMIVGBPQVOQVPMZEWZSBPIBEWCTLJMWNQVBMZMABBWLIZSVMBWZOWDMZVUMVBIKBWZABWJMPWVMABQIUCVACZMQNQIUKPIAQVOAPILWEAPMZMJCBBPMVAPILWEKPIAQVOQAWVMWNGWCZAXMKQITQBQMAAWQEWCTLJMZMITTGOZIBMNCTQNGWCKWCTLBISMITWWSIVLTMBUMSVWEQNGWCBPQVSQIUEIABQVOGWCZBQUMBPIVSAKPIZTQM";
$start = Time::HiRes::gettimeofday();



$smallest = 99999;

for($shift = 0;$shift<26;$shift+=1) {
	$decoded = decode_caesar($text, $shift);
	$value = chi_squared_test($decoded);
	if($value < $smallest) {
		$smallest = $value;
		print "$shift, $value, $decoded\n";
	}
}

$end = Time::HiRes::gettimeofday();
printf("%.5f\n", $end - $start);


sub decode_caesar {
	($cipher_text, $shift) = @_;
		
	#print "Input: CT -> $text, S -> $shift\n";
	
	@char_arr = split("", $cipher_text);
	
	#print "@string\n";
	
	@output = "";
	
	foreach $char (@char_arr) {
		push(@output, chr(((ord($char) - $shift - 65) % 26) + 65));
	}
	#print join("", @output), "\n";
	return join("", @output);
}
