package com.blogx.dao;

import com.blogx.model.BlogPost;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Sorts;
import org.bson.Document;
import org.bson.types.ObjectId;

import java.util.ArrayList;
import java.util.List;

import static com.mongodb.client.model.Filters.eq;

public class BlogPostDAO {
    private MongoCollection<Document> collection;
    
    public BlogPostDAO() {
        try {
            MongoDatabase database = MongoDBConnection.getDatabase();
            this.collection = database.getCollection("posts");
            System.out.println("BlogPostDAO initialized successfully");
        } catch (Exception e) {
            System.err.println("Error initializing BlogPostDAO: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    // Add new blog post
    public String addPost(BlogPost post) {
        try {
            Document doc = new Document()
                .append("title", post.getTitle())
                .append("content", post.getContent())
                .append("createdAt", post.getCreatedAt());
            
            collection.insertOne(doc);
            String insertedId = doc.getObjectId("_id").toString();
            System.out.println("Post added with ID: " + insertedId);
            return insertedId;
        } catch (Exception e) {
            System.err.println("Error adding post: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
    
    // Get all posts (newest first)
 // In the getAllPosts() method, update the document conversion:
    public List<BlogPost> getAllPosts() {
        List<BlogPost> posts = new ArrayList<>();
        
        try {
            System.out.println("BlogPostDAO: Fetching all posts from MongoDB...");
            
            for (Document doc : collection.find().sort(Sorts.descending("createdAt"))) {
                try {
                    BlogPost post = new BlogPost();
                    post.setId(doc.getObjectId("_id").toString());
                    post.setTitle(doc.getString("title"));
                    post.setContent(doc.getString("content"));
                    post.setCreatedAt(doc.getDate("createdAt"));
                    
                    posts.add(post);
                    System.out.println("BlogPostDAO: Added post - " + post.getTitle());
                    
                } catch (Exception e) {
                    System.err.println("BlogPostDAO: Error converting document to BlogPost: " + e.getMessage());
                    e.printStackTrace();
                }
            }
            
            System.out.println("BlogPostDAO: Successfully retrieved " + posts.size() + " posts");
            
        } catch (Exception e) {
            System.err.println("BlogPostDAO: Error fetching posts: " + e.getMessage());
            e.printStackTrace();
        }
        
        return posts;
    }
    
    // Delete post by ID
    public boolean deletePost(String id) {
        try {
            collection.deleteOne(eq("_id", new ObjectId(id)));
            System.out.println("Post deleted with ID: " + id);
            return true;
        } catch (Exception e) {
            System.err.println("Error deleting post: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    // Get post by ID
    public BlogPost getPostById(String id) {
        try {
            Document doc = collection.find(eq("_id", new ObjectId(id))).first();
            if (doc != null) {
                return documentToBlogPost(doc);
            }
        } catch (Exception e) {
            System.err.println("Error fetching post: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }
    
    // Helper method to convert Document to BlogPost
    private BlogPost documentToBlogPost(Document doc) {
        BlogPost post = new BlogPost();
        post.setId(doc.getObjectId("_id").toString());
        post.setTitle(doc.getString("title"));
        post.setContent(doc.getString("content"));
        post.setCreatedAt(doc.getDate("createdAt"));
        return post;
    }
}