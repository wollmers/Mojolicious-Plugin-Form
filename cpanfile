requires 'perl', '5.020001';

requires 'Mojolicious', '8.0';

# requires 'Some::Module', 'VERSION';

on test => sub {
    requires 'Test::More', '0.88';
    requires 'Test::Carp', '0';
};
