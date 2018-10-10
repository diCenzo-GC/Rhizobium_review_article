#!usr/bin/perl
use 5.010;

$current = 'test';
$previous = 'test';
$all = '0';
$nodABC = '0';
$nifHDK = '0';
$overall = '0';

say("Species\tAll\tNodABC\tNifHDK\tOverall");

while(<>) {
	@line = split("\t",$_);
	$current = @line[0];
	if($current eq $previous) {
		if(@line[10] == 1) {
			$all = 1;
		}
		if(@line[9] == 1) {
			$nifHDK = 1;
		}
		if(@line[8] == 1) {
			$nodABC = 1;
		}
		$previous = $current;
	}
	if($current ne $previous) {
		if($all == 1) {
			$overall = '1';
		}
		if($all == 0) {
			if($nifHDK == 1) {
				if($nodABC == 1) {
					$overall = '4';
				}
				else {
					$overall = '2';
				}
			}
			elsif($nodABC == 1) {
				$overall = '3';
			}
		}
		say("$previous\t$all\t$nodABC\t$nifHDK\t$overall");
		$all = '0';
		$nodABC = '0';
		$nifHDK = '0';
		$overall = '0';
		if(@line[10] == 1) {
			$all = 1;
		}
		if(@line[9] == 1) {
			$nifHDK = 1;
		}
		if(@line[8] == 1) {
			$nodABC = 1;
		}
		$previous = $current;
	}
}
say("$previous\t$all\t$nodABC\t$nifHDK\t$overall");


