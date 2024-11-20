<?php 
include '../modelo/Marca.php';
$marca=new Marca();
if($_POST['funcion']=='crear'){
    $nombre = $_POST['nombre_marca'];
    $avatar='mar_default.png';
    $marca->crear($nombre,$avatar);
}
if($_POST['funcion']=='editar'){
    $nombre = $_POST['nombre_marca'];
    $id_editado=$_POST['id_editado'];
    $marca->editar($nombre,$id_editado);
}
if($_POST['funcion']=='buscar'){
    $marca->buscar();
    $json=array();
    foreach ($marca->objetos as $objeto) {
        $json[]=array(
            'id'=>$objeto->id_marca,
            'nombre'=>$objeto->nombre,
            'avatar'=>'../img/mar/'.$objeto->avatar
        );
    }
    $jsonstring = json_encode($json);
    echo $jsonstring;
}
if($_POST['funcion']=='cambiar_logo'){
    $id=$_POST['id_logo_mar'];
    if(($_FILES['photo']['type']=='image/jpeg')||($_FILES['photo']['type']=='image/png')||($_FILES['photo']['type']=='image/gif')){
        $nombre=uniqid().'-'.$_FILES['photo']['name'];
        $ruta='../img/mar/'.$nombre;
        move_uploaded_file($_FILES['photo']['tmp_name'],$ruta);
        $marca->cambiar_logo($id,$nombre);
        foreach ($marca->objetos as $objeto) {
            if($objeto->avatar!='mar_default.png'){
                unlink('../img/mar/'.$objeto->avatar);
            }
        }
        $json= array();
        $json[]=array(
            'ruta'=>$ruta,
            'alert'=>'edit'
        );
        $jsonstring = json_encode($json[0]);
        echo $jsonstring;
    }
    else{
        $json= array();
        $json[]=array(
            'alert'=>'noedit'
        );
        $jsonstring = json_encode($json[0]);
        echo $jsonstring;
    }
}
if($_POST['funcion']=='borrar'){
    $id=$_POST['id'];
    $marca->borrar($id);
}
if($_POST['funcion']=='rellenar_marcas'){
    $marca->rellenar_marcas();
    $json = array();
    foreach ($marca->objetos as $objeto) {
       $json[]=array(
           'id'=>$objeto->id_marca,
           'nombre'=>$objeto->nombre
       );
    }
    $jsonstring=json_encode($json);
    echo $jsonstring;
}
?>