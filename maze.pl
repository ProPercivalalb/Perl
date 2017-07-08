#!/usr/bin/perl

generate_maze(10, 10);

sub generate_maze {
	my ($width, $height) = @_;
	@array = (0)x($width * $height);
	print @array, "\n";
		
}