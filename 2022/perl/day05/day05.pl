#!/usr/bin/env perl
# https://adventofcode.com/2022/day/5
use strict;
use warnings;
use Data::Show;

die "Usage: $0 input.txt" unless @ARGV == 1
  && $ARGV[0] =~ /\w+/;

sub part1
{
  my ($file) = @_;
  open(my $fh,'<',$file) or die "Can't open file: $!";
  my ($count,@arr) = (0);
  while(<$fh>){
    chomp;
    push @arr,[split '']
  }
  #print show @arr;
  my @rows = (0..$#arr);
  my @cols = (0..$#{$arr[0]});
  foreach my $i(1..$#arr-1){
    foreach my $j(1..$#{$arr[0]}-1){
      
    }
  }
  1;
}

sub part2
{
  my ($file) = @_;
  1;
}

printf "Part1: %d\n", part1($ARGV[0]);
printf "Part2: %d\n", part2($ARGV[0]);

