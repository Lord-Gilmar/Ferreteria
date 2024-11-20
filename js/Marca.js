$(document).ready(function() {
    buscar_mar();
    var funcion;
    var edit = false;
    $('#form-crear-marca').submit(e => {
        let nombre_marca = $('#nombre-marca').val();
        let id_editado = $('#id_editar_mar').val();
        if (edit == false) {
            funcion = 'crear';
        } else {
            funcion = 'editar';
        }

        $.post('../controlador/MarcaController.php', { nombre_marca, id_editado, funcion }, (response) => {
            console.log(response);
            if (response == 'add') {
                $('#add-marca').hide('slow');
                $('#add-marca').show(1000);
                $('#add-marca').hide(2000);
                $('#form-crear-marca').trigger('reset');
                buscar_mar();
            }
            if (response == 'noadd') {
                $('#noadd-marca').hide('slow');
                $('#noadd-marca').show(1000);
                $('#noadd-marca').hide(2000);
                $('#form-crear-marca').trigger('reset');
            }
            if (response == 'edit') {
                $('#edit-mar').hide('slow');
                $('#edit-mar').show(1000);
                $('#edit-mar').hide(2000);
                $('#form-crear-marca').trigger('reset');
                buscar_mar();
            }
            edit = false;
        })
        e.preventDefault();
    });

    function buscar_mar(consulta) {
        funcion = 'buscar';
        $.post('../controlador/MarcaController.php', { consulta, funcion }, (response) => {
            const marcas = JSON.parse(response);
            let template = '';
            marcas.forEach(marca => {
                template += `
                    <tr marId="${marca.id}" marNombre="${marca.nombre}" marAvatar="${marca.avatar}">
                        <td>
                            <button class="avatar btn btn-info" title="Cambiar logo de marca" type="button" data-toggle="modal" data-target="#cambiologo">
                                <i class="far fa-image"></i>
                            </button>
                            <button class="editar btn btn-success" title="Editar marca" type="button" data-toggle="modal" data-target="#crearmarca">
                                <i class="fas fa-pencil-alt"></i>
                            </button>
                            <button class="borrar btn btn-danger" title="Borrar marca">
                                <i class="fas fa-trash-alt"></i>
                            </button>
                        </td>
                        <td>
                            <img src="${marca.avatar}" class="img-fluid rounded" width="70" heigth="70">
                        </td>
                        <td>${marca.nombre}</td>

                    </tr>
                `;
            });
            $('#marcas').html(template);
        })
    }
    $(document).on('keyup', '#buscar-marca', function() {
        let valor = $(this).val();
        if (valor != '') {
            buscar_mar(valor);
        } else {
            buscar_mar();
        }
    })
    $(document).on('click', '.avatar', (e) => {
        funcion = "cambiar_logo";
        const elemento = $(this)[0].activeElement.parentElement.parentElement;
        const id = $(elemento).attr('marId');
        const nombre = $(elemento).attr('marNombre');
        const avatar = $(elemento).attr('marAvatar');
        $('#logoactual').attr('src', avatar);
        $('#nombre_logo').html(nombre);
        $('#funcion').val(funcion);
        $('#id_logo_mar').val(id);

    })

    $('#form-logo').submit(e => {
        let formData = new FormData($('#form-logo')[0]);
        $.ajax({
            url: '../controlador/MarcaController.php',
            type: 'POST',
            data: formData,
            cache: false,
            processData: false,
            contentType: false
        }).done(function(response) {
            const json = JSON.parse(response);
            if (json.alert == 'edit') {
                $('#logoactual').attr('src', json.ruta)
                $('#form-logo').trigger('reset');
                $('#edit').hide('slow');
                $('#edit').show(1000);
                $('#edit').hide(2000);
                buscar_mar();
            } else {
                $('#noedit').hide('slow');
                $('#noedit').show(1000);
                $('#noedit').hide(2000);
                $('#form-logo').trigger('reset');
            }
        });
        e.preventDefault();
    })
    $(document).on('click', '.borrar', (e) => {
        funcion = "borrar";
        const elemento = $(this)[0].activeElement.parentElement.parentElement;
        const id = $(elemento).attr('marId');
        const nombre = $(elemento).attr('marNombre');
        const avatar = $(elemento).attr('marAvatar');

        const swalWithBootstrapButtons = Swal.mixin({
            customClass: {
                confirmButton: 'btn btn-success',
                cancelButton: 'btn btn-danger mr-1'
            },
            buttonsStyling: false
        })

        swalWithBootstrapButtons.fire({
            title: 'Decea eliminar ' + nombre + '?',
            text: "No podras revertir esto!",
            imageUrl: '' + avatar + '',
            imageWidth: 100,
            imageHeight: 100,
            showCancelButton: true,
            confirmButtonText: 'Si, borra esto!',
            cancelButtonText: 'No, cancelar!',
            reverseButtons: true
        }).then((result) => {
            if (result.value) {
                $.post('../controlador/MarcaController.php', { id, funcion }, (response) => {
                    edit == false;
                    if (response == 'borrado') {
                        swalWithBootstrapButtons.fire(
                            'Borrado!',
                            'El marca ' + nombre + ' fue borrado.',
                            'success'
                        )
                        buscar_mar();
                    } else {
                        swalWithBootstrapButtons.fire(
                            'No se pudo borrar!',
                            'El marca ' + nombre + ' no fue borrado porque esta siendo usado en un producto.',
                            'error'
                        )
                    }
                })
            } else if (result.dismiss === Swal.DismissReason.cancel) {
                swalWithBootstrapButtons.fire(
                    'Cancelado',
                    'El marca ' + nombre + ' no fue borrado',
                    'error'
                )
            }
        })
    })
    $(document).on('click', '.editar', (e) => {
        const elemento = $(this)[0].activeElement.parentElement.parentElement;
        const id = $(elemento).attr('marId');
        const nombre = $(elemento).attr('marNombre');
        $('#id_editar_mar').val(id);
        $('#nombre-marca').val(nombre);
        edit = true;
    })

});