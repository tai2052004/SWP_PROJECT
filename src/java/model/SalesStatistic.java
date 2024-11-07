package model;

public class SalesStatistic {
    private double totalSales;
    private int totalOrders;
    private int productsSold;
    private double percentChangeSales;
    private double percentChangeOrders;
    private double percentChangeProducts;
    
    // Constructor mới không cần percentChange parameters
    public SalesStatistic(double totalSales, int totalOrders, int productsSold) {
        this.totalSales = totalSales;
        this.totalOrders = totalOrders;
        this.productsSold = productsSold;
    }

    // Giữ nguyên các getters và setters

    public double getTotalSales() {
        return totalSales;
    }

    public void setTotalSales(double totalSales) {
        this.totalSales = totalSales;
    }

    public int getTotalOrders() {
        return totalOrders;
    }

    public void setTotalOrders(int totalOrders) {
        this.totalOrders = totalOrders;
    }

    public int getProductsSold() {
        return productsSold;
    }

    public void setProductsSold(int productsSold) {
        this.productsSold = productsSold;
    }

    public double getPercentChangeSales() {
        return percentChangeSales;
    }

    public void setPercentChangeSales(double percentChangeSales) {
        this.percentChangeSales = percentChangeSales;
    }

    public double getPercentChangeOrders() {
        return percentChangeOrders;
    }

    public void setPercentChangeOrders(double percentChangeOrders) {
        this.percentChangeOrders = percentChangeOrders;
    }

    public double getPercentChangeProducts() {
        return percentChangeProducts;
    }

    public void setPercentChangeProducts(double percentChangeProducts) {
        this.percentChangeProducts = percentChangeProducts;
    }
}