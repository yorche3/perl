package DataStructuresAdvanced::Node;

use strict;
use warnings;

# new(value => $value) -> Node; value() -> integer.
sub new {
    my ($class, %args) = @_;
    return bless { value => $args{value} }, $class;
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

1;
