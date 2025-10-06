// simple_token.rs
// Minimal Rust example struct modeling a token ledger.
use std::collections::HashMap;

pub struct SimpleToken {
    balances: HashMap<String, u128>,
    total_supply: u128,
}

impl SimpleToken {
    pub fn new(initial_owner: String, supply: u128) -> Self {
        let mut balances = HashMap::new();
        balances.insert(initial_owner, supply);
        Self { balances, total_supply: supply }
    }

    pub fn balance_of(&self, owner: &str) -> u128 {
        *self.balances.get(owner).unwrap_or(&0)
    }

    pub fn transfer(&mut self, from: &str, to: &str, amount: u128) -> bool {
        let from_balance = self.balances.get(from).cloned().unwrap_or(0);
        if from_balance < amount { return false; }
        self.balances.insert(from.to_string(), from_balance - amount);
        let to_balance = self.balances.get(to).cloned().unwrap_or(0);
        self.balances.insert(to.to_string(), to_balance + amount);
        true
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn transfer_works() {
        let mut t = SimpleToken::new("alice".to_string(), 1000);
        assert!(t.transfer("alice", "bob", 100));
        assert_eq!(t.balance_of("bob"), 100);
    }
}
