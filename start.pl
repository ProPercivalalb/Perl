#!/usr/bin/perl

$emails = "patrick\@email.com";
print "$emails\n";
my ($name, $provider, $top_level) = ($emails =~ m/(.+)\@(.+)\.(.+)/);

print "$name $provider $top_level \n";

$time = "2:30:2
my ($hours, $minutes, $seconds) = ($time =~ m/(\d+):(\d+):(\d+)/);
print "dwae$hours $minutes $seconds \n";

