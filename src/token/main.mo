import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";

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
    }
}