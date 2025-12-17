<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>TaskBoard</title>

    <!-- Bootstrap 4.6.2 CSS -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
          crossorigin="anonymous">

    <style>
        body {
            background: linear-gradient(135deg,#667eea,#764ba2);
            min-height: 100vh;
            color: #fff;
        }
        .card {
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        }
        .badge-priority-HIGH { background-color: #e74c3c; }
        .badge-priority-MEDIUM { background-color: #f1c40f; }
        .badge-priority-LOW { background-color: #2ecc71; }
        .status-pill {
            border-radius: 999px;
            padding: 3px 10px;
            font-size: 12px;
        }
        .status-TODO { background-color: #34495e; }
        .status-IN_PROGRESS { background-color: #2980b9; }
        .status-DONE { background-color: #27ae60; }
    </style>
</head>
<body>
<div class="container py-5">
    <div class="row mb-4">
        <div class="col text-center">
            <h1 class="display-4">TaskBoard</h1>
            <p class="lead">Colorful task management for your DevOps practice</p>
        </div>
    </div>

    <div class="row">
        <!-- Form -->
        <div class="col-md-4">
            <div class="card bg-dark text-light mb-4">
                <div class="card-header">Create Task</div>
                <div class="card-body">
                    <form action="<c:url value='/tasks' />" method="post">
                        <div class="form-group mb-3">
                            <label>Title</label>
                            <input type="text" name="title" class="form-control" required>
                        </div>
                        <div class="form-group mb-3">
                            <label>Description</label>
                            <textarea name="description" class="form-control" rows="3"></textarea>
                        </div>
                        <div class="form-group mb-3">
                            <label>Priority</label>
                            <select name="priority" class="form-control">
                                <option value="LOW">Low</option>
                                <option value="MEDIUM" selected>Medium</option>
                                <option value="HIGH">High</option>
                            </select>
                        </div>
                        <button class="btn btn-success w-100">Add Task</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- List -->
        <div class="col-md-8">
            <div class="card bg-light text-dark">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <span>All Tasks</span>
                </div>
                <div class="card-body">
                    <table class="table table-hover table-striped">
                        <thead>
                        <tr>
                            <th>Title</th>
                            <th>Priority</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${tasks}" var="t">
                            <tr>
                                <td>${t.title}</td>
                                <td>
                                    <span class="badge badge-priority-${t.priority}">
                                        ${t.priority}
                                    </span>
                                </td>
                                <td>
                                    <span class="status-pill status-${t.status}">
                                        ${t.status}
                                    </span>
                                </td>
                                <td>
                                    <a href="<c:url value='/tasks/${t.id}/status?status=TODO'/>"
                                       class="btn btn-sm btn-outline-secondary">Todo</a>
                                    <a href="<c:url value='/tasks/${t.id}/status?status=IN_PROGRESS'/>"
                                       class="btn btn-sm btn-outline-primary">Progress</a>
                                    <a href="<c:url value='/tasks/${t.id}/status?status=DONE'/>"
                                       class="btn btn-sm btn-outline-success">Done</a>
                                    <a href="<c:url value='/tasks/${t.id}/delete'/>"
                                       class="btn btn-sm btn-outline-danger">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty tasks}">
                            <tr>
                                <td colspan="4" class="text-center text-muted">
                                    No tasks yet. Add your first colorful task!
                                </td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
</body>
</html>
