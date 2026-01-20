package coffeeshop.model;

import java.io.Serializable;

public class ProductBean implements Serializable {

    private int prodId;
    private String prodName;
    private String prodDescription;
    private double prodPrice;
    private String prodImagePath; 

    public ProductBean() {
    } 
    
    
    public int getProdId() {
        return prodId;
    }

    public void setProdId(int prodId) {
        this.prodId = prodId;
    }

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public String getProdDescription() {
        return prodDescription;
    }

    public void setProdDescription(String prodDescription) {
        this.prodDescription = prodDescription;
    }

    public double getProdPrice() {
        return prodPrice;
    }

    public void setProdPrice(double prodPrice) {
        this.prodPrice = prodPrice;
    }

    public String getProdImagePath() {
        return prodImagePath;
    }

    public void setProdImagePath(String prodImagePath) {
        this.prodImagePath = prodImagePath;
    }
}
