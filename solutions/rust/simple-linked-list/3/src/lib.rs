use std::iter::FromIterator;

pub struct SimpleLinkedList<T> {
    head: Box<Option<Node<T>>>,
    len: usize,
}

struct Node<T> {
    value: T,
    next: Box<Option<Node<T>>>,
}

impl<T> SimpleLinkedList<T> {
    pub fn new() -> Self {
        SimpleLinkedList {
            head: Box::new(None),
            len: 0,
        }
    }

    pub fn is_empty(&self) -> bool {
        self.len == 0
    }

    pub fn len(&self) -> usize {
        self.len
    }

    pub fn push(&mut self, _element: T) {
        self.head = Box::new(Some(Node {
            value: _element,
            next: Box::new(self.head.take()),
        }));
        self.len += 1;
    }

    pub fn pop(&mut self) -> Option<T> {
        if self.is_empty() {
            None
        } else {
            let head = (*self.head).take().unwrap();
            self.head = head.next;
            self.len -= 1;
            Some(head.value)
        }
    }

    pub fn peek(&self) -> Option<&T> {
        if self.is_empty() {
            None
        } else {
            Some(&((*self.head).as_ref().unwrap().value))
        }

    }

    #[must_use]
    pub fn rev(self) -> SimpleLinkedList<T> {
        if self.is_empty() { return self }
        let mut v = Vec::from(self);
        v.reverse();
        SimpleLinkedList::from_iter(v)
    }
}

impl<T> FromIterator<T> for SimpleLinkedList<T> {
    fn from_iter<I: IntoIterator<Item = T>>(_iter: I) -> Self {
        let mut linked_list = SimpleLinkedList::new();
        for i in _iter {
            linked_list.push(i)
        }
        linked_list
    }
}

impl<T> From<SimpleLinkedList<T>> for Vec<T> {
    fn from(mut _linked_list: SimpleLinkedList<T>) -> Vec<T> {
        let mut v = Vec::new();
        while !_linked_list.is_empty() {
            v.push(_linked_list.pop().unwrap());
        }
        v.reverse();
        v
    }
}


