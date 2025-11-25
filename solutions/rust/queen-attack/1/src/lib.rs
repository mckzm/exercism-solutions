#[derive(Debug)]
pub struct ChessPosition {
    rank: i32,
    file: i32,
}

#[derive(Debug)]
pub struct Queen {
    position: ChessPosition,
}

impl ChessPosition {
    pub fn new(rank: i32, file: i32) -> Option<Self> {
        match (rank, file) {
            (0..=7, 0..=7) => Some(Self { rank, file }),
            _ => None,
        }
    }

    pub fn is_same_rank(&self, pos: &ChessPosition) -> bool {
        self.rank == pos.rank
    }

    pub fn is_same_file(&self, pos: &ChessPosition) -> bool {
        self.file == pos.file
    }

    pub fn is_on_diagonal(&self, pos: &ChessPosition) -> bool {
        self.gen_diags()
            .iter()
            .any(|(a, b)| pos.rank * a + b == pos.file)
    }

    pub fn gen_diags(&self) -> Vec<(i32, i32)> {
        enum Diagonal {
            Symmetrical,
            Asymmetrical,
        }
        use Diagonal::*;

        let solver = |(x1, y1): (i32, i32), (x2, y2): (i32, i32)| -> (i32, i32) {
            let a = (y2 - y1) / (x2 - x1);
            let b = y1 - (a * x1);
            (a, b)
        };
        let second_point = |(x, y): (i32, i32), direction: Diagonal| -> (i32, i32) {
            match direction {
                Symmetrical => match (x, y) {
                    (7, _) | (_, 7) => (x - 1, y - 1),
                    _ => (x + 1, y + 1),
                },
                Asymmetrical => match (x, y) {
                    (7, _) | (_, 0) => (x - 1, y + 1),
                    _ => (x + 1, y - 1),
                },
            }
        };

        let mut diags: Vec<(i32, i32)> = Vec::new();
        match self.rank == self.file {
            true if self.rank == 0 || self.rank == 7 => diags.push((1, 0)),
            _ => {
                for diag in [Symmetrical, Asymmetrical] {
                    diags.push(solver(
                        (self.rank, self.file),
                        second_point((self.rank, self.file), diag),
                    ));
                }
            }
        }
        diags
    }
}

impl Queen {
    pub fn new(position: ChessPosition) -> Self {
        Self { position }
    }

    pub fn can_attack(&self, other: &Queen) -> bool {
        self.position.is_same_file(&other.position)
            || self.position.is_same_rank(&other.position)
            || self.position.is_on_diagonal(&other.position)
    }
}
