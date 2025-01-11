#!/usr/bin/env perl
# https://adventofcode.com/2024/day/5
use strict;
use warnings;
use List::Util qw(any);
use Data::Show;

die "Usage: $0 input.txt" unless @ARGV == 1
  && $ARGV[0] =~ /\w+/;

my %before;
my @pages;

sub process{
  my ($file) = @_;
  open(my $fh,'<',$file) or die "Can't open file: $!";
  while(<$fh>){
    chomp;
    next if /^$/;
    if(/(\d+)\|(\d+)/){
      push @{$before{$2}},$1
    }
    else{push @pages,[split ',']}
  }
  close $fh;
}

sub good{
  my ($arr) = @_;
  foreach my $i(0..$#$arr){
    foreach my $j($i+1..$#$arr){
      return 0 if any{$_ == $before{$arr->[$j]}}
	@{$before{$arr->[$i]}}
    }
  }
  1
}

sub part1{
  my $sum = 0;
  foreach(@pages){
    $sum += $_->[@$_/2] if good($_)
  }
  $sum
}

sub part2{
  0
}

process($ARGV[0]);
print show %before;
#print show @pages;
printf "Part1: %d\n",part1();
printf "Part2: %d\n",part2();

