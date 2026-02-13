<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>User Details</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      display: flex;
      justify-content: center;
      padding: 40px;
      background: #f0f2f5;
    }

    .container {
      background: #ffffff;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
      width: 100%;
      max-width: 500px;
    }

    h2 {
      margin-bottom: 20px;
      font-size: 1.4rem;
      color: #333;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    thead th {
      background-color: #4a90d9;
      color: #ffffff;
      padding: 10px 14px;
      text-align: left;
      font-size: 0.9rem;
    }

    tbody td {
      padding: 10px 14px;
      border-bottom: 1px solid #e0e0e0;
      color: #333;
      font-size: 0.95rem;
    }

    tbody tr:last-child td { border-bottom: none; }
    tbody tr:nth-child(even) { background: #f7f9fc; }

    .back-btn {
      display: inline-block;
      margin-top: 20px;
      padding: 8px 20px;
      background: #4a90d9;
      color: #fff;
      border-radius: 4px;
      text-decoration: none;
      font-size: 0.9rem;
    }

    .back-btn:hover { background: #357abd; }
  </style>
</head>
<body>
  <div class="container">
    <h2>Submitted Details</h2>
    <h2>${mainMsg}</h2>

    <table>
      <thead>
        <tr>
          <th>First Name</th>
          <th>Last Name</th>
          <th>mobile Number</th>
          <th>Dob</th>
          <th>Address</th>
          <th>Skills</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>${user.firstName}</td>
          <td>${user.lastName}</td>
          <td>${user.mobileNum}</td>
          <td>${user.dob}</td>
          <td>${user.address.streetName},${user.address.cityName},${user.address.countryName}</td>
          <td>${user.skills}</td>
        </tr>
      </tbody>
    </table>
  </div>
</body>
</html>
