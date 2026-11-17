package DataStructuresAdvanced::TreeNode;

use strict;
use warnings;
use parent 'DataStructuresAdvanced::Node';

# new(value => $value) -> TreeNode; value() is inherited.
sub new {
    my ($class, %args) = @_;
    my $self = $class->SUPER::new(%args);
    $self->{left} = undef;
    $self->{right} = undef;
    return $self;
}

# left() and right() -> TreeNode or undef.
sub left {
    my ($self) = @_;
    return $self->{left};
}

sub right {
    my ($self) = @_;
    return $self->{right};
}

# set_left($node) and set_right($node) accept a TreeNode or undef.
sub set_left {
    my ($self, $node) = @_;
    $self->{left} = $node;
}

sub set_right {
    my ($self, $node) = @_;
    $self->{right} = $node;
}

1;
