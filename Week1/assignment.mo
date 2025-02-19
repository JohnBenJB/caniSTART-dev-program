import Nat "mo:base/Nat";

actor SimpleBank {
    // Mutable variable to store user balance
    var balance: Nat = 0;

    // Query function to check balance (fast, read-only)
    public query func checkBalance() : async Nat {
        return balance;
    };

    // Update function to deposit funds (modifies state)
    public func deposit(amount: Nat) : async Text {
        balance += amount;
        return "Deposit successful! New balance: " # Nat.toText(balance);
    };

    // Update function to withdraw funds (modifies state)
    public func withdraw(amount: Nat) : async Text {
        if (amount > balance) {
            return "Insufficient funds! Your balance is: " # Nat.toText(balance);
        } else {
            balance -= amount;
            return "Withdrawal successful! New balance: " # Nat.toText(balance);
        };
    };

    // Reset account function (only for demo purposes)
    public func resetAccount() : async Text {
        balance := 0;
        return "Account has been reset. Your balance is now 0.";
    };
};
