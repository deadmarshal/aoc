#!/usr/bin/env perl
# https://adventofcode.com/2022/day/1
use strict;
use warnings;
use List::Util qw(max sum);

die "Usage: $0 input.txt" unless @ARGV == 1
  && $ARGV[0] =~ /\w+/;

sub part1{
  my ($file) = @_;
  open(my $fh,'<',$file) or die "Can't open file: $!";
  my ($sum,@ret) = (0);
  while(<$fh>){
    $sum += $_ unless(/^$/);
    do{push @ret,$sum; $sum = 0} if(/^$/);
  }
  close($fh);
  max @ret;
}

sub part2{
  my ($file) = @_;
  open(my $fh,'<',$file) or die "Can't open file: $!";
  my ($sum,@ret) = (0);
  while(<$fh>){
    $sum += $_ unless(/^$/);
    do{push @ret,$sum; $sum = 0} if(/^$/);
  }
  close($fh);
  @ret = sort {$b <=> $a} @ret;
  sum @ret[0..2];
}

printf "Part1: %d\n", part1($ARGV[0]);
printf "Part2: %d\n", part2($ARGV[0]);

