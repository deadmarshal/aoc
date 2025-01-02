#!/usr/bin/env perl
# https://adventofcode.com/2024/day/3
use strict;
use warnings;
use DDP;

die "Usage: $0 input.txt" unless @ARGV == 1
  && $ARGV[0] =~ /\w+/;

my $part1 = 0;
my $part2 = 0;

# (do\\(\\))|(don't\\(\\))|(mul\\((\\d+),(\\d+)\\))
sub solve{
  my ($file) = @_;
  open(my $fh,'<',$file) or die "Can't open file: $!";
  my $str = do{local $/; <$fh>};
  close $fh;
  my $enabled = 1;
  foreach my $i(0..length $str){
    if(substr($str,$i) =~ /do\(\)/){$enabled = 1}
    if(substr($str,$i) =~ /don't\(\)/){$enabled = 0}
    if(substr($str,$i) =~ m{mul\((\d{1,3}),(\d{1,3})\)}){
      print $1, ' ', $2, "\n";
      $part1 += $1 * $2;
      if($enabled) {$part2 += $1 * $2}
    }
  }
}

solve($ARGV[0]);
printf "Part1: %d\n",$part1;
printf "Part2: %d\n",$part2;

