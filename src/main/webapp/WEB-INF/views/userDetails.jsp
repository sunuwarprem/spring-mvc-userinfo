<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>User Details</title>

  <!-- ✅ linking external CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/userDetails.css"/>

</head>
<body>

  <div class="container">
  <h1>
     <c:if test="${not empty saveMsg}">
          <p style="color: red;">${saveMsg}</p>
      </c:if>
  </h1>
    <h2>Submitted Details</h2>
    <h2>${mainMsg}</h2>
    <table>
      <thead>
        <tr>
          <th>First Name</th>
          <th>Last Name</th>
          <th>Mobile Number</th>
          <th>DOB</th>
          <th>User Interest</th>
          <th>Address</th>
          <th>Skills</th>
          <th>Action</th>  <%-- ✅ add this --%>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${users}" var="user" >
          <tr>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
            <td>${user.mobileNum}</td>
            <td>${user.dob}</td>
            <td>${user.userInterest}</td>
            <td>${user.address.streetName}, ${user.address.cityName}, ${user.address.countryName}</td>
            <td>${user.skills}</td>
            <td>
                    <%-- ✅ passes user.id to the update GET method --%>
                    <a href="/user_edit?userId=${user.id}&addressId=${user.address.id}">
                      <button type="button">Edit</button>
                    </a>||
                     <a href="/delete?id=${user.id}">
                      <button type="button">Delete</button>
                     </a>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  <div>
  <a href="add_user" class="Add-Users"><button> Add-User </button></a>
  </div>
</body>
</html>

<%-- src/main/webapp/
├── resources/
│   └── css/
│       └── userDetails.css     ← put CSS file here
└── WEB-INF/
    └── views/
        └── userDetails.jsp     ← your JSP file
--%>