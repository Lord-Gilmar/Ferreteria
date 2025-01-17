$(document).ready(function() {
    $('#cat-carrito').show();
    mostrar_inventarios_riesgo();
    buscar_producto();
    mostrar_stock_riesgo()
    function buscar_producto(consulta) {
        funcion = "buscar";
        $.post('../controlador/ProductoController.php', { consulta, funcion }, (response) => {
            //console.log(response);
            const productos = JSON.parse(response);
            let template = '';
            console.log(productos);
            productos.forEach(producto => {
                template += `
                <div prodId="${producto.id}" prodStock="${producto.stock}" prodNombre="${producto.nombre}"prodPrecio="${producto.precio}"prodConcentracion="${producto.concentracion}"prodAdicional="${producto.adicional}"prodMarca="${producto.marca_id}"prodTipo="${producto.tipo_id}"prodPresentacion="${producto.presentacion_id}"prodAvatar="${producto.avatar}"class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">
                <div class="card bg-light">
                  <div class="card-header text-muted border-bottom-0">
                    <i class="fas fa-lg fa-cubes mr-1"></i>${producto.stock}
                  </div>
                  <div class="card-body pt-0">
                    <div class="row">
                      <div class="col-7">
                      <h2 class="lead"><b>Codigo: ${producto.id}</b></h2>
                        <h2 class="lead"><b>${producto.nombre}</b></h2>
                        <h4 class="lead"><b><i class="fas fa-lg fa-dollar-sign mr-1"></i>${producto.precio}</b></h4>
                        
                        <ul class="ml-4 mb-0 fa-ul text-muted">
                          <li class="small"><span class="fa-li"><i class="fas fa-lg fa-prescription-bottle-alt"></i></span> Adicional: ${producto.adicional}</li>
                          <li class="small"><span class="fa-li"><i class="fas fa-lg fa-flask"></i></span> Marca: ${producto.marca}</li>
                          <li class="small"><span class="fa-li"><i class="fas fa-lg fa-copyright"></i></span> Tipo: ${producto.tipo}</li>
                          <li class="small"><span class="fa-li"><i class="fas fa-lg fa-pills"></i></span> Presentacion: ${producto.presentacion}</li>
                        </ul>
                      </div>
                      <div class="col-5 text-center">
                        <img src="${producto.avatar}" alt="" class="img-circle img-fluid">
                      </div>
                    </div>
                  </div>
                  <div class="card-footer">
                    <div class="text-right">
                      
                      <button class="agregar-carrito btn btn-sm btn-primary">
                        <i class="fas fa-plus-square mr-2"></i>Agregar al carrito
                      </button>
                      
                    </div>
                  </div>
                </div>
              </div>
                `;
            });
            $('#productos').html(template);
        });
    }
    $(document).on('keyup', '#buscar-producto', function() {
        let valor = $(this).val();
        if (valor != "") {
            buscar_producto(valor);
        } else {
            buscar_producto();
        }
    });

  
    function mostrar_stock_riesgo() {
      funcion = "stock_riesgo";
      $.post('../controlador/InventarioController.php', { funcion }, (response) => {
          console.log(response);
          const inventarios = JSON.parse(response);
          console.log(inventarios);
          datatable = $('#stocks').DataTable({
              data: inventarios,
              "columns": [
                  { "data": "stock" },
                  { "data": "producto" },
                  { "data": "adicional" },
                  { "data": "marca" },
                  { "data": "presentacion" },
                  { "data": "tipo" }
              ],
              "destroy": true,
              "language": espanol
          });
      })
  }
})
let espanol = {
    "sProcessing": "Procesando...",
    "sLengthMenu": "Mostrar _MENU_ registros",
    "sZeroRecords": "No se encontraron resultados",
    "sEmptyTable": "Ningún dato disponible en esta tabla",
    "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
    "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
    "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
    "sInfoPostFix": "",
    "sSearch": "Buscar:",
    "sUrl": "",
    "sInfoThousands": ",",
    "sLoadingRecords": "Cargando...",
    "oPaginate": {
        "sFirst": "Primero",
        "sLast": "Último",
        "sNext": "Siguiente",
        "sPrevious": "Anterior"
    },
    "oAria": {
        "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
    },
    "buttons": {
        "copy": "Copiar",
        "colvis": "Visibilidad"
    }
};