#!/usr/bin/perl

#Programmer: Jason Rohde with some mentoring from The Zahid
#Date: Thu 01 May 2014 12:01:21 PM CDT
#Purpose: TO Scrape logfiles for a particular string, originally to check maestro.log for for 'Pool Exhausted' errors
#Usage: /path/to/script file string or /path/to/script file "quoted string"
#Perms: Needs to be able to read log files

use strict;
use warnings;

#declare variables

my $filename = $ARGV[0];
my $search = $ARGV[1];
my $status = 0; 
my $errmsg = "$search not found";


#open file
open (FILE,$filename) or die $!;
open (OUT,">log.txt");

while(<FILE>){
	if($_ =~ m/$search/){
	$status=1;
	$errmsg="$_\n";
	print OUT "$_\n";
	last
	}	
 }#close while

print "statistic.message: $errmsg\n";
print "statistic.status: $status\n";

#close files

close(FILE);
close(OUT);

exit;
