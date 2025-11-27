<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>BlogX - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .hero-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 100px 0;
            text-align: center;
        }
        .feature-card {
            transition: transform 0.3s;
            margin-bottom: 20px;
        }
        .feature-card:hover {
            transform: translateY(-5px);
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">📝 BlogX</a>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="hero-section">
        <div class="container">
            <h1 class="display-4 mb-4">Welcome to BlogX</h1>
            <p class="lead mb-4">Your simple and powerful blogging platform</p>
            <!-- In the hero section, update the buttons -->
<a href="add-post.jsp" class="btn btn-light btn-lg me-2">Write New Post</a>
<a href="view-posts" class="btn btn-outline-light btn-lg">Read Blogs</a>
        </div>
    </div>

    <!-- Features Section -->
    <div class="container my-5">
        <div class="row">
            <div class="col-md-4">
                <div class="card feature-card">
                    <div class="card-body text-center">
                        <h3>✏️ Write</h3>
                        <p>Create beautiful blog posts with ease</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card feature-card">
                    <div class="card-body text-center">
                        <h3>📖 Read</h3>
                        <p>Explore all blog posts in one place</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card feature-card">
                    <div class="card-body text-center">
                        <h3>🔄 Manage</h3>
                        <p>Easy post management and deletion</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>