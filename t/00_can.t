use strict;
use warnings;
use Test::More;

use lib qw( ../lib );

my @modules = qw(
  
  Mojolicious::Plugin::Form
  Mojolicious::Plugin::Form::Base

  
);

for my $module (@modules) {
  use_ok($module);
}

for my $module (@modules) {
  can_ok($module, qw(new));
}

done_testing;
