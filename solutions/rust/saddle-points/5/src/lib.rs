pub fn find_saddle_points(input: &[Vec<u64>]) -> Vec<(usize, usize)> {
    let row_num = input.len();
    let col_num = input[0].len();

    let columns = (0..col_num)
        .map(|i| (0..row_num).map(|j| input[j][i]).collect::<Vec<u64>>())
        .collect::<Vec<Vec<u64>>>();

    let gen_candidates = |axis: &str, matrix: &[Vec<u64>]| {
        let f = match axis {
            "col" => std::iter::Iterator::min,
            _ => std::iter::Iterator::max,
        };

        matrix
            .iter()
            .enumerate()
            .flat_map(|(i, v)| {
                v.iter()
                    .enumerate()
                    .filter(|(_j, e)| e == &(f(v.iter()).unwrap()))
                    .map(move |(j, _e)| if axis == "col" { (j, i) } else { (i, j) })
            })
            .collect::<Vec<(usize, usize)>>()
    };

    let col_candidates = gen_candidates("col", &columns);
    let row_candidates = gen_candidates("row", input);

    row_candidates
        .iter()
        .filter(|e| col_candidates.contains(e))
        .copied()
        .collect()
}
