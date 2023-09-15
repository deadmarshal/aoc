#!/usr/bin/env perl
# https://adventofcode.com/2022/day/4
use strict;
use warnings;

die "Usage: $0 input.txt" unless @ARGV == 1
  && $ARGV[0] =~ /\w+/;

sub part1{
  my ($file) = @_;
  open(my $fh,'<',$file) or die "Can't open file: $!";
  my $sum = 0;
  while(<$fh>){
    chomp;
    if(/(\d+)-(\d+),(\d+)-(\d+)/){
      $sum++ if(($1 <= $3) && ($4 <= $2) || ($3 <= $1) && ($2 <= $4));
    }
  }
  close $fh;
  $sum;
}

sub part2{
  my ($file) = @_;
  open(my $fh,'<',$file) or die "Can't open file: $!";
  my $sum = 0;
  while(<$fh>){
    chomp;
    if(/(\d+)-(\d+),(\d+)-(\d+)/){
      $sum++ unless($4 < $1 || $2 < $3);
    }
  }
  close $fh;
  $sum;
}

printf "Part1: %d\n", part1($ARGV[0]);
printf "Part2: %d\n", part2($ARGV[0]);

