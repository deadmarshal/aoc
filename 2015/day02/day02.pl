#!/usr/bin/env perl
# https://adventofcode.com/2015/day/2
use strict;
use warnings;
use File::Slurp;
use List::Util qw(sum0 min);

die "Usage: $0 input.txt" unless @ARGV == 1
  && $ARGV[0] =~ /\w+/;

my @contents = read_file($ARGV[0]);

sub part1{
  my @arr;
  foreach(@contents){
    chomp;
    my ($l,$w,$h) = split 'x',$_;
    push @arr,[$l * $w,$l * $h,$w * $h];
  }
  sum0 map{2 * sum0(@$_) + min(@$_)} @arr;
}

sub part2{
  my @arr;
  foreach(@contents){
    chomp;
    my ($l,$w,$h) = split 'x',$_;
    push @arr,[$l + $w,$l + $h,$w + $h,$l * $w * $h];
  }
  sum0 map{2 * min(@{$_}[0..2]) + $_->[3]} @arr;
}

printf "Part1: %d\n",part1; # 1588178
printf "Part2: %d\n",part2; # 3783758

