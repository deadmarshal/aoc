#!/usr/bin/env perl
# https://adventofcode.com/2024/day/1
use strict;
use warnings;
use List::Util qw(zip sum0);

die "Usage: $0 input.txt" unless @ARGV == 1
  && $ARGV[0] =~ /\w+/;

sub part1{
  my ($file) = @_;
  open(my $fh,'<',$file) or die "Can't open file: $!";
  my (@left,@right);
  while(<$fh>){
    my ($l,$r) = do{chomp; split /\s+/};
    push @left,$l;
    push @right,$r
  }
  close($fh);
  @left = sort{$a <=> $b} @left;
  @right = sort{$a <=> $b} @right;
  sum0 map {abs $_->[0] - $_->[1]} zip \@left,\@right;
}

sub part2{
  my ($file) = @_;
  open(my $fh,'<',$file) or die "Can't open file: $!";
  my (@left,@right,%h,$res);
  while(<$fh>){
    my ($l,$r) = do{chomp; split /\s+/};
    push @left,$l;
    push @right,$r
  }
  close($fh);
  $h{$_}++ foreach @right;
  $res = sum0 map {$_ * ($h{$_} || 0)} @left;
  $res
}

printf "Part1: %d\n",part1($ARGV[0]);
printf "Part2: %d\n",part2($ARGV[0]);

