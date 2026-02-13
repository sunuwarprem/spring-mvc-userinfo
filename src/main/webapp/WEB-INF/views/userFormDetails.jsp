<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>User Details</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Syne:wght@600;700;800&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
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
      --radius:  12px;
    }

    body {
      background: var(--bg);
      color: var(--text);
      font-family: 'DM Sans', sans-serif;
      min-height: 100vh;
      display: flex;
      align-items: flex-start;
      justify-content: center;
      padding: 48px 16px;
      position: relative;
      overflow-x: hidden;
    }

    body::before {
      content: '';
      position: fixed;
      top: -200px; right: -200px;
      width: 600px; height: 600px;
      background: radial-gradient(circle, rgba(232,255,71,0.06) 0%, transparent 65%);
      pointer-events: none;
    }

    /* ── Card ── */
    .card {
      background: var(--surface);
      border: 1px solid var(--border);
      border-radius: 20px;
      width: 100%;
      max-width: 680px;
      padding: 44px 44px 40px;
      position: relative;
      animation: slideUp 0.55s cubic-bezier(0.22,1,0.36,1) both;
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
      from { opacity: 0; transform: translateY(24px); }
      to   { opacity: 1; transform: translateY(0); }
    }

    /* ── Header ── */
    .page-header { margin-bottom: 32px; }

    .badge {
      display: inline-block;
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
      margin-bottom: 12px;
    }

    h2 {
      font-family: 'Syne', sans-serif;
      font-size: 26px;
      font-weight: 800;
      color: var(--text);
      margin-bottom: 4px;
    }

    .success-msg {
      font-size: 14px;
      color: #5fffa8;
      font-weight: 400;
      margin-top: 4px;
    }

    /* ── Section label ── */
    .section-label {
      font-family: 'Syne', sans-serif;
      font-size: 11px;
      font-weight: 700;
      letter-spacing: 0.1em;
      text-transform: uppercase;
      color: var(--muted);
      margin-bottom: 12px;
      margin-top: 28px;
      padding-bottom: 8px;
      border-bottom: 1px solid var(--border);
    }

    /* ── Detail Grid ── */
    .detail-grid {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 16px;
    }

    .detail-item {
      background: var(--bg);
      border: 1px solid var(--border);
      border-radius: var(--radius);
      padding: 14px 16px;
      transition: border-color 0.2s;
    }

    .detail-item:hover { border-color: #2e3548; }

    .detail-item.full-width {
      grid-column: 1 / -1;
    }

    .detail-key {
      font-size: 11px;
      font-weight: 600;
      letter-spacing: 0.07em;
      text-transform: uppercase;
      color: var(--muted);
      margin-bottom: 5px;
    }

    .detail-val {
      font-size: 15px;
      font-weight: 400;
      color: var(--text);
    }

    .detail-val.highlight {
      font-family: 'Syne', sans-serif;
      font-size: 16px;
      font-weight: 700;
      color: var(--accent);
    }

    /* ── Skills list ── */
    .skills-section { margin-top: 4px; }

    .skills-grid {
      display: flex;
      flex-wrap: wrap;
      gap: 8px;
      margin-top: 4px;
    }

    .skill-tag {
      display: inline-flex;
      align-items: center;
      gap: 5px;
      border-radius: 100px;
      font-size: 12px;
      font-weight: 500;
      padding: 4px 12px;
      animation: tagIn 0.2s ease both;
    }

    /* colour by language keyword in skill value */
    .skill-tag.java   { background: rgba(232,255,71,0.1);  border: 1px solid rgba(232,255,71,0.25);  color: var(--accent);  }
    .skill-tag.python { background: rgba(71,179,255,0.1);  border: 1px solid rgba(71,179,255,0.25);  color: var(--accent2); }
    .skill-tag.php    { background: rgba(255,126,179,0.1); border: 1px solid rgba(255,126,179,0.25); color: var(--accent3); }
    .skill-tag.other  { background: rgba(255,255,255,0.05); border: 1px solid var(--border);          color: var(--muted);   }

    @keyframes tagIn {
      from { transform: scale(0.8); opacity: 0; }
      to   { transform: scale(1);   opacity: 1; }
    }

    .no-skills {
      font-size: 13.5px;
      color: var(--muted);
      font-style: italic;
    }

    /* ── Back button ── */
    .btn-back {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      margin-top: 32px;
      padding: 10px 22px;
      background: transparent;
      border: 1.5px solid var(--border);
      border-radius: var(--radius);
      color: var(--muted);
      font-family: 'Syne', sans-serif;
      font-size: 12px;
      font-weight: 700;
      letter-spacing: 0.06em;
      text-transform: uppercase;
      text-decoration: none;
      transition: border-color 0.2s, color 0.2s;
    }

    .btn-back:hover { border-color: var(--accent); color: var(--accent); }

    @media (max-width: 500px) {
      .card         { padding: 32px 20px; }
      .detail-grid  { grid-template-columns: 1fr; }
      .detail-item.full-width { grid-column: 1; }
      h2            { font-size: 22px; }
    }
  </style>
</head>
<body>
<div class="card">

  <%-- ── Header ── --%>
  <div class="page-header">
    <div class="badge">✓ Submitted</div>
    <h2>User Details</h2>
    <c:if test="${not empty mainMsg}">
      <p class="success-msg"><c:out value="${mainMsg}"/></p>
    </c:if>
  </div>

  <%-- ── Personal Info ── --%>
  <div class="section-label">Personal Information</div>
  <div class="detail-grid">

    <div class="detail-item">
      <div class="detail-key">First Name</div>
      <div class="detail-val"><c:out value="${user.firstName}" default="—"/></div>
    </div>

    <div class="detail-item">
      <div class="detail-key">Last Name</div>
      <div class="detail-val"><c:out value="${user.lastName}" default="—"/></div>
    </div>

    <div class="detail-item">
      <div class="detail-key">Full Name</div>
      <%-- FIX: was using ${firstName} ${lastName} (request params) instead of user object --%>
      <div class="detail-val highlight">
        <c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/>
      </div>
    </div>

    <div class="detail-item">
      <div class="detail-key">Date of Birth</div>
      <div class="detail-val"><c:out value="${user.dob}" default="—"/></div>
    </div>

    <div class="detail-item">
      <div class="detail-key">Mobile Number</div>
      <div class="detail-val"><c:out value="${user.mobileNum}" default="—"/></div>
    </div>

    <%-- ── Address (new field) ── --%>
    <div class="detail-item full-width">
      <div class="detail-key">Address</div>
      <div class="detail-val"><c:out value="${user.address}" default="—"/></div>
    </div>

  </div>

  <%-- ── Skills List ── --%>
  <div class="section-label">Skills</div>
  <div class="skills-section">
    <c:choose>

      <c:when test="${not empty user.skills}">
        <div class="skills-grid">
          <c:forEach var="skill" items="${user.skills}" varStatus="st">
            <%-- Assign colour class based on skill content keywords --%>
            <c:set var="tagClass" value="other"/>
            <c:if test="${fn:containsIgnoreCase(skill,'java') or fn:containsIgnoreCase(skill,'spring') or
                          fn:containsIgnoreCase(skill,'maven') or fn:containsIgnoreCase(skill,'gradle') or
                          fn:containsIgnoreCase(skill,'hibernate') or fn:containsIgnoreCase(skill,'junit') or
                          fn:containsIgnoreCase(skill,'jvm') or fn:containsIgnoreCase(skill,'kafka')}">
              <c:set var="tagClass" value="java"/>
            </c:if>
            <c:if test="${fn:containsIgnoreCase(skill,'python') or fn:containsIgnoreCase(skill,'django') or
                          fn:containsIgnoreCase(skill,'flask') or fn:containsIgnoreCase(skill,'pandas') or
                          fn:containsIgnoreCase(skill,'numpy') or fn:containsIgnoreCase(skill,'tensorflow') or
                          fn:containsIgnoreCase(skill,'pytorch') or fn:containsIgnoreCase(skill,'pytest') or
                          fn:containsIgnoreCase(skill,'fastapi') or fn:containsIgnoreCase(skill,'scrapy')}">
              <c:set var="tagClass" value="python"/>
            </c:if>
            <c:if test="${fn:containsIgnoreCase(skill,'php') or fn:containsIgnoreCase(skill,'laravel') or
                          fn:containsIgnoreCase(skill,'symfony') or fn:containsIgnoreCase(skill,'wordpress') or
                          fn:containsIgnoreCase(skill,'composer') or fn:containsIgnoreCase(skill,'phpunit')}">
              <c:set var="tagClass" value="php"/>
            </c:if>
            <span class="skill-tag ${tagClass}" style="animation-delay:${st.index * 40}ms">
              <c:out value="${skill}"/>
            </span>
          </c:forEach>
        </div>
        <p style="font-size:12px;color:var(--muted);margin-top:10px;">
          ${fn:length(user.skills)} skill<c:if test="${fn:length(user.skills) != 1}">s</c:if> listed
        </p>
      </c:when>

      <c:otherwise>
        <p class="no-skills">No skills provided.</p>
      </c:otherwise>

    </c:choose>
  </div>

  <%-- ── Back button ── --%>
  <a href="userForm.jsp" class="btn-back">← Back to Form</a>

</div>
</body>
</html>
