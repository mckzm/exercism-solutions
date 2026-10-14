module main

fn distance(strand1 string, strand2 string) !int {
     if strand1.len != strand2.len {
         return error('lengths must match!')
     }

     mut hamming := 0
     for i := 0; i < strand1.len; i++ {
         if strand1[i] != strand2[i] { hamming++ }
     }

     return hamming
}
