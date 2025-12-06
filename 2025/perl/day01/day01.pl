#!/usr/bin/env perl
# https://adventofcode.com/2025/day/1
use strict;
use warnings;

die "Usage: $0 input.txt" unless @ARGV == 1 && $ARGV[0] =~ /\w+/;

my @dials;

sub process{
  my ($filename) = @_;
  open my $fh,'<',$filename or die "Can't open file: $!";
  while(<$fh>){
    push @dials,[$1,$2] if /(L|R)(\d+)/
  }
  close $fh;
}

sub part1{
  my ($dial,$c) = (50,0);
  foreach my $d(@dials) {
    if($d->[0] eq 'L') {$dial = ($dial - $d->[1]) % 100}
    else {$dial = ($dial + $d->[1]) % 100}
    $c++ if $dial == 0
  }
  $c
}

sub part2{
  my ($dial,$c) = (50,0);
  foreach my $d(@dials) {
    if($d->[0] eq 'L') {
      $dial = ($dial + $d->[1]) % 100;
    }
    else {
      $dial = ($dial - $d->[1]) % 100;
    }
    $c++ if $dial == 0;
  }
  $c  
}

process($ARGV[0]);
printf "Part1: %d\n",part1; # 1034
printf "Part2: %d\n",part2; # 

