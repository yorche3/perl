package DataStructuresAdvanced::TreeNode;

use strict;
use warnings;
use parent 'DataStructuresAdvanced::Node';

# new(value => $value) -> TreeNode; value() is inherited.
sub new {
    my ($class, %args) = @_;
    return undef;
}

# left() and right() -> TreeNode or undef.
sub left {
    my ($self) = @_;
    return undef;
}

sub right {
    my ($self) = @_;
    return undef;
}

# set_left($node) and set_right($node) accept a TreeNode or undef.
sub set_left {
    my ($self, $node) = @_;
    return undef;
}

sub set_right {
    my ($self, $node) = @_;
    return undef;
}

1;
