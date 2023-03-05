import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Debug "mo:base/Debug";

actor Token{
    var owner : Principal = Principal.fromText("4sldz-klold-75hwu-b23ol-vzpyp-emznr-ou667-fqd5f-fhutp-cspr2-aqe");
    var totalSupply : Nat = 1000000000;
    var symbol: Text = "DAM";

    var balances = HashMap.HashMap<Principal, Nat>(1, Principal.equal, Principal.hash);

    balances.put(owner, totalSupply);

    public query func balanceOf(who: Principal) : async Nat {

        let balance : Nat = switch (balances.get(who)){
            case null 0;
            case(?result) result;
        };

        // if(balances.get(who) == null){
        //     return 0;
        // } else{
        //     return balances.get(who);
        // }

        return balance;
    };

    public query func getSymbol(): async Text{
        return symbol;
    };

    public shared(msg) func payOut() : async Text{
        // Debug.print(debug_show(msg.caller));
        if(balances.get(msg.caller) == null){
            let amount = 10000;
            balances.put(msg.caller, amount);
            return "Success";
        } else{
            return "Already Claimed the coins";
        }
        
    };
}