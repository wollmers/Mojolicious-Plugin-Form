requires 'perl', '5.010001';

requires 'Mojolicious', '6.10';

# requires 'Some::Module', 'VERSION';

on test => sub {
    requires 'Test::More', '0.88';
    requires 'Test::Carp', '0';
};
