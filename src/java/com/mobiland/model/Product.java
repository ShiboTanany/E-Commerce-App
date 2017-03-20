/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mobiland.model;

import java.io.Serializable;

/**
 *
 * @author shibo
 */
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer productId;

    private String name;

    private String desc;

    private byte[] image;

    private String serialNumber;

    private double price;

    private int quantity;

    public Product() {
    }

    public Product(Integer productId) {
        this.productId = productId;
    }

    public Product(Integer productId, String name, String desc, byte[] image, String serialNumber, double price, int quantity) {
        this.productId = productId;
        this.name = name;
        this.desc = desc;
        this.image = image;
        this.serialNumber = serialNumber;
        this.price = price;
        this.quantity = quantity;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public Product(Integer productId, String name, String desc, double price, int quantity) {
        this.productId = productId;
        this.name = name;
        this.desc = desc;
        this.price = price;
        this.quantity = quantity;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public String getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (productId != null ? productId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Product)) {
            return false;
        }
        Product other = (Product) object;
        if ((this.productId == null && other.productId != null) || (this.productId != null && !this.productId.equals(other.productId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", name=" + name + ", desc=" + desc + ", image=" + image + ", serialNumber=" + serialNumber + ", price=" + price + ", quantity=" + quantity + '}';
    }

    //Added by Hatem Alamir
	/* Transforming the product to JSON string to send it to the client in this form
     */
    public String toJson() {
        return "{" + "\"productId\":" + productId + ", \"name\":\"" + name + "\", \"desc\":\"" + desc + "\", \"serialNumber\":\"" + serialNumber + "\", \"price\":" + price + ", \"quantity\":" + quantity + "}";
    }

}
