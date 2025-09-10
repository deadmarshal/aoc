#!/usr/bin/env perl
# https://adventofcode.com/2015/day/6
use strict;
use warnings;
use List::Util qw(sum0);
use File::Slurp;

die "Usage: $0 input.txt" unless @ARGV == 1
  && $ARGV[0] =~ /\w+/;

chomp(my @lines = read_file($ARGV[0]));

my @arr = parse();

sub parse{
  my @arr;
  foreach(@lines){
    my %h;
    if(/(on|off|toggle) (\d+),(\d+) through (\d+),(\d+)/){
      $h{command} = $1;
      $h{x1} = $2;
      $h{y1} = $3;
      $h{x2} = $4;
      $h{y2} = $5
    }
    push @arr,\%h; 
  }
  @arr
}

sub part1{
  my @LIGHTS = (0) x (1000 * 1000);
  foreach my $command(@arr){
    for(my $x = $command->{x1}; $x <= $command->{x2}; $x++){
      for(my $y = $command->{y1}; $y <= $command->{y2}; $y++){
	my $i = 1000 * $x + $y;
	$LIGHTS[$i] = 1 if $command->{command} eq 'on';
	$LIGHTS[$i] = 0 if $command->{command} eq 'off';
	$LIGHTS[$i] = !$LIGHTS[$i]
	  if $command->{command} eq 'toggle'
      }
    }
  }
  sum0 @LIGHTS
}

sub part2{
  my @LIGHTS = (0) x (1000 * 1000);
  foreach my $command(@arr){
    for(my $x = $command->{x1}; $x <= $command->{x2}; $x++){
      for(my $y = $command->{y1}; $y <= $command->{y2}; $y++){
	my $i = 1000 * $x + $y;
	$LIGHTS[$i]++  if $command->{command} eq 'on';
	$LIGHTS[$i]-- if $command->{command} eq 'off'
	  && $LIGHTS[$i] > 0;
	$LIGHTS[$i] += 2 if $command->{command} eq 'toggle'
      }
    }
  }
  sum0 @LIGHTS
}

printf "Part1: %d\n",part1; # 569999
printf "Part2: %d\n",part2; # 17836115

