use v5.40;
use experimental qw<class>;

class BinarySearchTree;

field $root :param;

method add ($data) {
    return $self->_insert($root, $data);
}

method _insert($node, $data) {
	if ($node->data >= $data) {
		return $self->_insert($node->left, $data) if defined($node->left);
		$node->insert_left(BinarySearchTree::Node->new(data => $data));
	} else {
		return $self->_insert($node->right, $data) if defined($node->right);
		$node->insert_right(BinarySearchTree::Node->new(data => $data));
	}

	return;
}

method sort () {
    return $self->_collect($root);
}

method _collect($node) {
    return [] if !defined($node);
    return [$self->_collect($node->left)->@*, $node->data, $self->_collect($node->right)->@*];
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
