/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mobiland.model;

import java.io.Serializable;
import java.util.Date;


/**
 *
 * @author shibo
 */

public class Cart implements Serializable {
 
    
    
  
    private String time;
    
    private int quantity;
   
    private Customer customer;
   
    private Product product;
     
    private String bought;

    public String getBought() {
        return bought;
    }

    public void setBought(String bought) {
        this.bought = bought;
    }

    

    public Cart() {
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
       
        this.customer=customer; 
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Cart(String time, int quantity, Customer customer, Product product, String bought) {
        this.time = time;
        this.quantity = quantity;
        this.customer = customer;
        this.product = product;
        this.bought = bought;
    }

    
}