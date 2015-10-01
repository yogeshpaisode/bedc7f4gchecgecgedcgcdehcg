/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nawandarfilmes.commonUtility;

/**
 *
 * @author yogesh
 */
public class Days_Bean {
    private String id = "";
    private double amount = 0;

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {

        this.amount = amount + this.amount;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
