package com.blogx.controller;

import java.io.IOException;

import com.blogx.dao.BlogPostDAO;
import com.blogx.model.BlogPost;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/add-post")
public class AddPostServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BlogPostDAO blogPostDAO;

    @Override
    public void init() throws ServletException {
        blogPostDAO = new BlogPostDAO();
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String content = request.getParameter("content");

        if (title != null && !title.trim().isEmpty() &&
            content != null && !content.trim().isEmpty()) {

            BlogPost post = new BlogPost(title.trim(), content.trim());
            String postId = blogPostDAO.addPost(post);

            if (postId != null) {
                request.getSession().setAttribute("message", "Blog post added successfully!");
            } else {
                request.getSession().setAttribute("error", "Failed to add blog post!");
            }
        } else {
            request.getSession().setAttribute("error", "Title and content are required!");
        }

        response.sendRedirect("view-posts.jsp");
    }
}