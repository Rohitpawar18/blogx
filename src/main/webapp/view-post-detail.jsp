<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.blogx.model.BlogPost" %>
<%@ page import="com.blogx.dao.BlogPostDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    String postId = request.getParameter("id");
    BlogPost post = null;
    
    if (postId != null && !postId.trim().isEmpty()) {
        BlogPostDAO dao = new BlogPostDAO();
        post = dao.getPostById(postId.trim());
    }
    
    if (post == null) {
        response.sendRedirect("view-posts");
        return;
    }
    
    SimpleDateFormat dateFormat = new SimpleDateFormat("MMM dd, yyyy 'at' hh:mm a");
%>
<html>
<head>
    <title><%= post.getTitle() %> - BlogX</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .post-content {
            line-height: 1.8;
            font-size: 1.1em;
            white-space: pre-wrap;
        }
        .post-header {
            border-bottom: 2px solid #e9ecef;
            padding-bottom: 1rem;
            margin-bottom: 2rem;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">📝 BlogX</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="view-posts">View Posts</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="add-post.jsp">Add Post</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <article class="mb-5">
                    <header class="post-header">
                        <h1 class="display-5 fw-bold text-primary"><%= post.getTitle() %></h1>
                        <p class="text-muted lead">
                            <i class="far fa-clock"></i> Published on: <%= dateFormat.format(post.getCreatedAt()) %>
                        </p>
                    </header>
                    
                    <div class="post-content mt-4">
                        <%= post.getContent() %>
                    </div>
                    
                    <div class="mt-5 pt-4 border-top">
                        <a href="view-posts" class="btn btn-secondary">
                            <i class="fas fa-arrow-left"></i> Back to All Posts
                        </a>
                        <a href="delete-post?id=<%= post.getId() %>" 
                           class="btn btn-danger float-end"
                           onclick="return confirm('Are you sure you want to delete this post?')">
                            <i class="fas fa-trash"></i> Delete Post
                        </a>
                    </div>
                </article>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>