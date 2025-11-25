use std::io::{Read, Result, Write};

pub struct ReadStats<R: Read> {
    reader: R,
    bytes: usize,
    reads: usize,
}

impl<R: Read> ReadStats<R> {
    pub fn new(wrapped: R) -> ReadStats<R> {
        ReadStats {
            reader: wrapped,
            bytes: 0,
            reads: 0,
        }
    }

    pub fn get_ref(&self) -> &R {
        &self.reader
    }

    pub fn bytes_through(&self) -> usize {
        self.bytes
    }

    pub fn reads(&self) -> usize {
        self.reads
    }
}

impl<R: Read> Read for ReadStats<R> {
    fn read(&mut self, buf: &mut [u8]) -> Result<usize> {
        let res = self.reader.read(buf);
        self.reads += 1;
        if let Ok(bytes_read) = res {
            self.bytes += bytes_read;
        }
        res
    }
}

pub struct WriteStats<W: Write> {
    writer: W,
    bytes: usize,
    writes: usize,
}

impl<W: Write> WriteStats<W> {
    pub fn new(wrapped: W) -> WriteStats<W> {
        WriteStats {
            writer: wrapped,
            bytes: 0,
            writes: 0,
        }
    }

    pub fn get_ref(&self) -> &W {
        &self.writer
    }

    pub fn bytes_through(&self) -> usize {
        self.bytes
    }

    pub fn writes(&self) -> usize {
        self.writes
    }
}

impl<W: Write> Write for WriteStats<W> {
    fn write(&mut self, buf: &[u8]) -> Result<usize> {
        let res = self.writer.write(buf);
        self.writes += 1;
        if let Ok(bytes_written) = res {
            self.bytes += bytes_written;
        }
        res
    }

    fn flush(&mut self) -> Result<()> {
        self.writer.flush()
    }
}
