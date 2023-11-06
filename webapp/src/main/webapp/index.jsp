<!DOCTYPE html>
<html lang="fr">
<head><title>Web App</title></head>
<body>
  <%
    double num = Math.random();
    if (num > 0.5) {
  %>
      <h2>Bienvenue !</h2>
      <h2>Le nombre est au-dessus de la moyenne !</h2><p>(<%= num %>)</p>
  <%
    } else {
  %>
      <h2>Le nombre est trop bas.</h2><p>(<%= num %>)</p>
  <%
    }
  %>
  <a href="<%= request.getRequestURI() %>"><h3>Essayer à nouveau</h3></a>
</body>
</html>
