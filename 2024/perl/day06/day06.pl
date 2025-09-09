#!/usr/bin/env perl
# https://adventofcode.com/2024/day/6
use strict;
use warnings;
use Data::Show;
use constant {
  N => 0,
  E => 1,
  S => 2,
  W => 3,
};

die "Usage: $0 input.txt" unless @ARGV == 1
  && $ARGV[0] =~ /\w+/;

my %dims = (x => 0, y => 0);
my %g = (dir => N,x => 0, y => 0); # guard
my %grid;

sub within{
  my ($x,$y) = @_;
  $x >= $0 && $x <= $dims{x} &&
    $y >= 0 && $y <= $dims{y}
}

sub process{
  my ($file) = @_;
  open(my $fh,'<',$file) or die "Can't open file: $!";
  while(<$fh>){
    chomp;
    if(/\^/) {
      $g{x} = $.-1;
      $g{y} = index($_,'^')
    }
    foreach my $j(0..length($_)-1) {
      $grid{$.-1 . ",$j"} = substr($_,$j,1);
      $dims{y} = $j
    }
    $dims{x} = $.-1;
  }
  close $fh;
}

sub step{
  my $sum = 0;
  if($g{dir} eq N) {
    if(within($g{x},$g{y}) &&
       within($g{x}-1,$g{y}) &&
       $grid{"$g{x},$g{y}+1"} ne '#'){
      $grid{"$g{x},$g{y}"} = '.';
      $grid{"$g{x}-1,$g{y}"} = '^';
      return 1
    } elsif() {
      $g{dir} = E;
      $grid{"$g{x},$g{y}"} = '.';
      $grid{"$g{x},$g{y}+1"} = '^';      
    }
  } elsif($g{dir} eq E) {
    
  } elsif($g{dir} eq W) {
    
  } elsif($g{dir} eq S) {
    
  }
  else {
    return 0
  }
}

sub part1{
  0
}

sub part2{
  0
}

process($ARGV[0]);
printf "Part1: %d\n",part1();
printf "Part2: %d\n",part2();

