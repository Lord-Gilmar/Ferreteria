<?php
include 'Conexion.php';
class Marca{
    var $objetos;
    public function __construct(){
        $db= new Conexion();
        $this->acceso=$db->pdo;
    }
    function crear($nombre,$avatar){
        $sql="SELECT id_marca,estado FROM marca where nombre=:nombre";
        $query = $this->acceso->prepare($sql);
        $query->execute(array(':nombre'=>$nombre));
        $this->objetos=$query->fetchall();
        if(!empty($this->objetos)){
            foreach ($this->objetos as $mar) {
                $mar_id= $mar->id_marca;
                $mar_estado = $mar->estado;
             }
             if($mar_estado=='A'){
                 echo 'noadd';
             }
             else{
                 $sql="UPDATE marca SET estado='A' where id_marca=:id ";
                 $query = $this->acceso->prepare($sql);
                 $query->execute(array(':id'=>$mar_id));
                 echo 'add';
             }
        }
        else{
            $sql="INSERT INTO marca(nombre,avatar) values (:nombre,:avatar);";
            $query = $this->acceso->prepare($sql);
            $query->execute(array(':nombre'=>$nombre,':avatar'=>$avatar));
            echo 'add';
        }
    }
    function buscar(){
        if(!empty($_POST['consulta'])){
            $consulta=$_POST['consulta'];
            $sql="SELECT * FROM marca where estado='A' and  nombre LIKE :consulta";
            $query = $this->acceso->prepare($sql);
            $query->execute(array(':consulta'=>"%$consulta%"));
            $this->objetos=$query->fetchall();
            return $this->objetos;
        }
        else{
            $sql="SELECT * FROM marca where estado='A' and nombre NOT LIKE '' ORDER BY id_marca LIMIT 25";
            $query = $this->acceso->prepare($sql);
            $query->execute();
            $this->objetos=$query->fetchall();
            return $this->objetos;
        }
    }
    function cambiar_logo($id,$nombre){
        $sql="SELECT avatar FROM marca where id_marca=:id";
        $query = $this->acceso->prepare($sql);
        $query->execute(array(':id'=>$id));
        $this->objetos = $query->fetchall();

            $sql="UPDATE marca SET avatar=:nombre where id_marca=:id";
            $query=$this->acceso->prepare($sql);
            $query->execute(array(':id'=>$id,':nombre'=>$nombre));
        return $this->objetos;
    }
    function borrar($id){
        $sql="SELECT * FROM producto where prod_mar=:id";
        $query = $this->acceso->prepare($sql);
        $query->execute(array(':id'=>$id));
        $prod=$query->fetchall();
        if(!empty($prod)){
            echo 'noborrado';
        }
        else{
            $sql="UPDATE marca SET estado='I' where id_marca=:id";
            $query = $this->acceso->prepare($sql);
            $query->execute(array(':id'=>$id));
            if(!empty($query->execute(array(':id'=>$id)))){
                echo 'borrado';
            }
            else{
                echo 'noborrado';
            }
        }


       
    }
    function editar($nombre,$id_editado){
        $sql="UPDATE marca SET nombre=:nombre where id_marca=:id";
        $query = $this->acceso->prepare($sql);
        $query->execute(array(':id'=>$id_editado,':nombre'=>$nombre));
        echo 'edit';
    }
    function rellenar_marcas(){
        $sql="SELECT * FROM marca WHERE estado='A' order by nombre asc";
        $query = $this->acceso->prepare($sql);
        $query->execute();
        $this->objetos = $query->fetchall();
        return $this->objetos;
    }
}
?>