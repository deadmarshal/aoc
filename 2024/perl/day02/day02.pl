#!/usr/bin/env perl
# https://adventofcode.com/2024/day/2
use strict;
use warnings;
use List::Util qw(all);

die "Usage: $0 input.txt" unless @ARGV == 1
  && $ARGV[0] =~ /\w+/;

my @arr;

sub process{
  my ($file) = @_;
  open(my $fh,'<',$file) or die "Can't open file: $!";
  
  while(<$fh>){
    
  }
  close($fh);
  if (@arr == @arr && all { $arr[$_] eq $arr[$_] } 0..$#arr) {
    
  }
}

sub part1{
  1
}

sub part2{
  1
}

printf "Part1: %d\n",part1($ARGV[0]);
printf "Part2: %d\n",part2($ARGV[0]);

