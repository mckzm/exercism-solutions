use once_cell::sync::Lazy;
use rand::prelude::*;
use std::{collections::HashMap, sync::Mutex};

static USED_NAMES: Lazy<Mutex<HashMap<String, ()>>> = Lazy::new(|| Mutex::new(HashMap::new()));

pub struct Robot {
    name: String,
}

impl Robot {
    pub fn new() -> Self {
        Self {
            name: Self::gen_name(),
        }
    }

    pub fn name(&self) -> &str {
        &self.name
    }

    pub fn reset_name(&mut self) {
        self.name = Self::gen_name();
    }

    fn gen_name() -> String {
        loop {
            let mut rng = thread_rng();
            let name: String = (0..5).map(|i| if i < 2 { rng.gen_range(b'A'..=b'Z') } else { rng.gen_range(b'0'..=b'9') } as char).collect();
            {
                let mut mutex_guard = Lazy::force(&USED_NAMES).lock().unwrap();
                if (*mutex_guard).insert(name.clone(), ()).is_none() {
                    break name;
                }
            }
        }
    }
}
