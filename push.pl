use strict;
use warnings;
use feature qw/say/;

my $message;

system "git status";
sleep 2;
system "clear";
system "git add .";
say "Commit message?";
chomp($message = <STDIN>);
if (defined $message){
  system "git commit -m $message";
  system "git push";
}
else{
  die "No message provided!";
}
