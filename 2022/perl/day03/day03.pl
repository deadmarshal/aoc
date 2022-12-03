#!/usr/bin/env perl
# https://adventofcode.com/2022/day/3
use strict;
use warnings;
use List::Compare;

die "Usage: ./day03.pl input.txt" unless @ARGV == 1
  && $ARGV[0] =~ /\w+/;

sub part1{
  my ($file) = @_;
  open(my $fh,'<',$file) or die "Can't open file: $!";
  my ($sum,$i,%priorities,$arr) = (0,1);
  $priorities{$_} = $i++ foreach('a'..'z','A'..'Z');
  while(<$fh>){
    chomp;
    push @$arr, [substr($_,0,int(length)/2),
		 substr($_,int(length)/2,length)];
  }
  close $fh;
  foreach(@$arr){
    my $lc = List::Compare->new([split '',$_->[0]],
				[split '',$_->[1]]);
    my @intersection = $lc->get_intersection;
    $sum += $priorities{$intersection[0]};
  }
  $sum;
}

sub part2{
  my ($file) = @_;
  open(my $fh,'<',$file) or die "Can't open file: $!";
  my ($sum,$i,%priorities,$arr) = (0,1);
  $priorities{$_} = $i++ foreach('a'..'z','A'..'Z');
  while(my @block = grep defined, map {scalar <$fh>} 1..3){
    @block = map {chomp; [split '',$_]} @block;
    my $lc = List::Compare->new(@block);
    my @intersection = $lc->get_intersection;
    $sum += $priorities{$intersection[0]};
  }
  close $fh;
  $sum;
}

printf "Part1: %d\n", part1($ARGV[0]);
printf "Part2: %d\n", part2($ARGV[0]);

