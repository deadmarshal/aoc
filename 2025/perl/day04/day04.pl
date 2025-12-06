#!/usr/bin/env perl
# https://adventofcode.com/2025/day/4
use strict;
use warnings;

die "Usage: $0 input.txt" unless @ARGV == 1 && $ARGV[0] =~ /\w+/;

my @grid;

sub process{
  my ($filename) = @_;
  open my $fh,'<',$filename or die "Can't open file: $!";
  while(<$fh>){
    chomp;
    push @grid,[split '',$_];
  }
  close $fh;
}

sub part1{
  my ($row,$col) = (scalar @grid,scalar @{$grid[0]});
  my $count = 0;
  foreach my $r(0..$row-1){
    foreach my $c(0..$col-1){
      my $nbr = 0;
      foreach my $dr(-1,0,1){
	foreach my $dc(-1,0,1){
	  my ($rr,$cc) = ($r + $dr,$c + $dc);
	  $nbr++ if((0 <= $rr < $row) &&
		    (0 <= $cc < $col) &&
		    ($grid[$rr][$cc] eq '@'));
	}
      }
      $count++ if($grid[$r][$c] eq '@' && $nbr < 5);
    }
  }
  $count
}

sub part2{
  my ($row,$col) = (scalar @grid,scalar @{$grid[0]});
  my ($count,$first) = (0,1);
  while(1) {
    my $changed = 0;
    foreach my $r(0..$row-1){
      foreach my $c(0..$col-1){
	my $nbr = 0;
	foreach my $dr(-1,0,1){
	  foreach my $dc(-1,0,1){
	    my ($rr,$cc) = ($r + $dr,$c + $dc);
	    $nbr++ if((0 <= $rr < $row) &&
		      (0 <= $cc < $col) &&
		      ($grid[$rr][$cc] eq '@'));
	  }
	}
	if($grid[$r][$c] eq '@' && $nbr < 5){
	  $changed = 1;
	  unless($first){
	    $count++;
	    $grid[$r][$c] = '.'
	  }
	}
      }
    }
    $first = 0 if($first);
    last unless $changed;
  }
  $count
}

process($ARGV[0]);
printf "Part1: %d\n",part1; # 1587
printf "Part2: %d\n",part2; # 8946

