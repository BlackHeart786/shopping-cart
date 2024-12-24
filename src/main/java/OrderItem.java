public class OrderItem {
    private String productName;
    private double price;
    private int quantity;
    private double total;

    public OrderItem(String productName, double price, int quantity, double total) {
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.total = total;
    }

    public String getProductName() {
        return productName;
    }

    public double getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getTotal() {
        return total;
    }
}
