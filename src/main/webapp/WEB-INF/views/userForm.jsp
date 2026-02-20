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

    <form:errors path="user.*"/>
    <form action="submitForm" method="post">
      <div class="field">
        <label for="firstName">First Name</label>
        <input type="text" id="firstName" name="firstName" placeholder="e.g. Jane" autocomplete="given-name" />
      </div>
      <div class="field">
         <label for="lastName">Last Name</label>
         <input type="text" id="lastName" name="lastName" placeholder="e.g. Smith" autocomplete="family-name" />
       </div>
       <div class="field">
       <label for="mobileNum">Mobile Number</label>
     <input type="text" id="mobileNum" name="mobileNum"
            placeholder="e.g. 12345"
            maxlength="10"
            autocomplete="off">
           </div>
      <div class="field">
              <label for="dob">Date Of birth</label>
              <input type="date" id="dob" name="dob"/>
        </div>
        <div class="field">
          <label for="userInterest">User interest</label>
           <input type="test" id="userInterest" name="userInterest"/>
        </div>
        <div class="field">
                 <label for="Street name">Street Name</label>
                 <input type="text" id="address" name="address.streetName"/>
                 <label for="City Name">City Name</label>
                 <input type="text" id="address" name="address.cityName" />
                <label for="Country Name">Country name</label>
                <input type="text" id="address" name="address.countryName"/>
          </div>
          <div class="field">
            <label for="Skills">Skills:</label>
            <select name="skills" id="skills">
              <option value="Java">Java</option>
              <option value="PHP">PHP</option>
              <option value="Python">Python</option>
              <option value="Kotlin">Kotlin</option>
            </select>
          </div>


      <div class="divider"></div>

      <button type="submit">Submit</button>
    </form>
  </div>
</body>
</html>
