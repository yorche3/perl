package DataStructuresAdvanced::Graph;

use strict;
use warnings;

# new() -> Graph; vertex labels are integers.
sub new {
    my ($class) = @_;
    my $self = { vertices => undef, vertex_count => 0, edge_count => 0 };
    return bless $self, $class;
}

sub _find_vertex {
    my ($self, $label) = @_;
    my $current = $self->{vertices};
    while (defined $current) {
        if ($current->value == $label) {
            return $current;
        }
        $current = $current->{next_vertex};
    }
    return undef;
}

# add_vertex(), add_edge() and has_edge() return 1 for success, 0 for failure.
sub add_vertex {
    my ($self, $label) = @_;
    return 1 if defined $self->_find_vertex($label);
    my $new_vertex = DataStructuresAdvanced::GraphNode->new(value => $label);
    $new_vertex->{next_vertex} = $self->{vertices};
    $self->{vertices} = $new_vertex;
    $self->{vertex_count}++;
    return 1;
}

sub add_edge {
    my ($self, $u, $v) = @_;
    my $vertex_u = $self->_find_vertex($u);
    return 0 if !defined $vertex_u;
    my $vertex_v = $self->_find_vertex($v);
    return 0 if !defined $vertex_v;

    my $neighbors = $vertex_u->{neighbors};
    for my $neighbor (@$neighbors) {
        return 1 if $neighbor->value == $v;
    }

    my $pos = 0;
    $pos++ while $pos < @$neighbors && $neighbors->[$pos]->value < $v;
    splice @$neighbors, $pos, 0, $vertex_v;
    $self->{edge_count}++;
    return 1;
}

sub has_edge {
    my ($self, $u, $v) = @_;
    my $vertex_u = $self->_find_vertex($u);
    return 0 if !defined $vertex_u;
    my $neighbors = $vertex_u->{neighbors};
    for my $neighbor (@$neighbors) {
        return 1 if $neighbor->value == $v;
    }
    return 0;
}

# get_neighbors() returns an independent array reference, or undef on failure.
sub get_neighbors {
    my ($self, $u) = @_;
    my $vertex_u = $self->_find_vertex($u);
    return undef if !defined $vertex_u;
    my @neighbors = map { $_->value } @{$vertex_u->{neighbors}};
    return \@neighbors;
}

# is_empty() returns a boolean; counts return integers.
sub is_empty {
    my ($self) = @_;
    return $self->{vertex_count} == 0;
}

sub vertex_count {
    my ($self) = @_;
    return $self->{vertex_count};
}

sub edge_count {
    my ($self) = @_;
    return $self->{edge_count};
}

1;
