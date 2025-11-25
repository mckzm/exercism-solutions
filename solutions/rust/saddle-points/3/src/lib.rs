pub fn find_saddle_points(input: &[Vec<u64>]) -> Vec<(usize, usize)> {
    let row_num = input.len();
    let col_num = input[0].len();

    let columns = (0..col_num)
        .map(|i| (0..row_num).map(|j| input[j][i]).collect::<Vec<u64>>())
        .collect::<Vec<Vec<u64>>>();

    let col_candidates = columns
        .iter()
        .enumerate()
        .flat_map(|(i, v)| {
            v.iter()
                .enumerate()
                .filter(|(_j, e)| e == &(v.iter().min().unwrap()))
                .map(move |(j, _e)| (j, i))
        })
        .collect::<Vec<(usize, usize)>>();

    let row_candidates = input
        .iter()
        .enumerate()
        .flat_map(|(i, v)| {
            v.iter()
                .enumerate()
                .filter(move |(_j, e)| e == &(v.iter().max().unwrap()))
                .map(move |(j, _e)| (i, j))
        })
        .collect::<Vec<(usize, usize)>>();

    row_candidates
        .iter()
        .filter(|e| col_candidates.contains(e))
        .copied()
        .collect()
}
