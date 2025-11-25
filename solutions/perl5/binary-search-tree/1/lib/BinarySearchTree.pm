use v5.40;
use experimental qw<class>;

class BinarySearchTree;

field $root :param;

method add ($data) {
    my $current_node = $root;

    while (1) {
        if ($current_node->data > $data) {
            if (defined($current_node->left)) {
                $current_node = $current_node->left;
            } else {
                $current_node->insert_left(BinarySearchTree::Node->new(data => $data)); 
                last;
            }
        } else {
            if (defined($current_node->right)) {
                $current_node = $current_node->right;
            } else {
                $current_node->insert_right(BinarySearchTree::Node->new(data => $data)); 
                last;
            }
        }
    }

    return;
}

method sort () {
    my @ret;
    $self->_collect($root, \@ret);

    return \@ret;
}

method _collect($node, $vals) {
    return if !defined($node);

    $self->_collect($node->left, $vals);
    push(@$vals, $node->data);
    $self->_collect($node->right, $vals);

    return;
}

class BinarySearchTree::Node {
    field $data :reader :param;
    field $left :reader;
    field $right :reader;

    method insert_left($node) {
        $left = $node;
        return;
    }

    method insert_right($node) {
        $right = $node;
        return;
    }
}

1;
