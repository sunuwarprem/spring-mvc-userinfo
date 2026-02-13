<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration – Preview</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=DM+Sans:ital,opsz,wght@0,9..40,300;0,9..40,400;0,9..40,500;1,9..40,300&display=swap" rel="stylesheet">
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        :root {
            --bg:      #0b0e14;
            --surface: #13161e;
            --border:  #1f2430;
            --accent:  #e8ff47;
            --accent2: #47b3ff;
            --accent3: #ff7eb3;
            --text:    #e8ecf4;
            --muted:   #5a6070;
            --error:   #ff5f5f;
            --radius:  12px;
        }

        body {
            background: var(--bg);
            color: var(--text);
            font-family: 'DM Sans', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 16px;
            position: relative;
            overflow-x: hidden;
        }

        body::before {
            content: '';
            position: fixed;
            top: -200px; right: -200px;
            width: 700px; height: 700px;
            background: radial-gradient(circle, rgba(232,255,71,0.07) 0%, transparent 60%);
            pointer-events: none;
        }
        body::after {
            content: '';
            position: fixed;
            bottom: -150px; left: -150px;
            width: 600px; height: 600px;
            background: radial-gradient(circle, rgba(71,179,255,0.08) 0%, transparent 60%);
            pointer-events: none;
        }

        /* ── Card ── */
        .card {
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: 20px;
            width: 100%;
            max-width: 560px;
            padding: 48px 44px;
            position: relative;
            animation: slideUp 0.6s cubic-bezier(0.22,1,0.36,1) both;
        }

        .card::before {
            content: '';
            position: absolute;
            top: 0; left: 44px; right: 44px;
            height: 3px;
            background: linear-gradient(90deg, var(--accent), var(--accent2));
            border-radius: 0 0 4px 4px;
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(30px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        /* ── Header ── */
        .header { margin-bottom: 36px; }

        .badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            font-family: 'Syne', sans-serif;
            font-size: 11px;
            font-weight: 700;
            letter-spacing: 0.12em;
            text-transform: uppercase;
            color: var(--accent);
            background: rgba(232,255,71,0.1);
            border: 1px solid rgba(232,255,71,0.2);
            border-radius: 100px;
            padding: 4px 12px;
            margin-bottom: 16px;
        }

        .badge-dot {
            width: 6px; height: 6px;
            background: var(--accent);
            border-radius: 50%;
            animation: pulse 2s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { opacity: 1; transform: scale(1); }
            50%       { opacity: 0.4; transform: scale(0.7); }
        }

        h1 {
            font-family: 'Syne', sans-serif;
            font-size: 30px;
            font-weight: 800;
            line-height: 1.1;
            color: var(--text);
            margin-bottom: 6px;
        }

        .subtitle {
            font-size: 14px;
            color: var(--muted);
            font-weight: 300;
        }

        /* ── Alerts ── */
        .alert {
            border-radius: var(--radius);
            padding: 12px 16px;
            font-size: 13.5px;
            margin-bottom: 24px;
            display: none;
        }
        .alert.error   { background: rgba(255,95,95,0.1);  border: 1px solid rgba(255,95,95,0.25);  color: #ff9090; }
        .alert.success { background: rgba(71,255,160,0.08); border: 1px solid rgba(71,255,160,0.2);  color: #5fffa8; }
        .alert.show    { display: block; animation: fadeIn 0.3s ease; }

        /* ── Form ── */
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
        }

        .field { margin-bottom: 20px; }

        .field-label {
            display: block;
            font-size: 11.5px;
            font-weight: 600;
            letter-spacing: 0.08em;
            text-transform: uppercase;
            color: var(--muted);
            margin-bottom: 8px;
        }

        .field-label .req { color: var(--accent); margin-left: 2px; }

        input[type="text"],
        input[type="tel"],
        input[type="date"] {
            width: 100%;
            background: var(--bg);
            border: 1.5px solid var(--border);
            border-radius: var(--radius);
            color: var(--text);
            font-family: 'DM Sans', sans-serif;
            font-size: 14.5px;
            padding: 12px 14px;
            outline: none;
            transition: border-color 0.2s, box-shadow 0.2s, background 0.2s;
        }

        input[type="text"]:hover,
        input[type="tel"]:hover,
        input[type="date"]:hover {
            border-color: #2e3548;
        }

        input[type="text"]:focus,
        input[type="tel"]:focus,
        input[type="date"]:focus {
            border-color: var(--accent);
            box-shadow: 0 0 0 3px rgba(232,255,71,0.1);
            background: rgba(232,255,71,0.02);
        }

        input[type="date"]::-webkit-calendar-picker-indicator {
            filter: invert(0.4);
            cursor: pointer;
        }

        /* ── Language Tabs ── */
        .lang-tabs {
            display: flex;
            gap: 8px;
            margin-bottom: 12px;
        }

        .lang-tab {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            background: var(--bg);
            border: 1.5px solid var(--border);
            border-radius: 10px;
            color: var(--muted);
            cursor: pointer;
            font-family: 'Syne', sans-serif;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 0.04em;
            padding: 10px 6px;
            transition: all 0.2s;
            user-select: none;
            position: relative;
        }

        .lang-tab:hover { border-color: #2e3548; color: var(--text); }

        .lang-tab .icon { font-size: 15px; }

        /* selected count badge */
        .lang-tab .count {
            position: absolute;
            top: -6px; right: -6px;
            background: var(--accent);
            color: #0b0e14;
            font-size: 10px;
            font-weight: 800;
            width: 18px; height: 18px;
            border-radius: 50%;
            display: none;
            align-items: center;
            justify-content: center;
        }

        .lang-tab.active-java   { border-color: var(--accent);  background: rgba(232,255,71,0.07);  color: var(--accent);  }
        .lang-tab.active-python { border-color: var(--accent2); background: rgba(71,179,255,0.07);  color: var(--accent2); }
        .lang-tab.active-php    { border-color: var(--accent3); background: rgba(255,126,179,0.07); color: var(--accent3); }

        .lang-tab.has-java   .count { display: flex; background: var(--accent); }
        .lang-tab.has-python .count { display: flex; background: var(--accent2); color: #fff; }
        .lang-tab.has-php    .count { display: flex; background: var(--accent3); color: #fff; }

        /* ── Skill Panel ── */
        .skill-panel {
            display: none;
            background: var(--bg);
            border: 1.5px solid var(--border);
            border-radius: var(--radius);
            padding: 8px;
            max-height: 220px;
            overflow-y: auto;
            scrollbar-width: thin;
            scrollbar-color: var(--border) transparent;
        }

        .skill-panel.visible {
            display: block;
            animation: fadeIn 0.22s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(5px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        .skill-check-item {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 7px 10px;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.15s;
            font-size: 13.5px;
            font-weight: 400;
            color: var(--text);
            text-transform: none;
            letter-spacing: 0;
            margin-bottom: 0;
        }

        .skill-check-item:hover { background: rgba(255,255,255,0.04); }

        .skill-check-item input[type="checkbox"] {
            appearance: none;
            -webkit-appearance: none;
            width: 16px; height: 16px;
            min-width: 16px;
            border: 1.5px solid var(--border);
            border-radius: 4px;
            background: var(--surface);
            cursor: pointer;
            position: relative;
            transition: all 0.15s;
            padding: 0; outline: none;
        }

        #panel-java   .skill-check-item input[type="checkbox"]:checked { background: var(--accent);  border-color: var(--accent); }
        #panel-python .skill-check-item input[type="checkbox"]:checked { background: var(--accent2); border-color: var(--accent2); }
        #panel-php    .skill-check-item input[type="checkbox"]:checked { background: var(--accent3); border-color: var(--accent3); }

        .skill-check-item input[type="checkbox"]:checked::after {
            content: '';
            position: absolute;
            left: 4px; top: 1px;
            width: 5px; height: 9px;
            border: 2px solid #0b0e14;
            border-top: none; border-left: none;
            transform: rotate(45deg);
        }

        /* ── Tags ── */
        .tags-area {
            display: flex;
            flex-wrap: wrap;
            gap: 6px;
            margin-top: 12px;
            min-height: 4px;
        }

        .tag {
            display: inline-flex;
            align-items: center;
            border-radius: 100px;
            font-size: 11.5px;
            font-weight: 500;
            padding: 3px 11px;
            animation: tagIn 0.18s cubic-bezier(0.34,1.56,0.64,1);
        }

        @keyframes tagIn {
            from { transform: scale(0.7); opacity: 0; }
            to   { transform: scale(1);   opacity: 1; }
        }

        .tag.java   { background: rgba(232,255,71,0.1);  border: 1px solid rgba(232,255,71,0.3);  color: var(--accent);  }
        .tag.python { background: rgba(71,179,255,0.1);  border: 1px solid rgba(71,179,255,0.3);  color: var(--accent2); }
        .tag.php    { background: rgba(255,126,179,0.1); border: 1px solid rgba(255,126,179,0.3); color: var(--accent3); }

        .skill-hint {
            font-size: 11.5px;
            color: var(--muted);
            margin-top: 8px;
        }

        /* ── Submit ── */
        .submit-btn {
            width: 100%;
            background: var(--accent);
            border: none;
            border-radius: var(--radius);
            color: #0b0e14;
            cursor: pointer;
            font-family: 'Syne', sans-serif;
            font-size: 13.5px;
            font-weight: 800;
            letter-spacing: 0.08em;
            padding: 15px;
            text-transform: uppercase;
            margin-top: 8px;
            transition: transform 0.15s, box-shadow 0.2s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .submit-btn:hover  { box-shadow: 0 0 30px rgba(232,255,71,0.3); transform: translateY(-2px); }
        .submit-btn:active { transform: translateY(0) scale(0.99); }

        .submit-btn .arrow {
            font-size: 16px;
            transition: transform 0.2s;
        }

        .submit-btn:hover .arrow { transform: translateX(4px); }

        /* ── Divider ── */
        .divider {
            display: flex;
            align-items: center;
            gap: 12px;
            margin: 28px 0 24px;
        }

        .divider-line {
            flex: 1;
            height: 1px;
            background: var(--border);
        }

        .divider-text {
            font-size: 11px;
            color: var(--muted);
            letter-spacing: 0.08em;
            text-transform: uppercase;
        }

        /* ── Responsive ── */
        @media (max-width: 500px) {
            .card     { padding: 36px 22px; }
            .form-row { grid-template-columns: 1fr; gap: 0; }
            h1        { font-size: 24px; }
            .lang-tab { font-size: 11px; }
        }
    </style>
</head>
<body>

<div class="card">
    <div class="header">
        <div class="badge"><span class="badge-dot"></span> New User</div>
        <h1>Create Account</h1>
        <p class="subtitle">Fill in your details to get started</p>
    </div>

    <div class="alert error" id="errAlert">Please fix the errors below.</div>
    <div class="alert success" id="okAlert">🎉 Registration successful!</div>

   <form action="submitForm" method="post">

        <!-- firstName + lastName -->
        <div class="form-row">
            <div class="field">
                <span class="field-label">First Name <span class="req">*</span></span>
                <input type="text" id="firstName" name="firstName" placeholder="Jane" autocomplete="given-name" />
            </div>
            <div class="field">
                <span class="field-label">Last Name <span class="req">*</span></span>
                <input type="text" id="lastName" name="lastName" placeholder="Doe" autocomplete="family-name" />
            </div>
        </div>

        <!-- mobileNum -->
        <div class="field">
            <span class="field-label">Mobile Number <span class="req">*</span></span>
            <input type="tel" id="mobileNum" name="mobileNum" placeholder="e.g. 9876543210" autocomplete="tel" />
        </div>

        <!-- dob -->
        <div class="field">
            <span class="field-label">Date of Birth <span class="req">*</span></span>
            <input type="date" id="dob" name="dob" />
        </div>
         <div class="field">
         <span class="field-label"><b>Street Name </b><span class="req">*</span></span>
           <input type="text" id="address" name="address.streetName" />
         <span class="field-label">Street Name <span class="req">*</span></span>
          <input type="text" id="address" name="address.cityName />
        <span class="field-label">Country Name <span class="req">*</span></span>
           <input type="text" id="address" name="address.countryName />
         </div>

        <div class="divider">
            <div class="divider-line"></div>
            <span class="divider-text">Skills</span>
            <div class="divider-line"></div>
        </div>

        <!-- Skills -->
        <div class="field" style="margin-bottom:8px;">
            <span class="field-label">Select Language &amp; Skills <span class="req">*</span></span>

            <div class="lang-tabs">
                <div class="lang-tab" id="tab-java"   onclick="switchLang('java')">
                    <span class="icon">☕</span> Java
                    <span class="count" id="count-java">0</span>
                </div>
                <div class="lang-tab" id="tab-python" onclick="switchLang('python')">
                    <span class="icon">🐍</span> Python
                    <span class="count" id="count-python">0</span>
                </div>
                <div class="lang-tab" id="tab-php"    onclick="switchLang('php')">
                    <span class="icon">🐘</span> PHP
                    <span class="count" id="count-php">0</span>
                </div>
            </div>

            <!-- Java -->
            <div class="skill-panel" id="panel-java">
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="java" value="Core Java (OOP, Collections, Generics)">Core Java (OOP, Collections, Generics)</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="java" value="Java 8+ Features (Streams, Lambda, Optional)">Java 8+ Features (Streams, Lambda, Optional)</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="java" value="Multithreading & Concurrency">Multithreading &amp; Concurrency</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="java" value="JVM Internals & Memory Management">JVM Internals &amp; Memory Management</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="java" value="Spring Framework (Core, MVC)">Spring Framework (Core, MVC)</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="java" value="Spring Boot (REST APIs, Auto-configuration)">Spring Boot (REST APIs, Auto-configuration)</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="java" value="Spring Security & JWT">Spring Security &amp; JWT</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="java" value="Spring Data JPA / Hibernate">Spring Data JPA / Hibernate</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="java" value="Maven / Gradle">Maven / Gradle</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="java" value="JDBC & Connection Pooling">JDBC &amp; Connection Pooling</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="java" value="Microservices Architecture">Microservices Architecture</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="java" value="Kafka / RabbitMQ">Kafka / RabbitMQ</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="java" value="JUnit 5 & Mockito">JUnit 5 &amp; Mockito</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="java" value="Docker & Kubernetes">Docker &amp; Kubernetes</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="java" value="Design Patterns">Design Patterns</label>
            </div>

            <!-- Python -->
            <div class="skill-panel" id="panel-python">
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="python" value="Core Python (Data Types, Functions, Comprehensions)">Core Python (Data Types, Functions, Comprehensions)</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="python" value="OOP in Python">OOP in Python</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="python" value="File Handling & Exception Handling">File Handling &amp; Exception Handling</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="python" value="Python Standard Library (os, sys, re)">Python Standard Library (os, sys, re)</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="python" value="NumPy & Pandas">NumPy &amp; Pandas</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="python" value="Matplotlib / Seaborn">Matplotlib / Seaborn</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="python" value="Scikit-learn (Machine Learning)">Scikit-learn (Machine Learning)</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="python" value="TensorFlow / PyTorch (Deep Learning)">TensorFlow / PyTorch (Deep Learning)</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="python" value="Django Framework">Django Framework</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="python" value="Flask / FastAPI">Flask / FastAPI</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="python" value="SQLAlchemy (ORM)">SQLAlchemy (ORM)</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="python" value="Web Scraping (BeautifulSoup, Scrapy)">Web Scraping (BeautifulSoup, Scrapy)</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="python" value="Pytest">Pytest</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="python" value="Async Programming (asyncio, aiohttp)">Async Programming (asyncio, aiohttp)</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="python" value="Virtual Environments (venv, pip, conda)">Virtual Environments (venv, pip, conda)</label>
            </div>

            <!-- PHP -->
            <div class="skill-panel" id="panel-php">
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="php" value="Core PHP (Syntax, Arrays, OOP)">Core PHP (Syntax, Arrays, OOP)</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="php" value="PHP 8+ Features (Named Args, Enums, Fibers)">PHP 8+ Features (Named Args, Enums, Fibers)</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="php" value="Laravel (MVC, Eloquent ORM, Blade)">Laravel (MVC, Eloquent ORM, Blade)</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="php" value="Symfony Framework">Symfony Framework</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="php" value="Composer (Dependency Management)">Composer (Dependency Management)</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="php" value="RESTful API Development">RESTful API Development</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="php" value="MySQL / PDO / MySQLi">MySQL / PDO / MySQLi</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="php" value="Authentication (Sessions, Cookies, OAuth2)">Authentication (Sessions, Cookies, OAuth2)</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="php" value="PHPUnit Testing">PHPUnit Testing</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="php" value="WordPress Development (Themes, Plugins)">WordPress Development (Themes, Plugins)</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="php" value="Twig / Blade Templating">Twig / Blade Templating</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="php" value="Caching (Redis, Memcached)">Caching (Redis, Memcached)</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="php" value="Security (XSS, CSRF, SQL Injection)">Security (XSS, CSRF, SQL Injection)</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="php" value="PHP-FPM & Nginx / Apache Config">PHP-FPM &amp; Nginx / Apache Config</label>
                <label class="skill-check-item"><input type="checkbox" class="skill-cb" data-lang="php" value="Dockerizing PHP Apps">Dockerizing PHP Apps</label>
            </div>

            <div class="tags-area" id="tagsArea"></div>
            <p class="skill-hint" id="skillHint">Click a language tab to browse available skills.</p>
        </div>

        <button type="submit" class="submit-btn">
            Register <span class="arrow">→</span>
        </button>

    </form>
</div>

<script>
    /* DOB max = today */
    document.getElementById('dob').max = new Date().toISOString().split('T')[0];

    /* Language switcher */
    let activeLang = null;

    function switchLang(lang) {
        ['java','python','php'].forEach(l => {
            document.getElementById('panel-' + l).classList.remove('visible');
            const tab = document.getElementById('tab-' + l);
            tab.className = 'lang-tab';
            const cnt = document.querySelectorAll('.skill-cb[data-lang="' + l + '"]:checked').length;
            if (cnt > 0) tab.classList.add('has-' + l);
        });

        if (activeLang === lang) {
            activeLang = null;
            document.getElementById('skillHint').textContent = 'Click a language tab to browse available skills.';
            return;
        }
        activeLang = lang;
        document.getElementById('panel-' + lang).classList.add('visible');
        document.getElementById('tab-' + lang).classList.add('active-' + lang);
        const cnt = document.querySelectorAll('.skill-cb[data-lang="' + lang + '"]:checked').length;
        if (cnt > 0) document.getElementById('tab-' + lang).classList.add('has-' + lang);
        document.getElementById('skillHint').textContent = 'Tick skills to add them — switch tabs freely.';
    }

    /* Event delegation for checkboxes */
    document.addEventListener('change', function(e) {
        if (e.target.classList.contains('skill-cb')) syncTags();
    });

    function syncTags() {
        const checked  = document.querySelectorAll('.skill-cb:checked');
        const tagsArea = document.getElementById('tagsArea');
        tagsArea.innerHTML = '';

        // Update count badges
        ['java','python','php'].forEach(l => {
            const n = document.querySelectorAll('.skill-cb[data-lang="' + l + '"]:checked').length;
            const countEl = document.getElementById('count-' + l);
            const tab = document.getElementById('tab-' + l);
            countEl.textContent = n;
            if (n > 0) tab.classList.add('has-' + l);
            else       tab.classList.remove('has-' + l);
        });

        checked.forEach(cb => {
            const tag = document.createElement('span');
            tag.className   = 'tag ' + cb.dataset.lang;
            tag.textContent = cb.value;
            tagsArea.appendChild(tag);
        });

        const total = checked.length;
        if (total > 0) {
            document.getElementById('skillHint').textContent = total + ' skill' + (total > 1 ? 's' : '') + ' selected';
        }
    }

    /* Validation + submit */
    function handleSubmit(e) {
        e.preventDefault();
        document.querySelectorAll('.alert').forEach(a => a.classList.remove('show'));

        const errors = [];
        const fn  = document.getElementById('firstName').value.trim();
        const ln  = document.getElementById('lastName').value.trim();
        const mob = document.getElementById('mobileNum').value.trim();
        const dob = document.getElementById('dob').value;
        const sel = document.querySelectorAll('.skill-cb:checked');

        if (!fn)                               errors.push('First name is required.');
        if (!ln)                               errors.push('Last name is required.');
        if (!mob || !/^\d{7,15}$/.test(mob))  errors.push('Enter a valid mobile number (7–15 digits).');
        if (!dob)                              errors.push('Date of birth is required.');
        if (sel.length === 0)                  errors.push('Select at least one skill.');

        if (errors.length) {
            const errEl = document.getElementById('errAlert');
            errEl.textContent = errors.join(' ');
            errEl.classList.add('show');
            errEl.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
        } else {
            document.getElementById('okAlert').classList.add('show');
            document.getElementById('okAlert').scrollIntoView({ behavior: 'smooth', block: 'nearest' });
        }
    }
</script>
</body>
</html>
