<?php
include 'Conexion.php';
class Producto{
    var $objetos;
    public function __construct(){
        $db= new Conexion();
        $this->acceso=$db->pdo;
    }
    function crear($nombre,$adicional,$precio,$marca,$tipo,$presentacion,$avatar){
        $sql="SELECT id_producto,estado FROM producto where nombre=:nombre and adicional=:adicional and prod_mar=:marca and prod_tip_prod=:tipo and prod_present=:presentacion";
        $query = $this->acceso->prepare($sql);
        $query->execute(array(':nombre'=>$nombre,':adicional'=>$adicional,':marca'=>$marca,':tipo'=>$tipo,':presentacion'=>$presentacion));
        $this->objetos=$query->fetchall();
        if(!empty($this->objetos)){

            foreach ($this->objetos as $prod) {
               $prod_id_producto = $prod->id_producto;
               $prod_estado = $prod->estado;
            }
            if($prod_estado=='A'){
                echo 'noadd';
            }
            else{
                $sql="UPDATE producto SET estado='A' where id_producto=:id ";
                $query = $this->acceso->prepare($sql);
                $query->execute(array(':id'=>$prod_id_producto));
                echo 'add';
            }
        }
        else{
            $sql="INSERT INTO producto(nombre,adicional,precio,prod_mar,prod_tip_prod,prod_present,avatar) values (:nombre,:adicional,:precio,:marca,:tipo,:presentacion,:avatar);";
            $query = $this->acceso->prepare($sql);
            $query->execute(array(':nombre'=>$nombre,':adicional'=>$adicional,':marca'=>$marca,':tipo'=>$tipo,':presentacion'=>$presentacion,':precio'=>$precio,':avatar'=>$avatar));
            echo 'add';
        }
    }
    function editar($id,$nombre,$adicional,$precio,$marca,$tipo,$presentacion){
        $sql="SELECT id_producto FROM producto where id_producto!=:id and nombre=:nombre n and adicional=:adicional and prod_mar=:marca and prod_tip_prod=:tipo and prod_present=:presentacion";
        $query = $this->acceso->prepare($sql);
        $query->execute(array(':id'=>$id,':nombre'=>$nombre,':adicional'=>$adicional,':marca'=>$marca,':tipo'=>$tipo,':presentacion'=>$presentacion));
        $this->objetos=$query->fetchall();
        if(!empty($this->objetos)){
            echo 'noedit';
        }
       
    }
    function buscar(){
        if(!empty($_POST['consulta'])){
            $consulta=$_POST['consulta'];
            $sql="SELECT id_producto, producto.nombre as nombre, adicional, precio, marca.nombre as marca, tipo_producto.nombre as tipo, presentacion.nombre as presentacion, producto.avatar as avatar, prod_mar,prod_tip_prod,prod_present
            FROM producto
            join marca on prod_mar=id_marca
            join tipo_producto on prod_tip_prod=id_tip_prod
            join presentacion on prod_present=id_presentacion where producto.estado='A' and producto.nombre  like :consulta limit 25";
            $query = $this->acceso->prepare($sql);
            $query->execute(array(':consulta'=>"%$consulta%"));
            $this->objetos=$query->fetchall();
            return $this->objetos;
        }
        else{
            $sql="SELECT id_producto, producto.nombre as nombre, adicional, precio, marca.nombre as marca, tipo_producto.nombre as tipo, presentacion.nombre as presentacion, producto.avatar as avatar, prod_mar,prod_tip_prod,prod_present
            FROM producto
            join marca on prod_mar=id_marca
            join tipo_producto on prod_tip_prod=id_tip_prod
            join presentacion on prod_present=id_presentacion where producto.estado='A' and producto.nombre not like '' order by producto.nombre limit 25";
            $query = $this->acceso->prepare($sql);
            $query->execute();
            $this->objetos=$query->fetchall();
            return $this->objetos;
        }
    }
    function cambiar_logo($id,$nombre){
        $sql="UPDATE producto SET avatar=:nombre where id_producto=:id";
        $query=$this->acceso->prepare($sql);
        $query->execute(array(':id'=>$id,':nombre'=>$nombre));
    }
    function borrar($id){
        $sql="SELECT * FROM inventario where id_producto=:id and estado='A'";
        $query=$this->acceso->prepare($sql);
        $query->execute(array(':id'=>$id));
        $inventario=$query->fetchall();
        if(!empty($inventario)){
            echo 'noborrado';
        }
        else{
            $sql="UPDATE producto SET estado='I' where id_producto=:id";
            $query=$this->acceso->prepare($sql);
            $query->execute(array(':id'=>$id));
            if(!empty($query->execute(array(':id'=>$id)))){
                echo 'borrado';
            }
            else{
                echo 'noborrado';
            }
        }
        
    }
    function obtener_stock($id){
        $sql="SELECT SUM(cantidad_inventario) as total FROM inventario where id_producto=:id and estado='A'";
        $query=$this->acceso->prepare($sql);
        $query->execute(array(':id'=>$id));
        $this->objetos=$query->fetchall();
        return $this->objetos;
    }
    function buscar_id($id){
        $sql="SELECT id_producto, producto.nombre as nombre, adicional, precio, marca.nombre as marca, tipo_producto.nombre as tipo, presentacion.nombre as presentacion, producto.avatar as avatar, prod_mar,prod_tip_prod,prod_present
        FROM producto
        join marca on prod_mar=id_marca
        join tipo_producto on prod_tip_prod=id_tip_prod
        join presentacion on prod_present=id_presentacion where id_producto=:id";
        $query = $this->acceso->prepare($sql);
        $query->execute(array(':id'=>$id));
        $this->objetos=$query->fetchall();
        return $this->objetos;
    }
    function reporte_producto(){
        
            $sql="SELECT id_producto, producto.nombre as nombre, adicional, precio, marca.nombre as marca, tipo_producto.nombre as tipo, presentacion.nombre as presentacion, producto.avatar as avatar, prod_mar,prod_tip_prod,prod_present
            FROM producto
            join marca on prod_mar=id_marca
            join tipo_producto on prod_tip_prod=id_tip_prod
            join presentacion on prod_present=id_presentacion and producto.nombre not like '' order by producto.nombre";
            $query = $this->acceso->prepare($sql);
            $query->execute();
            $this->objetos=$query->fetchall();
            return $this->objetos;
        
    }
    function rellenar_productos()
    {
        
        
        $sql="SELECT id_producto, producto.nombre as nombre, adicional, precio, marca.nombre as marca, tipo_producto.nombre as tipo, presentacion.nombre as presentacion
        FROM producto
        join marca on prod_mar=id_marca and producto.estado='A'
        join tipo_producto on prod_tip_prod=id_tip_prod
        join presentacion on prod_present=id_presentacion
        order by nombre asc";
            $query = $this->acceso->prepare($sql);
            $query->execute();
            $this->objetos=$query->fetchall();
            return $this->objetos;
           
        
    }
}
?>