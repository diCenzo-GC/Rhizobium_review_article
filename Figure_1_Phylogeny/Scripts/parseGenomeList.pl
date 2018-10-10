#!usr/bin/perl
use 5.010;

while(<>) {
	@line = split("\t",$_);
	@species = split("\ ",$_);
	if(@species[0] eq 'Candidatus') {
		say("@species[1]_@species[2],@line[1],Yes,@line[18]");
	}
	else {
		say("@species[0]_@species[1],@line[1],No,@line[18]");
	}
}
