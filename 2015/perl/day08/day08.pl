#!/usr/bin/env perl
# https://adventofcode.com/2015/day/8
use strict;
use warnings;
use File::Slurp;

die "Usage: $0 input.txt" unless @ARGV == 1
  && $ARGV[0] =~ /\w+/;

chomp(my @contents = read_file($ARGV[0]));

sub part1{
  my @contents = @contents;
  my ($code_size,$mem_size) = (0,0);
  foreach(@contents){
    $code_size += length;
    s/^"//;
    s/"$//;
    s/\\["\\]/Q/g;
    s/\\x[0-9a-f][0-9a-f]/X/g;
    $mem_size += length
  }
  $code_size - $mem_size
}

sub part2{
  my ($in_size,$out_size) = (0,0);
  foreach(@contents){
    $in_size += length;
    s/(["\\])/\\$1/g;
    $out_size += length($_) + 2
  }
  $out_size - $in_size
}

printf "Part1: %d\n",part1; # 1333
printf "Part2: %d\n",part2; # 2046

