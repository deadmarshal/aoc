#!/usr/bin/env perl
# https://adventofcode.com/2024/day/4
use strict;
use warnings;

die "Usage: $0 input.txt" unless @ARGV == 1
  && $ARGV[0] =~ /\w+/;

my @arr;

sub process{
  my ($file) = @_;
  open(my $fh,'<',$file) or die "Can't open file: $!";
  while(<$fh>){
    push @arr,[do{chomp; split ''}]
  }
  foreach my $i(0..$#arr){
    foreach my $j(0..$#{$arr[$i]}){
      if($arr[$i][$j] eq 'X') {$arr[$i][$j] = 1;}
      if($arr[$i][$j] eq 'M') {$arr[$i][$j] = 2;}
      if($arr[$i][$j] eq 'A') {$arr[$i][$j] = 3;}
      if($arr[$i][$j] eq 'S') {$arr[$i][$j] = 4}
    }
  }
  close($fh);
  @arr
}

sub check1{
  my ($grid,$x,$y,$dx,$dy,$val) = @_;
  return 0 if $x < 0 || $y < 0 || @$grid <= $y ||
    @{$grid->[$y]} <= $x || $grid->[$y][$x] != $val;
  return 1 if $val == 4;
  return 1 if check1($grid,$x + $dx, $y + $dy, $dx, $dy, ++$val);
  0
}

sub part1{
  my $count = 0;
  foreach my $y(0..$#arr){
    foreach my $x(0..@{$arr[0]}){
      $count++ if check1(\@arr,$x,$y,1,0,1);
      $count++ if check1(\@arr,$x,$y,1,-1,1);
      $count++ if check1(\@arr,$x,$y,1,1,1);

      $count++ if check1(\@arr,$x,$y,-1,0,1);
      $count++ if check1(\@arr,$x,$y,-1,-1,1);
      $count++ if check1(\@arr,$x,$y,-1,1,1);

      $count++ if check1(\@arr,$x,$y,0,-1,1);
      $count++ if check1(\@arr,$x,$y,0,1,1)
    }
  }
  $count
}

sub check2{
  my ($grid,$x,$y,$dx,$dy,$val) = @_;
  return 0 if $x-1 < 0 || $y-1 < 0 || @$grid <= $y+1 ||
    @{$grid->[$y]} <= $x+1 || $grid->[$y][$x] != $val;
  # M M
  #  A
  # S S
  return 1 if $grid->[$y-1][$x-1] == 2 && $grid->[$y-1][$x+1] == 2 &&
    $grid->[$y+1][$x-1] == 4 && $grid->[$y+1][$x+1] == 4;
  # S S
  #  A
  # M M
  return 1 if $grid->[$y-1][$x-1] == 4 && $grid->[$y-1][$x+1] == 4 &&
    $grid->[$y+1][$x-1] == 2 && $grid->[$y+1][$x+1] == 2;
  # M S
  #  A
  # M S
  return 1 if $grid->[$y-1][$x-1] == 2 && $grid->[$y-1][$x+1] == 4 &&
    $grid->[$y+1][$x-1] == 2 && $grid->[$y+1][$x+1] == 4;
  # S M
  #  A
  # S M
  return 1 if $grid->[$y-1][$x-1] == 4 && $grid->[$y-1][$x+1] == 2 &&
    $grid->[$y+1][$x-1] == 4 && $grid->[$y+1][$x+1] == 2;
  0
}

sub part2{
  my $count = 0;
  foreach my $y(0..$#arr){
    foreach my $x(0..@{$arr[0]}){
      $count++ if check2(\@arr,$x,$y,1,0,3)
    }
  }
  $count
}

process($ARGV[0]);
printf "Part1: %d\n",part1();
printf "Part2: %d\n",part2();

