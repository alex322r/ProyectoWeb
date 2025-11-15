<?php
  $userName = $_SESSION['user_email'] ?? 'Usuario';
?>
<div class="container">
  <h1>Bienvenido, <?php echo htmlspecialchars($userName); ?>!</h1>
  <p>Esta es la página de inicio del consultorio psicológico.</p>
</div>
