use std::iter::FromIterator;

#[derive(Debug, Default)]
pub struct SimpleLinkedList<T> {
    head: Box<Option<Node<T>>>,
    len: usize,
}

#[derive(Debug, Default)]
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
        let head = (*self.head).take()?;
        self.head = head.next;
        self.len -= 1;
        Some(head.value)
    }

    pub fn peek(&self) -> Option<&T> {
        Some(&((*self.head).as_ref()?.value))
    }

    #[must_use]
    pub fn rev(mut self) -> SimpleLinkedList<T> {
        let mut reversed = SimpleLinkedList::new();
        while let Some(node) = self.pop() {
            reversed.push(node);
        }
        reversed
    }
}

impl<T> FromIterator<T> for SimpleLinkedList<T> {
    fn from_iter<I: IntoIterator<Item = T>>(_iter: I) -> Self {
        let mut list = SimpleLinkedList::new();
        for i in _iter {
            list.push(i)
        }
        list
    }
}

impl<T> From<SimpleLinkedList<T>> for Vec<T> {
    fn from(mut _linked_list: SimpleLinkedList<T>) -> Vec<T> {
        let mut v = Vec::new();
        while let Some(node) = _linked_list.pop() {
            v.insert(0, node);
        }
        v
    }
}
