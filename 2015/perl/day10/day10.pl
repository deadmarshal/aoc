#!/usr/bin/env perl
# https://adventofcode.com/2015/day/10
use strict;
use warnings;
use File::Slurp;

die "Usage: $0 input.txt" unless @ARGV == 1
  && $ARGV[0] =~ /\w+/;

my $content = read_file($ARGV[0]);

sub part1{
  1
}

sub part2{
  1
}

printf "Part1: %d\n",part1; # 
printf "Part2: %d\n",part2; # 

