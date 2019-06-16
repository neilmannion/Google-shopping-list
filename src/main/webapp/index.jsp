<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html lang="en">
  <head>
    <title>Shopping List - Java on Google Cloud Platform Base</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  </head>
  <body>
    <div class="navbar navbar-default">
      <div class="container">
        <div class="navbar-header">
          <div class="navbar-brand">Google lists</div>
        </div>
        
        <ul class="nav navbar-nav">
          <li><a href="/lists/mine">My List</a></li>
        </ul>
        
        <p class="navbar-text navbar-right">
          <c:choose>
          <c:when test="${not empty userEmail}">
          <!-- using pageContext requires jsp-api artifact in pom.xml -->
          <a href="/logout">
            <c:if test="${not empty userImageUrl}">
              <img class="img-circle" src="${fn:escapeXml(userImageUrl)}" width="24">
            </c:if>
            ${fn:escapeXml(userEmail)}
          </a>
          </c:when>
          <c:otherwise>
          <a href="/login">Login</a>
          </c:otherwise>
          </c:choose>
        </p>
      </div>
    </div>
    <h1>Welcome to the Shopping list website</h1>
    <h3>Simply log in through the top right button with your google account and view your personal shopping list</h3>
  </body>
</html>