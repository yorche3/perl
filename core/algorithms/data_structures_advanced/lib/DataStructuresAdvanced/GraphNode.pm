package DataStructuresAdvanced::GraphNode;

use strict;
use warnings;
use parent 'DataStructuresAdvanced::Node';

# Internal constructor: new(value => $label) -> GraphNode.
sub new {
    my ($class, %args) = @_;
    my $self = $class->SUPER::new(%args);
    $self->{neighbors} = [];
    $self->{next_vertex} = undef;
    return $self;
}

1;
