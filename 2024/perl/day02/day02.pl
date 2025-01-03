#!/usr/bin/env perl
# https://adventofcode.com/2024/day/2
use strict;
use warnings;
use DDP;
use Data::Show;

die "Usage: $0 input.txt" unless @ARGV == 1
  && $ARGV[0] =~ /\w+/;

my @arr;

sub process{
  my ($file) = @_;
  open(my $fh,'<',$file) or die "Can't open file: $!";
  while(<$fh>){push @arr,[do{chomp; split /\s+/}]}
  close($fh)
}

sub check{
  my ($arr) = @_;
  my $first = join('',@$arr) eq join('',sort{$a <=> $b} @$arr) ||
    join('',@$arr) eq join('',sort{$b <=> $a} @$arr);
  my $second = 1;
  foreach my $i(0..$#$arr-1){
    my $diff = abs($arr->[$i] - $arr->[$i+1]);
    do{$second = 0; last} unless 1 <= $diff <= 3
  }
  $first && $second
}

sub part1{
  my $count = 0;
  map{$count++ if check($arr[$_])} 0..$#arr;
  $count
}

sub part2{
  my $count = 0;
  foreach my $i(0..$#arr){
    my $ok = 0;
    if(!check($arr[$i])){
      foreach my $j(0..$#{$arr[$i]}){
	my @t = (@{$arr[$i]}[0..$j-1],
		 @{$arr[$i]}[$j+1..$#{$arr[$i]}]);
	do{$ok = 1; last} if check(\@t);
      }
    }else{
      $count++
    }
    $count++ if $ok
  }
  $count
}

process($ARGV[0]);
printf "Part1: %d\n",part1($ARGV[0]);
printf "Part2: %d\n",part2($ARGV[0]);

