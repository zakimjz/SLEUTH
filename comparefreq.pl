#!/usr/bin/perl
use strict;

open(IN1, $ARGV[0]) || die "cannot open $!\n";
open(IN2, $ARGV[1]) || die "cannot open $!\n";

my %tree = ();
readin(*IN1,1);
readin(*IN2,2);

for my $k (sort mycmp keys %tree){
  if ($tree{$k} < 3){
    print "$k ---- $tree{$k}\n";
  }
}

sub readin{
  my $in = shift;
  my $val = shift;
  while(<$in>){
    #print $_;
    chomp;
    my @l = split(' ');
    if ($l[0] =~ /^F/) {last;}
    elsif ($l[0] =~ /^M/ || $l[0] =~ /^D/) {next;}
    my $i;
    for ($i=0; $i <= $#l; $i++){
      if ($l[$i] =~ /^-/ && $l[$i] != -1) { last; }
    }
    $i--;
    my $ll = join('.',@l[0..$i]);
    $tree{$ll} += $val;
    #print "$val ---- $ll --- $tree{$ll} --- $i\n";
  }
}

sub mycmp{
  #print "CMP $a, $b\n";
  my @A = split('\.',$a);
  my @B = split('\.',$b);

  #print "CMP @A -- @B\n";
  my $i, my $j;
  my $acnt = 0;
  my $bcnt = 0;
  for $i (@A){
    if ($i != -1){ $acnt++;}
  }
  for $i (@B){
    if ($i != -1){ $bcnt++;}
  }
  if ($acnt < $bcnt){ return -1;}
  elsif ($acnt > $bcnt){ return 1;}
  else{
    for ($i=0, $j=0; $i <= $#A && $j <= $#B; $i++, $j++){
      if ($A[$i] < $B[$j]){ return -1;}
      elsif ($A[$i] > $B[$j]){ return 1;}
    }
    return 0;
  }
}
