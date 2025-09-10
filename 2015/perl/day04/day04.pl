#!/usr/bin/env perl
# https://adventofcode.com/2015/day/4
use strict;
use warnings;
use File::Slurp;
use Digest::MD5 qw(md5_hex);

die "Usage: $0 input.txt" unless @ARGV == 1
  && $ARGV[0] =~ /\w+/;

chomp(my $s = read_file($ARGV[0]));

sub solve{
  my ($n) = @_;
  my $c = 0;
  my $z = '0' x $n;
  while(1){
    my $hash = md5_hex($s . $c);
    last if $hash =~ /^$z/x;
    $c++
  }
  $c
}

printf "Part1: %d\n",solve(5); # 117946
printf "Part2: %d\n",solve(6); # 3938038

