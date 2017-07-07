#!/usr/bin/perl
use strict;
use warnings;

use Path::Tiny;
use autodie;

iterate_dirs(path('C:/Users/alexl/Documents/PHP Phishing/phishingkits'));


sub iterate_dirs {
	my ($dir) = @_;
	my $iter = $dir->iterator;
	while(my $file = $iter->()) {
    
    	#See if it is a directory and skip
    	if($file->is_dir()) {
    		iterate_dirs($file);
    	}
    	else {
    	
	    	# Read in the entire contents of a file
			my $content = $file->slurp();
			my $file_name = $file->stringify();
			
			if($file_name =~ m/.txt/ || $file_name =~ m/.php/) {
				
				# Do something with the data
				if($content =~ m/(\d+\.\d+\.\d+\.\d+)/g) {
					my @ips = ($content =~ m/(\d+\.\d+\.\d+\.\d+)/g);
					
					foreach my $ip (@ips) {
						print "$ip\n";
					} 
					
	
				}
				elsif($content =~ m/([^@]{1,20}@[^@]{1,20})/g) {
					my @ips = ($content =~ m/([^@]{1,20}@[^@]{1,20})/g);
					
					foreach my $ip (@ips) {
						print "$ip\n";
					} 
					
	
				}
    		}
			
			
	    	#print "$content\n";
    	}
	}
}