#!/usr/bin/env perl
# https://adventofcode.com/2025/day/2
use strict;
use warnings;

die "Usage: $0 input.txt" unless @ARGV == 1 && $ARGV[0] =~ /\w+/;

my @ids;

sub process{
  my ($filename) = @_;
  open my $fh,'<',$filename or die "Can't open file: $!";
  while(<$fh>){
    my @range = split ',',$_;
    foreach(@range){
      push @ids,[$1,$2] if /(\d+)\-(\d+)/  
    }
  }
  close $fh;
}

sub twice{
  my ($str) = @_;
  return 0 if(length($str) % 2 != 0);
  my $mid = length($str) / 2;
  my $x = substr($str,0,$mid);
  my $y = substr($str,$mid);
  $x eq $y
}

sub part1{
  my $c = 0;
  foreach my $id(@ids) {
    foreach($id->[0]..$id->[1]){
      $c += $_ if twice $_
    }
  }
  $c
}

sub helper {
  my ($id) = @_;
  my $n = length $id;

  return 1 if $n <= 1;

  foreach my $k(2..$n) {
    if ($n % $k == 0) {
      my $ok = 1;
      my $sz = $n / k;
      my $i = 0;
      while($i < $n) {
	if(substr($id,$i,$i+$sz) eq substr($id,$sz)) {
	  ok = 0
	}
	$i += $sz
      }
      return 1 if $ok;
    }
   }
  return 1;
}

sub part2{
  my $c = 0;
  foreach my $id(@ids) {
    foreach($id->[0]..$id->[1]){
      $c += $_ if helper $_
    }
  }
  $c  
}

process($ARGV[0]);
printf "Part1: %d\n",part1; # 31210613313
printf "Part2: %d\n",part2; # 

