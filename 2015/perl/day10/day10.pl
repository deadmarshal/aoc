#!/usr/bin/env perl
# https://adventofcode.com/2015/day/10
use strict;
use warnings;
use File::Slurp;

die "Usage: $0 input.txt" unless @ARGV == 1
  && $ARGV[0] =~ /\w+/;

chomp(my $content = read_file($ARGV[0]));

sub convert{
  my $res;
  while($_[0] =~ /((.)\2*)/g){
    my $d = $2;
    $res .= length($1) . $d
  }
  $res
}

sub part1{
  my $c = $content;
  $c = convert($c) foreach(1..40);
  length $c
}

sub part2{
  my $c = $content;
  $c = convert($c) foreach(1..50);
  length $c
}

printf "Part1: %d\n",part1; # 329356
printf "Part2: %d\n",part2; # 4666278

