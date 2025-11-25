pub fn map<T, U, F>(input: Vec<T>, mut f: F) -> Vec<U>
where
    F: FnMut(T) -> U,
{
    let mut res = Vec::with_capacity(input.len());

    for e in input {
        res.push(f(e));
    }
    res
}
