<!--
Copyright 2016 Google Inc.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
-->
<!-- [START base] -->
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
          <div class="navbar-brand">Google Lists</div>
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
    <c:import url="/${page}.jsp" />
  </body>
</html>
<!-- [END base]-->