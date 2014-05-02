requires 'perl', '5.010001';

requires 'Mojolicious', '4.0';

# requires 'Some::Module', 'VERSION';

on test => sub {
    requires 'Test::More', '0.88';
    requires 'DBD::SQLite', '0';
    requires 'DBIx::Class', '0';
    requires 'DBIx::Class::Schema', '0';
};
