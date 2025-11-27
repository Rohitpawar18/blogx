package com.blogx.controller;

import com.blogx.dao.BlogPostDAO;
import com.blogx.model.BlogPost;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/view-posts")
public class ViewPostsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BlogPostDAO blogPostDAO;
    
    @Override
    public void init() throws ServletException {
        blogPostDAO = new BlogPostDAO();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        System.out.println("ViewPostsServlet: Processing request...");
        
        try {
            List<BlogPost> posts = blogPostDAO.getAllPosts();
            System.out.println("ViewPostsServlet: Found " + posts.size() + " posts");
            
            // Debug: Print post titles
            for (BlogPost post : posts) {
                System.out.println("Post: " + post.getTitle() + " | ID: " + post.getId());
            }
            
            request.setAttribute("posts", posts);
            request.getRequestDispatcher("view-posts.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error loading posts: " + e.getMessage());
            request.getRequestDispatcher("view-posts.jsp").forward(request, response);
        }
    }
}