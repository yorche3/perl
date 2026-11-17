package DataStructuresAdvanced::BinaryTree;

use strict;
use warnings;

# new() -> BinaryTree; values are integers.
sub new {
    my ($class) = @_;
    return bless { root => undef, count => 0 }, $class;
}

# insert() and contains() return 1 for success, 0 for failure.
sub insert {
    my ($self, $value) = @_;
    if (!defined $self->{root}) {
        $self->{root} = DataStructuresAdvanced::TreeNode->new(value => $value);
        $self->{count}++;
        return 1;
    }
    my $current = $self->{root};
    while (1) {
        my $v = $current->value;
        if ($value == $v) {
            return 1;
        }
        my $child = $value < $v ? $current->left : $current->right;
        if (!defined $child) {
            my $new_node =
              DataStructuresAdvanced::TreeNode->new(value => $value);
            if ($value < $v) {
                $current->set_left($new_node);
            } else {
                $current->set_right($new_node);
            }
            $self->{count}++;
            return 1;
        }
        $current = $child;
    }
}

sub contains {
    my ($self, $value) = @_;
    my $current = $self->{root};
    while (defined $current) {
        my $v = $current->value;
        if ($value == $v) {
            return 1;
        } elsif ($value < $v) {
            $current = $current->left;
        } else {
            $current = $current->right;
        }
    }
    return 0;
}

# is_empty() returns a boolean; size() returns an integer.
sub is_empty {
    my ($self) = @_;
    return $self->{count} == 0;
}

sub size {
    my ($self) = @_;
    return $self->{count};
}

1;
