package com.blogx.controller;

import java.io.IOException;

import com.blogx.dao.BlogPostDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/delete-post")
public class DeletePostServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BlogPostDAO blogPostDAO;

    @Override
    public void init() throws ServletException {
        blogPostDAO = new BlogPostDAO();
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String postId = request.getParameter("id");

        if (postId != null && !postId.trim().isEmpty()) {
            boolean success = blogPostDAO.deletePost(postId.trim());

            if (success) {
                request.getSession().setAttribute("message", "Blog post deleted successfully!");
            } else {
                request.getSession().setAttribute("error", "Failed to delete blog post!");
            }
        } else {
            request.getSession().setAttribute("error", "Invalid post ID!");
        }

        response.sendRedirect("view-posts.jsp");
    }
}