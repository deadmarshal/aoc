#!/usr/bin/env perl
# https://adventofcode.com/2022/day/8
use strict;
use warnings;
use Data::Show;
use List::Util qw(all);

die "Usage: $0 input.txt" unless @ARGV == 1
  && $ARGV[0] =~ /\w+/;

sub part1{
  my ($file) = @_;
  open(my $fh,'<',$file) or die "Can't open file: $!";
  my ($count,@arr) = (0);
  while(<$fh>){
    chomp;
    push @arr,[split ''];
  }
  foreach my $row(1..$#arr){
    foreach my $col(1..$#{$arr[0]}){
      my $elem = $arr[$row][$col];
      if(all{$_ < $elem} map{$arr[$_][$row]} grep{$_ != $col} 0..$#arr &&
	 all{$_ < $elem} map{$arr[$row][$_]} grep{$_ != $row} 0..$#{$arr[0]}){
	$count++;
      }
    }
  }
  $count
}

sub part2{
  my ($file) = @_;
  
}

printf "Part1: %d\n", part1($ARGV[0]);
printf "Part2: %d\n", part2($ARGV[0]);

