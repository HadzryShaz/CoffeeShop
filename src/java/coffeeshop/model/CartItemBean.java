package coffeeshop.model;

public class CartItemBean {

    private ProductBean product;
    private int quantity;
    private String customization;

    public CartItemBean() {
    }

    public CartItemBean(ProductBean product, int quantity, String customization) {
        this.product = product;
        this.quantity = quantity;
        this.customization = customization;
    }

    // Getters and Setters
    public ProductBean getProduct() {
        return product;
    }

    public void setProduct(ProductBean product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCustomization() {
        return customization;
    }

    public void setCustomization(String customization) {
        this.customization = customization;
    }
}
