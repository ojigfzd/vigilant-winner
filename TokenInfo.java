// TokenInfo.java
// Minimal Java class demonstrating how to store token metadata.
// For real blockchain interaction, use web3j or similar libraries.
public class TokenInfo {
    private String name;
    private String symbol;
    private long totalSupply;

    public TokenInfo(String name, String symbol, long totalSupply) {
        this.name = name;
        this.symbol = symbol;
        this.totalSupply = totalSupply;
    }

    public String getName() { return name; }
    public String getSymbol() { return symbol; }
    public long getTotalSupply() { return totalSupply; }

    public static void main(String[] args) {
        TokenInfo t = new TokenInfo("DemoToken", "DTK", 1_000_000L);
        System.out.println(t.getName() + " (" + t.getSymbol() + ") supply=" + t.getTotalSupply());
    }
}
