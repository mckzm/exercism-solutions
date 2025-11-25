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

    pub fn is_same_diagonal(&self, pos: &ChessPosition) -> bool {
        (self.rank - pos.rank).abs() == (self.file - pos.file).abs()
    }
}

impl Queen {
    pub fn new(position: ChessPosition) -> Self {
        Self { position }
    }

    pub fn can_attack(&self, other: &Queen) -> bool {
        self.position.is_same_file(&other.position)
            || self.position.is_same_rank(&other.position)
            || self.position.is_same_diagonal(&other.position)
    }
}
