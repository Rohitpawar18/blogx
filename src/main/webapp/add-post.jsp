<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Post - BlogX</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border: none;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <!-- Navigation -->
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
                        <a class="nav-link active" href="add-post.jsp">Add Post</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h3 class="text-center mb-0">Create New Blog Post</h3>
                    </div>
                    <div class="card-body p-4">
                        <form action="add-post" method="post">
                            <div class="mb-3">
                                <label for="title" class="form-label fw-bold">Post Title</label>
                                <input type="text" class="form-control form-control-lg" id="title" name="title" 
                                       placeholder="Enter a catchy title for your post" required>
                            </div>
                            <div class="mb-4">
                                <label for="content" class="form-label fw-bold">Post Content</label>
                                <textarea class="form-control" id="content" name="content" 
                                          rows="12" placeholder="Write your amazing blog post here..." 
                                          style="resize: vertical;" required></textarea>
                            </div>
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                <a href="view-posts" class="btn btn-secondary me-md-2">Cancel</a>
                                <button type="submit" class="btn btn-primary btn-lg">Publish Post</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>