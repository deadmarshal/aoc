#!/usr/bin/env perl
# https://adventofcode.com/2015/day/9
use strict;
use warnings;
use File::Slurp;
use Algorithm::Combinatorics qw(permutations);

die "Usage: $0 input.txt" unless @ARGV == 1
  && $ARGV[0] =~ /\w+/;

my @contents = map{[(split)[0,2,4]]} read_file($ARGV[0]);

sub helper{
  my ($paths,$h) = @_;
  my $distance = 0;
  my $first = shift @$paths;
  while(defined(my $next = shift @$paths)){
    if(exists $h->{$first}{$next}) {
      $distance += $h->{$first}{$next}
    } else {
      return -1
    }
    $first = $next
  }
  $distance
}

sub part1{
  my $shortest = 0;
  my %h;
  foreach(@contents){
    $h{$_->[0]}{$_->[1]} = $_->[2];
    $h{$_->[1]}{$_->[0]} = $_->[2];
    $shortest += $_->[2]
  }
  my $it = permutations([keys %h]);
  while(my $route = $it->next){
    my $d = helper($route,\%h);
    next if $d < 0;
    $shortest = $d if $d < $shortest
  }
  $shortest
}

sub part2{
  my $longest = 0;
  my %h;
  foreach(@contents){
    $h{$_->[0]}{$_->[1]} = $_->[2];
    $h{$_->[1]}{$_->[0]} = $_->[2]
  }
  my $it = permutations([keys %h]);
  while(my $route = $it->next){
    my $d = helper($route,\%h);
    next if $d < 0;
    $longest = $d if $d > $longest
  }
  $longest
}

printf "Part1: %d\n",part1; # 117
printf "Part2: %d\n",part2; # 909

