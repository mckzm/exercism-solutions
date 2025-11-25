pub fn build_proverb(list: &[&str]) -> String {
    let mut proverb = String::new();

    if !list.is_empty() {
        let iter_range = 0..(list.len() - 1);
        for i in iter_range {
            proverb += &format!("For want of a {} the {} was lost.\n", list[i], list[i + 1]);
        }
        proverb += &format!("And all for the want of a {}.", list[0]);
    }
    proverb
}
