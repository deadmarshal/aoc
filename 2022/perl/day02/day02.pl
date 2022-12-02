#!/usr/bin/env perl
# https://adventofcode.com/2022/day/2
use strict;
use warnings;

die "Usage: ./day02.pl input.txt" unless @ARGV == 1
  && $ARGV[0] =~ /\w+/;

sub part1{
  my ($file) = @_;
  my %points = ('A X' => 4, 'A Y' => 8, 'A Z' => 3,
		'B X' => 1, 'B Y' => 5, 'B Z' => 9,
		'C X' => 7, 'C Y' => 2, 'C Z' => 6);
  my $score = 0;
  open(my $fh,'<',$file) or die "Can't open file: $!";
  while(<$fh>){
    chomp;
    $score += $points{$_};
  }
  close $fh;
  $score;
}

sub part2{
  my ($file) = @_;
  my %points = ('A X' => 3, 'A Y' => 4, 'A Z' => 8,
		'B X' => 1, 'B Y' => 5, 'B Z' => 9,
		'C X' => 2, 'C Y' => 6, 'C Z' => 7);
  my $score = 0;
  open(my $fh,'<',$file) or die "Can't open file: $!";
  while(<$fh>){
    chomp;
    $score += $points{$_};
  }
  close $fh;
  $score;
}

printf "part1: %d\n", part1($ARGV[0]);
printf "part2: %d\n", part2($ARGV[0]);

