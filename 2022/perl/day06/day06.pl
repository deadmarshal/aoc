#!/usr/bin/env perl
# https://adventofcode.com/2022/day/6
use strict;
use warnings;
use List::MoreUtils qw(slideatatime any);
use File::Slurp;

die "Usage: ./day05.pl input.txt" unless @ARGV == 1
  && $ARGV[0] =~ /\w+/;

sub part1{
  my ($file) = @_;
  my $str = read_file($file);
  my $it = slideatatime 1,4,(split '',$str);
  while(my @vals = $it->()){
    my %seen;
    $seen{$_}++ foreach(@vals);
    next if(any {$_ > 1} values %seen);
    my $substr = join '',@vals;
    return index($str,$substr) + (length $substr);
  }
}

sub part2{
  my ($file) = @_;
  my $str = read_file($file);
  my $it = slideatatime 1,14,(split '',$str);
  while(my @vals = $it->()){
    my %seen;
    $seen{$_}++ foreach(@vals);
    next if(any {$_ > 1} values %seen);
    my $substr = join '',@vals;
    return index($str,$substr) + (length $substr);
  }
}

printf "Part1: %d\n", part1($ARGV[0]);
printf "Part2: %d\n", part2($ARGV[0]);

