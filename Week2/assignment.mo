import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";

actor {
    // Challenge 1: Function to check if the caller is anonymous
    // Returns true if the caller is anonymous, false otherwise
    public shared(msg) func is_anonymous() : async Bool {
        return Principal.isAnonymous(msg.caller);
    };

    // Challenge 2: Create HashMap for favorite numbers
    // Keys are Principal IDs (unique user identifiers)
    // Values are Nat (the user's favorite number)
    private let favoriteNumber = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);

    // Challenge 4: Enhanced add_favorite_number
    // Adds the caller's favorite number to the HashMap if not already registered
    // If the number is already registered, it returns a message saying so
    public shared(msg) func add_favorite_number(n: Nat) : async Text {
        let caller = msg.caller;
        
        // Check if user already has a favorite number
        switch (favoriteNumber.get(caller)) {
            // Case: number already registered
            case (?existing) {
                return "You've already registered your number";
            };
            // Case: no number registered yet
            case null {
                favoriteNumber.put(caller, n);
                return "You've successfully registered your number";
            };
        };
    };

    // Challenge 3: Show favorite number
    // Retrieves the caller's favorite number from the HashMap
    // Returns the number if registered, or null if not
    public shared(msg) func show_favorite_number() : async ?Nat {
        return favoriteNumber.get(msg.caller);
    };
};
