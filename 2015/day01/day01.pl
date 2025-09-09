#!/usr/bin/env perl
# https://adventofcode.com/2015/day/1
use strict;
use warnings;
use File::Slurp;

die "Usage: $0 input.txt" unless @ARGV == 1
  && $ARGV[0] =~ /\w+/;

my @arr = split '',read_file($ARGV[0]);

sub part1{
  my $c = 0;
  foreach my $p(@arr){
    $c++ if $p eq '(';
    $c-- if $p eq ')'
  }
  $c
}

sub part2{
  my ($c,$floor) = (0,0);
  foreach my $p(@arr){
    last if $c == -1;
    $floor++;
    $c++ if $p eq '(';
    $c-- if $p eq ')'
  }
  $floor
}

printf "part1: %d\n",part1; # 232
printf "part2: %d\n",part2; # 1783

