<?php
session_start();
if($_SESSION['us_tipo']==1||$_SESSION['us_tipo']==3||$_SESSION['us_tipo']==2){
include_once 'layouts/header.php';
?>

  <title>Adm | Compra</title>
  <!-- Tell the browser to be responsive to screen width -->
<?php   
include_once 'layouts/nav.php';
?>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Compra</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Compra</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    <!-- Main content -->
    <section>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card card-success">
                            <div class="card-header">
                            </div>
                            <div class="card-body p-0">
                                <header>
                                    <div class="logo_cp">
                                        <img src="../img/ferr_olam.jpeg" width="100" height="100">
                                    </div>
                                    <h1 class="titulo_cp">SOLICITUD DE COMPRA</h1>
                                    <div class="datos_cp">
                                        <div class="form-group row">
                                            <span>Cliente: </span>
                                            <div class="input-group-append col-md-6">
                                                <select  id="cliente" class="form-control select2" style="width: 100%;"></select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group row">
                                            <span>Vendedor: </span>
                                            <h3><?php echo $_SESSION["nombre_us"];?></h3>
                                        </div>
                                    </div>
                                </header>
                                <button id="actualizar"class="btn btn-success">Actualizar</button>
                                <div id="cp"class="card-body p-0">
                                    <table class="compra table table-hover text-nowrap">
                                        <thead class='table-success'>
                                            <tr>
                                                <th scope="col">Nombre</th>
                                                <th scope="col">Stock</th>
                                                <th scope="col">Precio</th>
                                                <th scope="col">Adicional</th>
                                                <th scope="col">Marca</th>
                                                <th scope="col">Presentacion</th>
                                                <th scope="col">Cantidad</th>
                                                <th scope="col">Sub Total</th>
                                                <th scope="col">Eliminar</th>
                                            </tr>
                                        </thead>
                                        <tbody id="lista-compra" class='table-active'>
                                            
                                        </tbody>
                                    </table>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="card card-default">
                                                <div class="card-header">
                                                    <h3 class="card-title">
                                                    <i class="fas fa-dollar-sign"></i>
                                                    Precio del IVA 13%
                                                    </h3>
                                                </div>
                                                <div class="card-body">
                                                    <div class="info-box mb-3 bg-warning p-0">
                                                        <span class="info-box-icon"><i class="fas fa-tag"></i></span>
                                                        <div class="info-box-content">
                                                            <span class="info-box-text text-left ">SUB TOTAL</span>
                                                            <span class="info-box-number" id="subtotal">10</span>
                                                        </div>
                                                    </div>
                                                    <div class="info-box mb-3 bg-warning">
                                                        <span class="info-box-icon"><i class="fas fa-tag"></i></span>
                                                        <div class="info-box-content">
                                                            <span class="info-box-text text-left ">IVA</span>
                                                            <span class="info-box-number"id="con_igv">2</span>
                                                        </div>
                                                    </div>
                                                    <div class="info-box mb-3 bg-info">
                                                        <span class="info-box-icon"><i class="fas fa-tag"></i></span>
                                                        <div class="info-box-content">
                                                            <span class="info-box-text text-left ">SIN DESCUENTO</span>
                                                            <span class="info-box-number" id="total_sin_descuento">12</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="card card-default">
                                                <div class="card-header">
                                                    <h3 class="card-title">
                                                    <i class="fas fa-bullhorn"></i>
                                                   DESCUENTO POR PROMOCIONES O A CLIENTES FRECUENTES
                                                    </h3>
                                                </div>
                                                <div class="card-body">
                                                    <div class="info-box mb-3 bg-danger">
                                                        <span class="info-box-icon"><i class="fas fa-comment-dollar"></i></span>
                                                        <div class="info-box-content">
                                                            <span class="info-box-text text-left ">DESCUENTO</span>
                                                            <input id="descuento"type="number" min="1" placeholder="Ingrese descuento" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="info-box mb-3 bg-info">
                                                        <span class="info-box-icon"><i class="ion ion-ios-cart-outline"></i></span>
                                                        <div class="info-box-content">
                                                            <span class="info-box-text text-left ">TOTAL</span>
                                                            <span class="info-box-number" id="total">12</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="card card-default">
                                                <div class="card-header">
                                                    <h3 class="card-title">
                                                    <i class="fas fa-cash-register"></i>
                                                    CAMBIO DEL PAGO
                                                    </h3>
                                                </div>
                                                <div class="card-body">
                                                <div class="info-box mb-3 bg-success">
                                                    <span class="info-box-icon"><i class="fas fa-money-bill-alt"></i></span>
                                                    <div class="info-box-content">
                                                        <span class="info-box-text text-left ">INGRESO</span>
                                                        <input type="number" id="pago" min="1" placeholder="Ingresa Dinero" class="form-control">
                                                       
                                                    </div>
                                                </div>
                                                <div class="info-box mb-3 bg-info">
                                                    <span class="info-box-icon"><i class="fas fa-money-bill-wave"></i></span>
                                                    <div class="info-box-content">
                                                        <span class="info-box-text text-left ">VUELTO</span>
                                                        <span class="info-box-number" id="vuelto">3</span>
                                                    </div>
                                                </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row justify-content-between">
                                    <div class="col-md-4 mb-2">
                                        <a href="../vista/adm_catalogo.php" class="btn btn-primary btn-block">Seguir comprando</a>
                                    </div>
                                    <div class="col-xs-12 col-md-4">
                                        <a href="#" class="btn btn-success btn-block" id="procesar-compra">Realizar compra</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<?php
include_once 'layouts/footer.php';
}
else{
    header('Location: ../index.php');
}
?>

<script src="../js/Carrito.js"></script>