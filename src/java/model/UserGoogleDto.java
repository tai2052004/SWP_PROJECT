/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author test
 */
public class UserGoogleDto {

    private String id;
    private String email;
    private String verified_email;
    private String name;
    private String giving_name;
    private String family_name;
    private String picture;
    
    @Override
    public String toString() {
        return "UserGoogleDto{" + "id=" + id + ", email=" + email + ", verified_email=" + verified_email + ", name=" + name + ", giving_name=" + giving_name + ", family_name=" + family_name + ", picture=" + picture + '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getVerified_email() {
        return verified_email;
    }

    public void setVerified_email(String verified_email) {
        this.verified_email = verified_email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGiving_name() {
        return giving_name;
    }

    public void setGiving_name(String giving_name) {
        this.giving_name = giving_name;
    }

    public String getFamily_name() {
        return family_name;
    }

    public void setFamily_name(String family_name) {
        this.family_name = family_name;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public UserGoogleDto(String id, String email, String verified_email, String name, String giving_name, String family_name, String picture) {
        this.id = id;
        this.email = email;
        this.verified_email = verified_email;
        this.name = name;
        this.giving_name = giving_name;
        this.family_name = family_name;
        this.picture = picture;
    }

    public UserGoogleDto() {
    }

}
