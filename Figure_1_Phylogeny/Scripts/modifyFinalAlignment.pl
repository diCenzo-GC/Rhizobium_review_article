#!usr/bin/perl
use 5.010;

while(<>) {
	if(/>/) {
		chomp;
		@line = split('_',$_);
		say("@line[0]_@line[1]");
	}
	else {
		print($_);
	}
}
		
