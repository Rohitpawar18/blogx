package com.blogx.model;

import java.util.Date;

public class BlogPost {
    private String id;
    private String title;
    private String content;
    private Date createdAt;

    // Constructors
    public BlogPost() {}

    public BlogPost(String title, String content) {
        this.title = title;
        this.content = content;
        this.createdAt = new Date();
    }

    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
}