<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.blogx.model.BlogPost" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    // Debug information
    System.out.println("view-posts.jsp: Starting...");
    
    // Get posts from request attribute
    List<BlogPost> posts = (List<BlogPost>) request.getAttribute("posts");
    
    // If posts is null, redirect to servlet
    if (posts == null) {
        System.out.println("view-posts.jsp: Posts is null - redirecting to servlet");
        response.sendRedirect("view-posts");
        return;
    }
    
    System.out.println("view-posts.jsp: Received " + posts.size() + " posts");
    
    SimpleDateFormat dateFormat = new SimpleDateFormat("MMM dd, yyyy 'at' hh:mm a");
    
    // Check for messages
    String message = (String) session.getAttribute("message");
    String error = (String) session.getAttribute("error");
    
    if (message != null) {
        session.removeAttribute("message");
    }
    if (error != null) {
        session.removeAttribute("error");
    }
%>
<html>
<head>
    <title>View Posts - BlogX</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .post-card {
            transition: transform 0.2s;
            border: none;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .post-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
        }
        .empty-state {
            padding: 4rem 2rem;
            text-align: center;
            color: #6c757d;
        }
        .post-content-preview {
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
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
                        <a class="nav-link active" href="view-posts">View Posts</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="add-post.jsp">Add Post</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <!-- Messages -->
        <% if (message != null) { %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <strong>Success!</strong> <%= message %>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        <% } %>
        
        <% if (error != null) { %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>Error!</strong> <%= error %>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        <% } %>

        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="mb-0">All Blog Posts</h2>
            <a href="add-post.jsp" class="btn btn-primary">
                + New Post
            </a>
        </div>

        <!-- Debug Info (remove in production) -->
        <div class="alert alert-info d-none">
            Debug: <%= posts.size() %> posts loaded
        </div>

        <% if (posts.isEmpty()) { %>
            <div class="empty-state">
                <div class="empty-icon mb-3" style="font-size: 4rem;">📝</div>
                <h4>No blog posts yet!</h4>
                <p class="text-muted">Be the first to create an amazing blog post.</p>
                <a href="add-post.jsp" class="btn btn-primary mt-3">Create Your First Post</a>
            </div>
        <% } else { %>
            <div class="row">
                <% for (BlogPost post : posts) { %>
                    <div class="col-12 mb-4">
                        <div class="card post-card h-100">
                            <div class="card-body">
                                <h5 class="card-title text-primary"><%= post.getTitle() %></h5>
                                <div class="post-content-preview text-muted mb-3">
                                    <%= post.getContent() %>
                                </div>
                                <p class="text-muted small mb-0">
                                    📅 Posted on: <%= dateFormat.format(post.getCreatedAt()) %>
                                </p>
                            </div>
                            <div class="card-footer bg-transparent">
                                <div class="d-flex justify-content-between align-items-center">
                                    <a href="view-post-detail.jsp?id=<%= post.getId() %>" 
                                       class="btn btn-sm btn-outline-primary">Read More</a>
                                    <a href="delete-post?id=<%= post.getId() %>" 
                                       class="btn btn-sm btn-outline-danger"
                                       onclick="return confirm('Are you sure you want to delete this post?')">
                                        Delete
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                <% } %>
            </div>
        <% } %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>