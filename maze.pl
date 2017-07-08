#!/usr/bin/perl

#0 Filled, 1 empty
@maze = generate_maze(12, 12);

for($h = 0; $h < 12; $h++) {
	$row = "";

	for($w = 0; $w < 12; $w++) {
		$row .= $maze[$h * 11 + $w];
	}
	
	print $row, "\n";
}

$FILLED_MASK = 1;
$VISTED_MASK = 2;

sub generate_maze {
	my ($width, $height) = @_;
	$total = $width * $height;
	my @maze = (0)x$total;
	print @maze, "\n";
	
	my %groups = ();
	my $group = 0;
	
	for($x = 1; $x < $width; $x += 2) {
		for($y = 1; $y < $height; $y += 2) {
			$index = $x * $width + $y;
			$maze[$index] = 1;
			
			print $index, "\n";
			$groups{$index} = $group;
			++$group;
		}
	}
	
	#Infinite loop
	LOOP:for($a =0 ;$a<60000;$a+=1 ) {
		my $intersection = (keys %groups)[(rand keys %groups)];
		
		print %groups, "\n";
		@directions = (-$width, $width, -1, 1);
		
		$dir = $directions[rand @directions];
		
		$wall_between = $intersection + $dir;
		
		goto LOOP if($wall_between < 0 || $wall_between >= $total);
		
		$next_intersection = $intersection + $dir * 2;
		
		goto LOOP unless(exists $groups{$next_intersection});
		print "Intersection ", $intersection, " ", $next_intersection, "\n";
		$group1 = $groups{$intersection};
		$group2 = $groups{$next_intersection};
		print $group1, " ", $group2, "\n";

		goto LOOP if($group1 == $group2);
		print "madde it\n";
		foreach $key (keys %groups) {
			if($groups{$key} == $group2) {
				$groups{$key} = $group1;
			}
		}
		
		$maze[$wall_between] = 1;
		$done = 1;
		foreach $key (keys %groups) {
			if($groups{$key} != $group1) {
				$done = 0;
				last;
			}
		}
		if($done) {
			print "Done $a\n";
			return @maze;
			last;
		}
		#'last if($done);

		
		
		
		print $intersection, " ", $dir, " " , $next_intersection, "\n";
	}
}