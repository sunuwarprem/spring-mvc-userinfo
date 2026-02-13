
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>User Form</title>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet"/>
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    :root {
      --bg: #f7f4ef;
      --card: #ffffff;
      --ink: #1a1714;
      --muted: #8c8580;
      --accent: #c0392b;
      --border: #e2ddd8;
      --shadow: 0 8px 40px rgba(26,23,20,0.10);
    }

    body {
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      background-color: var(--bg);
      background-image:
        radial-gradient(circle at 20% 30%, rgba(192,57,43,0.06) 0%, transparent 55%),
        radial-gradient(circle at 80% 80%, rgba(192,57,43,0.04) 0%, transparent 50%);
      font-family: 'DM Sans', sans-serif;
      padding: 2rem;
    }

    .card {
      background: var(--card);
      border-radius: 4px;
      box-shadow: var(--shadow);
      padding: 3rem 3.5rem;
      width: 100%;
      max-width: 460px;
      position: relative;
      overflow: hidden;
      animation: fadeUp 0.6s ease both;
    }

    .card::before {
      content: '';
      position: absolute;
      top: 0; left: 0; right: 0;
      height: 3px;
      background: var(--accent);
    }

    @keyframes fadeUp {
      from { opacity: 0; transform: translateY(24px); }
      to   { opacity: 1; transform: translateY(0); }
    }

    .form-title {
      font-family: 'Playfair Display', serif;
      font-size: 1.9rem;
      color: var(--ink);
      margin-bottom: 0.4rem;
      letter-spacing: -0.01em;
    }

    .form-subtitle {
      font-size: 0.875rem;
      color: var(--muted);
      font-weight: 300;
      margin-bottom: 2.4rem;
      letter-spacing: 0.01em;
    }

    .field {
      margin-bottom: 1.5rem;
      animation: fadeUp 0.6s ease both;
    }
    .field:nth-child(1) { animation-delay: 0.1s; }
    .field:nth-child(2) { animation-delay: 0.2s; }

    label {
      display: block;
      font-size: 0.72rem;
      font-weight: 500;
      letter-spacing: 0.12em;
      text-transform: uppercase;
      color: var(--muted);
      margin-bottom: 0.55rem;
    }

    input[type="text"] {
      width: 100%;
      padding: 0.85rem 1rem;
      font-family: 'DM Sans', sans-serif;
      font-size: 0.97rem;
      font-weight: 400;
      color: var(--ink);
      background: transparent;
      border: 1px solid var(--border);
      border-radius: 2px;
      outline: none;
      transition: border-color 0.25s, box-shadow 0.25s;
    }

    input[type="text"]::placeholder { color: #c5bfba; }

    input[type="text"]:focus {
      border-color: var(--accent);
      box-shadow: 0 0 0 3px rgba(192,57,43,0.09);
    }

    .divider {
      height: 1px;
      background: var(--border);
      margin: 2rem 0;
    }

    button[type="submit"] {
      width: 100%;
      padding: 0.95rem;
      font-family: 'DM Sans', sans-serif;
      font-size: 0.88rem;
      font-weight: 500;
      letter-spacing: 0.1em;
      text-transform: uppercase;
      color: #fff;
      background: var(--ink);
      border: none;
      border-radius: 2px;
      cursor: pointer;
      position: relative;
      overflow: hidden;
      transition: background 0.25s, transform 0.15s;
      animation: fadeUp 0.6s 0.3s ease both;
    }

    button[type="submit"]:hover {
      background: var(--accent);
    }

    button[type="submit"]:active {
      transform: scale(0.98);
    }

    button[type="submit"]::after {
      content: '→';
      position: absolute;
      right: 1.4rem;
      top: 50%;
      transform: translateY(-50%);
      opacity: 0;
      transition: opacity 0.2s, right 0.2s;
    }

    button[type="submit"]:hover::after {
      opacity: 1;
      right: 1.2rem;
    }
  </style>
</head>
<body>
  <div class="card">
    <h1 class="form-title">Welcome</h1>
    <h2>${mainMsg}</h2>
    <p class="form-subtitle">Please enter your details below</p>

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
