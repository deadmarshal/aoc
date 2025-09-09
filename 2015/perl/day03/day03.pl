#!/usr/bin/env perl
# https://adventofcode.com/2015/day/3
use strict;
use warnings;
use File::Slurp;
use Set::Scalar;
use Data::Show;

die "Usage: $0 input.txt" unless @ARGV == 1
  && $ARGV[0] =~ /\w+/;

chomp(my $s = read_file($ARGV[0]));
my @contents = split '',$s;

sub move{
  my ($start,$c) = @_;
  my $new = $start;
  if($c eq '^') {
    $start = $new->{y}++
  } elsif($c eq '>') {
    $start = $new->{x}++
  } elsif($c eq '<') {
    $start = $new->{x}--
  } elsif($c eq 'v') {
    $start = $new->{y}--
  }
}

sub part1{
  my $santa = {x => 0, y => 0};
  my $s = Set::Scalar->new();
  foreach(@contents){
    move($santa,$_);
    $s->insert("$santa->{x}x$santa->{y}")
  }
  $s->size
}

sub part2{
  my ($i,$santa,$robo) = (0,{x => 0, y => 0},{x => 0, y => 0});
  my ($s,$s2) = (Set::Scalar->new,Set::Scalar->new);
  foreach(@contents){
    if($i % 2 == 0) {
      move($santa,$_);
      $s->insert("$santa->{x}x$santa->{y}")
    } else {
      move($robo,$_);
      $s->insert("$robo->{x}x$robo->{y}")
    }
    $i++
  }
  ($s + $s2)->size
}

printf "Part1: %d\n",part1; # 2565
printf "Part2: %d\n",part2; # 2639

