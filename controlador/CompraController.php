<?php
include '../modelo/Venta.php';
include_once '../modelo/Conexion.php';
$venta = new Venta();
session_start();
$vendedor = $_SESSION['usuario'];
if($_POST['funcion']=='registrar_compra'){
    $total=$_POST['total'];
    $cliente=$_POST['cliente'];
    $productos=json_decode($_POST['json']);
    date_default_timezone_set('America/Lima');
    $fecha = date('Y-m-d H:i:s');
    $venta->Crear($cliente,$total,$fecha,$vendedor);
    $venta->ultima_venta();
    foreach ($venta->objetos as $objeto) {
        $id_venta = $objeto->ultima_venta;
        //echo $id_venta;
    }
    try {
        $db= new Conexion();
        $conexion = $db->pdo;
        $conexion->beginTransaction();
        foreach ($productos as $prod) {
           $cantidad = $prod->cantidad;
           while ($cantidad!=0) {
                $sql="SELECT * FROM inventario where vencimiento = (SELECT MIN(vencimiento) FROM inventario where id_producto=:id and estado='A') and id_producto=:id";
                $query = $conexion->prepare($sql);
                $query->execute(array(':id'=>$prod->id));
                $inventario=$query->fetchall();

                foreach ($inventario as $inventario) {
                    $sql="SELECT compra.id_proveedor as proveedor FROM inventario
                    JOIN compra on inventario.id_compra = compra.id and inventario.id=:id";
                    $query = $conexion->prepare($sql);
                    $query->execute(array(':id'=>$inventario->id));
                    $prov=$query->fetchall();
                    $proveedor = $prov[0]->proveedor;
                   if($cantidad<$inventario->cantidad_inventario){
                       $sql="INSERT INTO detalle_venta(det_cantidad,det_vencimiento,id__det_inventario,id__det_prod,inventario_id_prov,id_det_venta) values ('$cantidad','$inventario->vencimiento','$inventario->id','$prod->id','$proveedor','$id_venta')";
                       $conexion->exec($sql);
                       $conexion->exec("UPDATE inventario SET cantidad_inventario= cantidad_inventario-'$cantidad' where id='$inventario->id'");
                       $cantidad=0;
                   }
                   if($cantidad==$inventario->cantidad_inventario){
                        $sql="INSERT INTO detalle_venta(det_cantidad,det_vencimiento,id__det_inventario,id__det_prod,inventario_id_prov,id_det_venta) values ('$cantidad','$inventario->vencimiento','$inventario->id','$prod->id','$proveedor','$id_venta')";
                        $conexion->exec($sql);
                        $conexion->exec("UPDATE inventario SET estado='I',cantidad_inventario=0 where id='$inventario->id'");
                        $cantidad=0;
                    }
                    if($cantidad>$inventario->cantidad_inventario){
                        $sql="INSERT INTO detalle_venta(det_cantidad,det_vencimiento,id__det_inventario,id__det_prod,inventario_id_prov,id_det_venta) values ('$inventario->cantidad_inventario','$inventario->vencimiento','$inventario->id','$prod->id','$proveedor','$id_venta')";
                        $conexion->exec($sql);
                       $conexion->exec("UPDATE inventario SET estado='I',cantidad_inventario=0 where id='$inventario->id'");
                        $cantidad=$cantidad-$inventario->cantidad_inventario;
                    }
                }
            }
            $subtotal = $prod->cantidad*$prod->precio;
            $conexion->exec("INSERT INTO venta_producto(precio,cantidad,subtotal,producto_id_producto,venta_id_venta) values('$prod->precio','$prod->cantidad','$subtotal','$prod->id','$id_venta')");
        }
        $conexion->commit();

    } catch (Exception $error) {
       
        $conexion->rollBack();
        $venta->borrar($id_venta);
        echo $error->getMessage();
    }

}