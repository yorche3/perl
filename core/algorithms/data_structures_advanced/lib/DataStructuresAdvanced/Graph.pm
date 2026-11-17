package DataStructuresAdvanced::Graph;

use strict;
use warnings;

# new() -> Graph; vertex labels are integers.
sub new {
    my ($class) = @_;
    return undef;
}

# add_vertex(), add_edge() and has_edge() return 1 for success, 0 for failure.
sub add_vertex {
    my ($self, $label) = @_;
    return undef;
}

sub add_edge {
    my ($self, $u, $v) = @_;
    return undef;
}

sub has_edge {
    my ($self, $u, $v) = @_;
    return undef;
}

# get_neighbors() returns an independent array reference, or undef on failure.
sub get_neighbors {
    my ($self, $u) = @_;
    return undef;
}

# is_empty() returns a boolean; counts return integers.
sub is_empty {
    my ($self) = @_;
    return undef;
}

sub vertex_count {
    my ($self) = @_;
    return undef;
}

sub edge_count {
    my ($self) = @_;
    return undef;
}

1;
