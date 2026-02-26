<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>User Form</title>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/userForm.css"/>
</head>
<body>
  <div class="card">
    <h1 class="form-title">Welcome</h1>
    <h2>${mainMsg}</h2>
    <p class="form-subtitle">Please enter your details below</p>
    <h2>Update User</h2>

    <form:form action="update" method="post" modelAttribute="user">

      <%-- Hidden fields for IDs --%>
      <form:hidden path="id" />
      <form:hidden path="address.id" />

      <form:errors path="*" cssClass="error" />

      <div class="field">
        <label for="firstName">First Name</label>
        <input type="text" id="firstName" name="firstName"
               value="${user.firstName}"
               placeholder="e.g. Jane" autocomplete="given-name" />
      </div>

      <div class="field">
        <label for="lastName">Last Name</label>
        <input type="text" id="lastName" name="lastName"
               value="${user.lastName}"
               placeholder="e.g. Smith" autocomplete="family-name" />
      </div>

      <div class="field">
        <label for="mobileNum">Mobile Number</label>
        <input type="text" id="mobileNum" name="mobileNum"
               value="${user.mobileNum}"
               placeholder="e.g. 12345" maxlength="10" autocomplete="off" />
      </div>

      <div class="field">
        <label for="dob">Date of Birth</label>
        <input type="date" id="dob" name="dob"
               value="${user.dob}" />
      </div>

      <div class="field">
        <label for="userInterest">User Interest</label>
        <input type="text" id="userInterest" name="userInterest"
               value="${user.userInterest}" />
      </div>

      <div class="field">
        <label for="streetName">Street Name</label>
        <input type="text" id="streetName" name="address.streetName"
               value="${user.address.streetName}" />

        <label for="cityName">City Name</label>
        <input type="text" id="cityName" name="address.cityName"
               value="${user.address.cityName}" />

        <label for="countryName">Country Name</label>
        <input type="text" id="countryName" name="address.countryName"
               value="${user.address.countryName}" />
      </div>

      <div class="field">
        <label for="skills">Skills:</label>
        <select name="skills" id="skills">
          <option value="Java"   ${user.skills == 'Java'   ? 'selected' : ''}>Java</option>
          <option value="PHP"    ${user.skills == 'PHP'    ? 'selected' : ''}>PHP</option>
          <option value="Python" ${user.skills == 'Python' ? 'selected' : ''}>Python</option>
          <option value="Kotlin" ${user.skills == 'Kotlin' ? 'selected' : ''}>Kotlin</option>
        </select>
      </div>

      <div class="divider"></div>

      <button type="submit">Update</button>

    </form:form>
  </div>
</body>
</html>