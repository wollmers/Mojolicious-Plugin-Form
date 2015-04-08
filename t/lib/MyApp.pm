package MyApp;
use Mojo::Base 'Mojolicious';

has db => sub {
  my $self         = shift;

  my $schema = MySchema->new(
    'entries' => {
      'Foo' => MySchema::Class->new(table => 'foo'),
      'Bar' => MySchema::Class->new(table => 'bar'),
    },
  );
  return $schema;
};

sub startup {
  my $app = shift;

  $app->plugin('Mojolicious::Plugin::Form');
  
  $app->helper(schema => sub { shift->app->db });
  
  my $routes = $app->routes;
  $routes->any('/' => sub { shift->render(text => 'Hello World.') } );
  #$routes->any('/dbinfo' => sub { shift->render } );
}

package MySchema;
use Mojo::Base -base;

has 'entries';

sub sources {
  my $self = shift;
  my @sources = (keys %{$self->entries});
  #return (keys %{$self->entries});
  return @sources;
};

sub class {
  my $self = shift;
  my $source = shift;
  return $self->entries->{$source};
};

package MySchema::Class;
use Mojo::Base -base;

has 'table'; 

package MyApp::Form;
use Mojo::Base 'Mojolicious::Plugin::Form::Base';

package MyApp::Form::Foo;
use Mojo::Base 'MyApp::Form';

package MyApp::Form::Bar;
use Mojo::Base 'MyApp::Form';

1;
