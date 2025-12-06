#!/usr/bin/env perl
# https://adventofcode.com/2025/day/3
use strict;
use warnings;
use List::Util qw(max);

die "Usage: $0 input.txt" unless @ARGV == 1 && $ARGV[0] =~ /\w+/;

my @lines;

sub process{
  my ($filename) = @_;
  open my $fh,'<',$filename or die "Can't open file: $!";
  while(<$fh>){
    chomp;
    push @lines,$_;
  }
  close $fh;
}

sub part1{
  my $c = 0;
  foreach my $i(0..$#lines) {
    my $best = 0;
    foreach my $j($i+1..length($lines[$i])-1) {
      my $score = substr($lines[$i],$i,1) . substr($lines[$i],$j,1);
      $best = max($best,$score)
    }
    $c += $best;
  }
  $c
}

# while(<$fh>) {
#   chomp;
#   my $best = 0;
#   foreach my $i(0..length $_) {
#     foreach my $j($i+1..length($_)-1) {
#       my $score = substr($_,$i,1) . substr($_,$j,1);
#       $best = max($best,$score)
#     }
#   }
#   $p1 += $best;
# }

sub part2{
  1
}

process($ARGV[0]);

printf "Part1: %d\n",part1; # 17244
printf "Part2: %d\n",part2; # 

