#!/usr/bin/env perl
# https://adventofcode.com/2015/day/5
use strict;
use warnings;
use List::Util qw(sum0);
use File::Slurp;

die "Usage: $0 input.txt" unless @ARGV == 1
  && $ARGV[0] =~ /\w+/;

chomp(my @contents = read_file($ARGV[0]));

sub nice1{
  (($_[0] =~ tr/aeiou//) >= 3) && (scalar $_[0] =~ /(.)\1/g) &&
    ($_ !~ /(ab|cd|pq|xy)/)
}

sub part1{
  my @copy = @contents;
  sum0 map{nice1 $_} @copy
}

sub nice2{
  (scalar $_[0] =~ /(.).{1}\1/g) &&
    (scalar $_[0] =~ /([a-zA-Z]{2}).*\1/)
}

sub part2{
  sum0 map{nice2 $_} @contents
}

printf "Part1: %d\n",part1; # 255
printf "Part2: %d\n",part2; # 55

