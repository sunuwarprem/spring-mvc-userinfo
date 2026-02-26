<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Login</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css"/>
</head>
<body>

  <div class="login-wrapper">
    <div class="login-card">
      <h2>Welcome Back</h2>

      <c:if test="${not empty errorMsg}">
        <p class="error-msg">${errorMsg}</p>
      </c:if>

      <form action="/login" method="post">
        <div class="form-group">
          <label for="firstname">Username</label>
          <input type="text" id="firstname" name="firstname" placeholder="Enter firstname" required/>
        </div>

        <div class="form-group">
          <label for="lastname">Password</label>
          <input type="password" id="lastname" name="lastname" placeholder="Enter lastname" required/>
        </div>

        <button type="submit" class="btn-login">Login</button>
      </form>
    </div>
  </div>

</body>
</html>
