#!/usr/bin/env perl
# https://adventofcode.com/2024/day/5
use strict;
use warnings;

die "Usage: $0 input.txt" unless @ARGV == 1
  && $ARGV[0] =~ /\w+/;

my %rules;
my (@pages,@sorted);

sub process{
  my ($file) = @_;
  open(my $fh,'<',$file) or die "Can't open file: $!";
  while(<$fh>){
    chomp;
    next if /^$/;
    if(/(\d+)\|(\d+)/){
      $rules{$1}{$2} = -($rules{$2}{$1} = 1)
    }
    else{
      my @l = (/[0-9]+/g);
      push @pages, \@l;
      push @sorted,[sort {$rules{$a}{$b}} @l]
    }
  }
  close $fh;
}

sub part1{
  my $sum = 0;
  foreach my $i(0..$#pages) {
    $sum += $pages[$i][@{$pages[$i]}/2]
      if (join '',@{$pages[$i]}) eq (join '',@{$sorted[$i]})
  }
  $sum
}

sub part2{
  my $sum = 0;
  foreach my $i(0..$#pages) {
    $sum += $sorted[$i][@{$sorted[$i]}/2]
      if (join '',@{$pages[$i]}) ne (join '',@{$sorted[$i]})
  }
  $sum
}

process($ARGV[0]);
printf "Part1: %d\n",part1();
printf "Part2: %d\n",part2();

