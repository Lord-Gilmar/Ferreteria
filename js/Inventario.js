$(document).ready(function() {
    var funcion;

    buscar_inventario();

    function buscar_inventario(consulta) {
        funcion = "buscar";
        $.post('../controlador/InventarioController.php', { consulta, funcion }, (response) => {
            console.log(response);
            const inventarios = JSON.parse(response);
            let template = '';
            inventarios.forEach(inventario => {
                template += `
                <div inventarioId="${inventario.id}" inventarioStock="${inventario.stock}" inventarioCodigo="${inventario.codigo}"class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">`;
                if (inventario.estado == 'light') {
                    template += `<div class="card bg-light">`;
                }
                if (inventario.estado == 'danger') {
                    template += `<div class="card bg-danger">`;
                }
                if (inventario.estado == 'warning') {
                    template += `<div class="card bg-warning">`;
                }

                template += `<div class="card-header border-bottom-0">
                <h6>Codigo ${inventario.codigo}</h6>
                    <i class="fas fa-lg fa-cubes mr-1"></i>${inventario.stock}
                  </div>
                  <div class="card-body pt-0">
                    <div class="row">
                      <div class="col-7">
                        <h2 class="lead"><b>${inventario.nombre}</b></h2>
                        
                        
                        <ul class="ml-4 mb-0 fa-ul">
                          <li class="small"><span class="fa-li"><i class="fas fa-lg fa-mortar-pestle"></i></span> Concentracion: ${inventario.concentracion}</li>
                          <li class="small"><span class="fa-li"><i class="fas fa-lg fa-prescription-bottle-alt"></i></span> Adicional: ${inventario.adicional}</li>
                          <li class="small"><span class="fa-li"><i class="fas fa-lg fa-flask"></i></span> marca: ${inventario.marca}</li>
                          <li class="small"><span class="fa-li"><i class="fas fa-lg fa-copyright"></i></span> Tipo: ${inventario.tipo}</li>
                          <li class="small"><span class="fa-li"><i class="fas fa-lg fa-pills"></i></span> Presentacion: ${inventario.presentacion}</li>
                          <li class="small"><span class="fa-li"><i class="fas fa-lg fa-truck"></i></span> Proveedor: ${inventario.proveedor}</li>
                          <li class="small"><span class="fa-li"><i class="fas fa-lg fa-calendar-alt"></i></span> anio: ${inventario.anio}</li>
                          <li class="small"><span class="fa-li"><i class="fas fa-lg fa-calendar-alt"></i></span> mes: ${inventario.mes}</li>
                          <li class="small"><span class="fa-li"><i class="fas fa-lg fa-calendar-day"></i></span> dia: ${inventario.dia}</li>
                          <li class="small"><span class="fa-li"><i class="fas fa-lg fa-calendar-day"></i></span> Hora: ${inventario.hora}</li>
                          
                        </ul>
                      </div>
                      <div class="col-5 text-center">
                        <img src="${inventario.avatar}" alt="" class="img-circle img-fluid">
                      </div>
                    </div>
                  </div>
                  <div class="card-footer">
                    <div class="text-right">
                      
                      <button class="editar btn btn-sm btn-success"type="buttton" data-toggle="modal" data-target="#editarinventario">
                        <i class="fas fa-pencil-alt"></i>
                      </button>
                      
                      <button class="borrar btn btn-sm btn-danger">
                        <i class="fas fa-trash-alt"></i>
                      </button>
                    </div>
                  </div>
                </div>
              </div>
                `;
            });
            $('#inventarios').html(template);
        });
    }
    $(document).on('keyup', '#buscar-inventario', function() {
        let valor = $(this).val();
        if (valor != "") {
            buscar_inventario(valor);
        } else {
            buscar_inventario();
        }
    });
    $(document).on('click', '.editar', (e) => {
        let elemento = $(this)[0].activeElement.parentElement.parentElement.parentElement.parentElement;
        let id = $(elemento).attr('inventarioId');
        let stock = $(elemento).attr('inventarioStock');
        let codigo = $(elemento).attr('inventarioCodigo');

        $('#id_inventario_prod').val(id);
        $('#stock').val(stock);
        $('#codigo_inventario').html(codigo);

    });

    $('#form-editar-inventario').submit(e => {
        let id = $('#id_inventario_prod').val();
        let stock = $('#stock').val();
        funcion = "editar";
        $.post('../controlador/InventarioController.php', { id, stock, funcion }, (response) => {
            if (response == 'edit') {
                $('#edit-inventario').hide('slow');
                $('#edit-inventario').show(1000);
                $('#edit-inventario').hide(2000);
                $('#form-editar-inventario').trigger('reset');
            }
            buscar_inventario();
        })
        e.preventDefault();
    })
    $(document).on('click', '.borrar', (e) => {
        funcion = "borrar";
        const elemento = $(this)[0].activeElement.parentElement.parentElement.parentElement.parentElement;
        const id = $(elemento).attr('inventarioId');


        const swalWithBootstrapButtons = Swal.mixin({
            customClass: {
                confirmButton: 'btn btn-success',
                cancelButton: 'btn btn-danger mr-1'
            },
            buttonsStyling: false
        })

        swalWithBootstrapButtons.fire({
            title: 'Decea eliminar inventario ' + id + '?',
            text: "No podras revertir esto!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonText: 'Si, borra esto!',
            cancelButtonText: 'No, cancelar!',
            reverseButtons: true
        }).then((result) => {
            if (result.value) {
                $.post('../controlador/InventarioController.php', { id, funcion }, (response) => {
                    console.log(response);
                    if (response == 'borrado') {
                        swalWithBootstrapButtons.fire(
                            'Borrado!',
                            'El inventario ' + id + ' fue borrado.',
                            'success'
                        )
                        buscar_inventario();
                    } else {
                        swalWithBootstrapButtons.fire(
                            'No se pudo borrar!',
                            'El inventario ' + id + ' no fue borrado porque esta siendo usado.',
                            'error'
                        )
                    }
                })
            } else if (result.dismiss === Swal.DismissReason.cancel) {
                swalWithBootstrapButtons.fire(
                    'Cancelado',
                    'El inventario ' + id + ' no fue borrado',
                    'error'
                )
            }
        })
    })
})