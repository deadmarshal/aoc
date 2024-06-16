#!/usr/bin/env perl
# https://adventofcode.com/2020/day/7
use strict;
use warnings;
use Graph::Directed;
use Data::Show;

die "Usage: $0 input.txt" unless @ARGV == 1
  && $ARGV[0] =~ /\w+/;

sub parse_file{
  my ($file) = @_;
  open(my $fh,'<',$file) or die "Can't open file: $!";
  my %h;
  while(<$fh>){
    chomp;
    my @arr = split 'contain';
    my $color = (split 'bags',$arr[0])[0] =~ s/\s+$//r;
    if($arr[1] ne " no other bags."){
      foreach my $child(split ',',$arr[1]){
	$child =~ /([0-9]+) (.*) bags?/;
	push @{$h{$color}},[$2,$1];
      }
    }
  }
  %h
}

sub part1{
  my ($file) = @_;
  my %h = parse_file($file);
  1;
}

sub part2{
  my ($file) = @_;
  my %h = parse_file($file);
  1;
}

printf "Part1: %d\n", part1($ARGV[0]);
# printf "Part2: %d\n", part2($ARGV[0]);

