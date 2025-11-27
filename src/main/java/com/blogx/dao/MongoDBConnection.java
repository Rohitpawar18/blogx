package com.blogx.dao;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;

public class MongoDBConnection {
    private static MongoClient mongoClient = null;
    
    public static MongoDatabase getDatabase() {
        if (mongoClient == null) {
            try {
                // For production - use environment variable
                String connectionString = System.getenv("MONGODB_URI");
                
                if (connectionString == null || connectionString.isEmpty()) {
                    // Fallback for local development
                    connectionString = "mongodb://localhost:27017/blogx";
                    System.out.println("⚠️ Using local MongoDB - MONGODB_URI not set");
                } else {
                    System.out.println("✅ Using cloud MongoDB from environment variable");
                }
                
                System.out.println("Connecting to MongoDB...");
                mongoClient = MongoClients.create(connectionString);
                
                // Test connection
                MongoDatabase database = mongoClient.getDatabase("blogx");
                database.listCollectionNames().first();
                
                System.out.println("✅ Connected to MongoDB successfully!");
                
            } catch (Exception e) {
                System.err.println("❌ MongoDB connection error: " + e.getMessage());
                e.printStackTrace();
                return null;
            }
        }
        return mongoClient.getDatabase("blogx");
    }
    
    public static void closeConnection() {
        if (mongoClient != null) {
            mongoClient.close();
            mongoClient = null;
            System.out.println("MongoDB connection closed.");
        }
    }
}