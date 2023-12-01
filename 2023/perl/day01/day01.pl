#!/usr/bin/env perl
# https://adventofcode.com/2023/day/1
use strict;
use warnings;

die "Usage: $0 input.txt" unless @ARGV == 1
  && $ARGV[0] =~ /\w+/;

sub part1{
  my ($file) = @_;
  open(my $fh,'<',$file) or die "Can't open file: $!";
  my $sum = 0;
  while(<$fh>){
    my @m = /\d/g;
    $sum += $m[0].$m[-1]
  }
  close($fh);
  $sum
}

sub part2{
  my ($file) = @_;
  open(my $fh,'<',$file) or die "Can't open $file: $!";
  my $sum = 0;
  my @numbers = (['zero',0],['one',1],['two',2],['three',3],['four',4],
		 ['five',5],['six',6],['seven',7],['eight',8],
		 ['nine',9]);
  while(my $line = <$fh>){
    my ($f,$l);
    my $idx = 0;
    while(my ($i,$ref) = each @numbers){
      last if defined $f && defined $l;
      if(index($line,$ref->[0],$idx) != -1){
	$f = $ref->[1];
	$idx = $i;
	#$line =~ s/$ref->[0]//;
	$line = substr $line,0,$idx;
      }
    }
    print "$line\t$f\t$l\n";
    #$sum += $f . $l;
  }
  close($fh);
  $sum
}

#printf "Part1: %d\n",part1($ARGV[0]);
printf "Part2: %d\n",part2($ARGV[0]);

