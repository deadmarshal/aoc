#!/usr/bin/env perl
# https://adventofcode.com/2024/day/3
use strict;
use warnings;

die "Usage: $0 input.txt" unless @ARGV == 1
  && $ARGV[0] =~ /\w+/;

my @lines;

sub part1{
  my ($sum,$i) = (0,0);
  while($i < $#lines){
    if($lines[$i] =~ /\d+/){$sum += $lines[$i++] * $lines[$i]}
    $i++
  }
  $sum
}

sub part2{
  my ($sum,$i,$do) = (0,0,1);
  while($i < $#lines){
    if($lines[$i] eq 'do()'){$do = 1}
    if($lines[$i] eq 'don\'t()'){$do = 0}
    if($lines[$i] =~ /\d+/){
      $sum += $lines[$i++] * $lines[$i] if $do
    }
    $i++
  }
  $sum
}

sub process{
  my ($file) = @_;
  open(my $fh,'<',$file) or die "Can't open file: $!";
  my $str = do{local $/; <$fh>};
  close $fh;
  @lines = $str =~ /(do\(\))|(don't\(\))|mul\((\d+),(\d+)\)/g;
  @lines = grep {defined} @lines
}

process($ARGV[0]);
printf "Part1: %d\n",part1();
printf "Part2: %d\n",part2();

