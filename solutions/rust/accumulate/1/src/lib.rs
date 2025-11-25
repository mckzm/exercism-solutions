pub fn map<T, U, F>(input: Vec<T>, f: F) -> Vec<U>
where
    F: FnMut(T) -> U,
{
    let mut f = f;
    let mut res = Vec::new();

    for e in input {
        res.push(f(e));
    }
    res
}
