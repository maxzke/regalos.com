//SE DEFINE EL ESTILO Y DISEÑO DE LA ALERTA

 $('#btnGuardarImprimirTicket').click(function(){
    let mensaje = {
        title: 'Total: $ 350.00 <br> Pagado: $ 200.00 <br> Cambio: $ 50.00',
        text:'',
        button:'success'
    }
    alert_confirm_success(mensaje);
 });
 
function abastecer(id,producto,url){
    Swal.fire({
        title: 'Abastecer <br>'+producto,
        input: 'text',
        inputAttributes: {
            placeholder:'cantidad'
          },
        inputValue: '',
        showCancelButton: true,
        inputValidator: (cantidadP) => {
          if (!cantidadP) {
            return 'Introducir una cantidad !'
          }else{
            $.ajax({
                type: 'ajax',
                method: 'post',
                url: url,
                data: { id:id,cantidad:cantidadP  },
                async: true,
                dataType:'json',
                success: function(response){
                  if (response.success) {
                    location.reload();
                  }else{
                    Swal.fire(
                        'No se pudo Guardar!',
                        'Intente de nuevo',
                        'error'
                      )
                  }

                },
                error: function(response){
                  console.log(datosFormEditar);
                  alert('No se pudieron eliminar');
                }

              }); 
          }
        }
      })                        
}
async function peticion(url,id,cant) {
    const response = $.ajax({
        url: url,
        data: { id: id,cantidad:cant },
        method: 'post',
        async: true,
        dataType: 'json',
    });
    const data = await response;
    return data;
}



function alert_confirm_success(msg) {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-success ml-2',
            cancelButton: 'btn btn-danger'
        },
        buttonsStyling: false
    })

    swalWithBootstrapButtons.fire(
        msg.title,
        msg.text,
        msg.button
    )
}



/**
 * ALERTA DE BORRADO?
 * REDIRIGE A LA PAGINA USANDO DATA-URL 
 */
function confirmar_alert(e){

    let url = e.dataset.url;

    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-success ml-2',
            cancelButton: 'btn btn-danger'
        },
        buttonsStyling: false
    })

    swalWithBootstrapButtons.fire({
        title: 'Borrar registro?',
        text: "Se borrará del sistema",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Si, borrar!',
        cancelButtonText: 'No, cancelar!',
        reverseButtons: true
    }).then((result) => {
        if (result.value) {
            // swalWithBootstrapButtons.fire(
            //     'Deleted!',
            //     'Your file has been deleted.',
            //     'success'
            // )
            window.location = url;
        } else if (
            /* Read more about handling dismissals below */
            result.dismiss === Swal.DismissReason.cancel
        ) {
            // swalWithBootstrapButtons.fire(
            //     'Cancelled',
            //     'Your imaginary file is safe :)',
            //     'error'
            // )
        }
    })    
    
}

