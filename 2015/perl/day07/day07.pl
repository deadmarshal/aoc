#!/usr/bin/env perl
# https://adventofcode.com/2015/day/7
use strict;
use warnings;
use File::Slurp;

die "Usage: $0 input.txt" unless @ARGV == 1
  && $ARGV[0] =~ /\w+/;

chomp(my @contents = read_file($ARGV[0]));
my (%value,%command);

my $EQUAL  = 1;
my $OR     = 2;
my $AND    = 3;
my $LSHIFT = 4;
my $RSHIFT = 5;
my $NOT    = 6;
my $MAX    = 65535;

sub parse{
  foreach(@contents){
    my ($command,$target) = split /\s*->\s*/;
    if($command =~ /^[0-9]+$/) {
      $value{$target} = 0 + $command
    } elsif($command =~ /^([a-z]+)$/) {
      $command{$target} = [$EQUAL,$1]
    } elsif($command =~ /NOT\s*([0-9]+|[a-z]+)/) {
      $command{$target} = [$NOT,$1]
    } elsif($command =~ /([0-9]+|[a-z]+)\s*(OR|AND|LSHIFT|RSHIFT)
			 \s*([0-9]+|[a-z]+)/x) {
      $command{$target} = [$2 eq 'AND' ? $AND :
			   $2 eq 'OR' ? $OR :
			   $2 eq 'LSHIFT' ? $LSHIFT :
			   $2 eq 'RSHIFT' ? $RSHIFT : die, $1,$3]
    } else {
      die "Failed parsing $_"
    }
  }
}

sub solve{
  my %value = %{$_[0]};
  my %command = %{$_[1]};
  while(1) {
    foreach my $target(keys %command) {
      my ($command,@inputs) = @{$command{$target}};
      next if grep{/[^0-9]/ && !exists $value{$_}} @inputs;
      my @values = map{/[0-9]/ ? $_ : $value{$_}} @inputs;
      if($command == $EQUAL) {
	$value{$target} = $values[0]
      } elsif($command == $NOT) {
	$value{$target} = ~$values[0]
      } elsif($command == $OR) {
	$value{$target} = $values[0] | $values[1]
      } elsif($command == $AND) {
	$value{$target} = $values[0] & $values[1]
      } elsif($command == $LSHIFT) {
	$value{$target} = $values[0] << $values[1]
      } elsif($command == $RSHIFT) {
	$value{$target} = $values[0] >> $values[1]
      } else {
	die "Unknown command $command";
      }
      $value{$target} &= $MAX;
      delete $command{$target};
    }
    last if exists $value{a} || !keys %command
  }
  $value{a}
}

parse();
my $solve1 = solve(\%value,\%command);
printf "Part1: %d\n",$solve1; # 46065
$value{b} = $solve1;
printf "Part2: %d\n",solve(\%value,\%command); # 14134

