#!/usr/bin/env perl
# https://adventofcode.com/2025/day/5
use strict;
use warnings;
use Data::Show;
use List::Util qw(max any);

die "Usage: $0 input.txt" unless @ARGV == 1 && $ARGV[0] =~ /\w+/;

my @ranges;
my @ids;

sub process{
  my ($filename) = @_;
  open my $fh,'<',$filename or die "Can't open file: $!";
  while(<$fh>){
    next if /^$/;
    chomp;
    if(/(\d+)\-(\d+)/) {
      push @ranges,[$1,$2]
    } else {
      push @ids,$_
    }
  }
  close $fh;
}

sub part1{
  my $c = 0;
  foreach my $id(@ids){
    $c++ if(any {$_->[0] <= $id <= $_->[1]} @ranges);
  }
  $c
}

sub merge{
  my ($arr) = @_;
  @$arr = sort {$a->[0] <=> $b->[0]} @$arr;
  my @res = $arr->[0];
  foreach my $i(1..$#$arr) {
    my $last = $res[-1];
    my $curr = $arr->[$i];
    if($curr->[0] <= $last->[1]) {
      $last->[1] = max($last->[1],$curr->[1])
    } else {
      push @res,$curr
    }
  }
  @res
}

sub part2{
  my $c = 0;
  @ranges = merge \@ranges;
  foreach(@ranges){
    $c += $_->[1] - $_->[0] + 1;
  }
  $c
}

process($ARGV[0]);
printf "Part1: %d\n",part1; # 613
printf "Part2: %d\n",part2; # 336495597913098

