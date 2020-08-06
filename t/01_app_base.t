use strict;
use warnings;

use lib qw( ../lib t/lib lib);

use MyApp;
use Data::Dumper;

use Test::More;
END { done_testing(); }

use Test::Carp;

use Test::Mojo;

use_ok('MyApp');

my $t = Test::Mojo->new(MyApp->new);

ok($t,'MyApp new');

my $schema = $t->app->schema;

ok($schema, 'MyApp schema');

my @sources = $schema->sources;

is(scalar(@sources),2, 'scalar @sources');

my $source = $sources[0];

ok($source, 'MyApp source');

#my $table = $schema->class($source)->table;

ok($schema->class($source)->table, 'MyApp table');

#my $form_handler = $t->app->form_handler('Foo');

ok($t->app->form_handler('Foo'), 'MyApp form_handler');

ok($t->app->form_handler('Foo',{a => 1}), 'MyApp form_handler with params');

ok($t->app->form_handler('foo'), 'MyApp form_handler lowercase');

does_croak( sub { $t->app->form_handler('Blah') } );

#does_croak( sub { $t->app->form_handler('Defect') } );

does_croak( sub { $t->app->form_handler() } );



