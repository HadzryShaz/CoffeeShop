package coffeeshop.dao;

import coffeeshop.model.ProductBean;
import coffeeshop.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {

    public List<ProductBean> getAllProducts() {
        List<ProductBean> productList = new ArrayList<>();
        String query = "SELECT PROD_ID, PROD_NAME, PROD_DESCRIPTION, PROD_PRICE, PROD_IMAGE_PATH FROM PRODUCTS";

        try (Connection con = DBConnection.createConnection();
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                ProductBean product = new ProductBean();
                product.setProdId(rs.getInt("PROD_ID"));
                product.setProdName(rs.getString("PROD_NAME"));
                product.setProdDescription(rs.getString("PROD_DESCRIPTION"));
                product.setProdPrice(rs.getDouble("PROD_PRICE"));
                product.setProdImagePath(rs.getString("PROD_IMAGE_PATH"));
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    public String addProduct(ProductBean product) {
        String query = "INSERT INTO PRODUCTS (PROD_NAME, PROD_DESCRIPTION, PROD_PRICE, PROD_IMAGE_PATH) VALUES (?, ?, ?, ?)";
        try (Connection con = DBConnection.createConnection();
                PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, product.getProdName());
            ps.setString(2, product.getProdDescription());
            ps.setDouble(3, product.getProdPrice());
            ps.setString(4, product.getProdImagePath());

            if (ps.executeUpdate() > 0) {
                return "SUCCESS";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "FAIL";
    }

    // Method to get a single product details
    public ProductBean getProductById(int id) {
        ProductBean p = new ProductBean();
        String sql = "SELECT * FROM PRODUCTS WHERE PROD_ID = ?";
        try (Connection con = DBConnection.createConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p.setProdId(rs.getInt("PROD_ID"));
                p.setProdName(rs.getString("PROD_NAME"));
                p.setProdDescription(rs.getString("PROD_DESCRIPTION"));
                p.setProdPrice(rs.getDouble("PROD_PRICE")); // Correct column!
                p.setProdImagePath(rs.getString("PROD_IMAGE_PATH"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return p;
    }

// Method to save the edited changes
    public void updateProduct(ProductBean p) {
        String sql = "UPDATE PRODUCTS SET PROD_NAME=?, PROD_DESCRIPTION=?, PROD_PRICE=?, PROD_IMAGE_PATH=? WHERE PROD_ID=?";
        try (Connection con = DBConnection.createConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, p.getProdName());
            ps.setString(2, p.getProdDescription());
            ps.setDouble(3, p.getProdPrice());
            ps.setString(4, p.getProdImagePath());
            ps.setInt(5, p.getProdId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //Method to delete the product 
    public void deleteProduct(int id) {
        String sql = "DELETE FROM PRODUCTS WHERE PROD_ID = ?";

        try (Connection con = DBConnection.createConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int getProductCount() {
        int count = 0;
        // Uses the PRODUCTS table from your schema
        String sql = "SELECT COUNT(*) FROM PRODUCTS";

        try (Connection con = DBConnection.createConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql)) {

            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
}
