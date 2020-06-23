<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="author" content="Diego Velázquez">
  <meta name="description" content="Tablero con Bootstrap 4 - Webook">

  <title>Grafos T1</title>

  <!-- Bootstrap Css -->
  <link href="assets/css/bootstrap.min.css" rel="stylesheet">

  <!-- Hoja de estilos -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- Google fonts -->
  <link href="https://fonts.googleapis.com/css?family=Muli:400,700&display=swap" rel="stylesheet">

  <!-- Ionic icons -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>

<body>

  <div class="d-flex" id="content-wrapper">


    <!-- Sidebar -->
    <div id="sidebar-container" class="bg-light border-right">
      <div class="logo">
        <h2 class="font-weight-bold mb-0" style="text-align: center;">Mister Vet</h2>
      </div>
      <div class="menu list-group-flush">
        <a href="index.php?pagina=inicio" class="list-group-item list-group-item-action text-muted bg-light p-3 border-0">
          <i class="material-icons"> account_circle </i> Nosotros </a>
        <a href="index.php?pagina=ingresoventa" class="list-group-item list-group-item-action text-muted bg-light p-3 border-0">
          <i class="material-icons">add_circle</i>  Ingresar Venta </a>
        <a href="#" class="list-group-item list-group-item-action text-muted bg-light p-3 border-0">
          <i class="material-icons">adjust</i>  Inventario </a>
        <a href="#" class="list-group-item list-group-item-action text-muted bg-light p-3 border-0">
          <i class="material-icons">blur_circular</i>  Historial Ventas </a>
        <a href="#" class="list-group-item list-group-item-action text-muted bg-light p-3 border-0">
          <i class="material-icons">border_style</i>  </a>


      </div>
    </div>


		<?php 
			if(isset($_GET['pagina'])){
				if( $_GET['pagina'] == "inicio" || $_GET['pagina'] == "ingresoventas"){
					include "vistas/".$_GET['pagina'].".php";
				}else{
					include "vistas/inicio.php";
				}
			}else{
				include "vistas/inicio.php";
			}
		 ?>

	</div>
 </body>
 </html>