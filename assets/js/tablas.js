

$('#table-detalles-ticket').DataTable(
	{
		//     'dom'  : 'Bfrtip',
		//     buttons: [
		//   {
		//       extend: 'print',
		//         text: 'Imprimir'          
		//   },
		//   {
		//     extend: 'pdf',
		//     text: 'PDF'
		//   },
		//   {
		//     extend: 'excel',
		//     text: 'Excel'
		//   }

		// ],     
		"scrollY": 200,
		"responsive": true,
		'paging': false,
		'lengthChange': false,
		'searching': false,
		'ordering': false,
		'info': false,
		'autoWidth': false,
		// 'columns': [
		//             { "width": "10%" },
		//             { "width": "30%" },
		//             { "width": "10%" },
		//             { "width": "10%" },
		//             { "width": "10%" },
		//             { "width": "10%" },
		//             { "width": "10%" }
		//           ],
		/*Cambiando a espanol el lenguaje*/
		'language': {

			"sProcessing": "Procesando...",
			"sLengthMenu": "Mostrar _MENU_ registros",
			"sZeroRecords": "No se encontraron resultados",
			"sEmptyTable": "Ningun producto agregado",
			"sInfo": "Mostrando del _START_ al _END_ de un total de _TOTAL_ registros",
			"sInfoEmpty": "Mostrando del 0 al 0 de un total de 0 registros",
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
        }
    }
});


$('#table-historial-folios').DataTable(
	{
		//     'dom'  : 'Bfrtip',
		//     buttons: [
		//   {
		//       extend: 'print',
		//         text: 'Imprimir'          
		//   },
		//   {
		//     extend: 'pdf',
		//     text: 'PDF'
		//   },
		//   {
		//     extend: 'excel',
		//     text: 'Excel'
		//   }

		// ],     
		"scrollY": 250,
		"responsive": true,
		'paging': false,
		'lengthChange': false,
		'searching': true,
		'ordering': true,
		'info': true,
		'autoWidth': true,
		// 'columns': [
		//             { "width": "10%" },
		//             { "width": "30%" },
		//             { "width": "10%" },
		//             { "width": "10%" },
		//             { "width": "10%" },
		//             { "width": "10%" },
		//             { "width": "10%" }
		//           ],
		/*Cambiando a espanol el lenguaje*/
		'language': {

			"sProcessing": "Procesando...",
			"sLengthMenu": "Mostrar _MENU_ registros",
			"sZeroRecords": "No se encontraron resultados",
			"sEmptyTable": "Ningun producto agregado",
			"sInfo": "Mostrando del _START_ al _END_ de un total de _TOTAL_ registros",
			"sInfoEmpty": "Mostrando del 0 al 0 de un total de 0 registros",
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
        }
    }
});

function show_detail(folio){	
	let url = $('#ruta').val();
	$.ajax({
		type: 'ajax',
		method: 'post',
		url: url+'ventas/obtiene_detalle_venta_by_id',
		data: { id:folio  },
		async: true,
		dataType:'json',
		success: function(response){
			if (response.success) {
				console.log(response); 
				console.log(response.total_ticket); 
				console.log(response.abonos); 
				pinta_detalles(response.ticket,response.total_ticket,response.abonos);
			}else{
			Swal.fire(
				'Ups !',
				'Codigo no encontrado',
				'error'
				)
			}
		},
		error: function(response){              
			alert('No se pudieron eliminar');
			console.log(response);
		}

	});
}

function alertCancelar(){
	Swal.fire({
		title: 'Deseas cancelar la venta?',
		showDenyButton: true,
		showCancelButton: false,
		confirmButtonText: `Si, cancelar`,
		denyButtonText: `No, volver`,
	  }).then((result) => {
		/* Read more about isConfirmed, isDenied below */
		if (result.isConfirmed) {
		  Swal.fire('Venta Cancelada!', '', 'success')
		} else if (result.isDenied) {
		  Swal.fire('Changes are not saved', '', 'info')
		}
	  })
}

function pinta_detalles(detalles,total,pagado){
	let table = document.querySelector('#detailTicket');
	let table_footer = document.querySelector('#table-detalles-ticket_wrapper tfoot');
	let fila = "";
	fila +=`<table id="table-detalles-ticket" class="table table-sm table-hover bg-white">
			<thead>
				<tr>
					<th>Cant</th>
					<th>Descripcion</th>
					<th class="text-right">Precio</th>
					<th class="text-right">Importe</th>
					<th></th>
				</tr>
			</thead>
			<tbody>`;                        
			
	detalles.forEach(elemento => {
		fila += `<tr>
					<td>${elemento.cantidad}</td>
					<td style="font-size: 10px;">${elemento.producto}</td>
					<td class="text-right">$${elemento.precio}</td>
					<td class="text-right">$${elemento.importe}</td>
					<td>
						
					</td>
				</tr>`;
	});
	fila += `</tbody>
				<tfoot class="bg-secondary">
				<tr>
					<td></td>
					<td></td>
					<td>Total</td>
					<td class="text-right">${total}</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td>Pagado:</td>
					<td class="text-right">${pagado}</td>
					<td></td>
				</tr>
				</tfoot>
			</table>
			<ul class="breadcrumbs">
				<li class="nav-home">
					<button class="btn btn-danger btn-xs" onclick="alertCancelar()">Cancelar venta</button>
				</li>
				<li class="nav-home">
				<button class="btn btn-success btn-xs">ReImprimir ticket</button>
				</li>
			</ul>
			<br>
			<span class="ml-5 text-muted">Cancelar: cancela venta y hace la devolución en inventario</span>`;
	table.innerHTML = fila;
	//$('#table-detalles-ticket_wrapper tfoot').html(pie);
}

$('#content-table').DataTable(
	{
		//     'dom'  : 'Bfrtip',
		//     buttons: [
		//   {
		//       extend: 'print',
		//         text: 'Imprimir'          
		//   },
		//   {
		//     extend: 'pdf',
		//     text: 'PDF'
		//   },
		//   {
		//     extend: 'excel',
		//     text: 'Excel'
		//   }

		// ],     
		"scrollY": 250,
		"responsive": true,
		'paging': false,
		'lengthChange': false,
		'searching': true,
		'ordering': true,
		'info': true,
		'autoWidth': true,
		// 'columns': [
		//             { "width": "10%" },
		//             { "width": "30%" },
		//             { "width": "10%" },
		//             { "width": "10%" },
		//             { "width": "10%" },
		//             { "width": "10%" },
		//             { "width": "10%" }
		//           ],
		/*Cambiando a espanol el lenguaje*/
		'language': {

			"sProcessing": "Procesando...",
			"sLengthMenu": "Mostrar _MENU_ registros",
			"sZeroRecords": "No se encontraron resultados",
			"sEmptyTable": "Ningun producto agregado",
			"sInfo": "Mostrando del _START_ al _END_ de un total de _TOTAL_ registros",
			"sInfoEmpty": "Mostrando del 0 al 0 de un total de 0 registros",
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
        }
    }
});
let meses = new Array ("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
let f=new Date();
let fecha_inventario = f.getDate() + " de " + meses[f.getMonth()] + " de " + f.getFullYear();
setTimeout(() => {
	mostrar();
}, 5000);

function  mostrar() {
	$('#cargando').remove();
}
// setTimeout(function(){ 
// 	alert("Hello"); 
// }, 3000);

$('#productos-table').DataTable({
	//"processing": true,
		'dom'  : 'Bfrtip',
    buttons: [        
        {
		    extend: 'pdfHtml5',
			footer: true,
			text: 'Inventario PDF',
			className: 'btn btn-sm btn-primary', 
			init: function(api, node, config) {
				$(node).removeClass('btn-secondary')
			},
		    filename: 'Inventario '+fecha_inventario,
		    pageSize: 'LEGAL',
		    orientation: 'portrait', //'landscape'
			title:'Inventario '+fecha_inventario,
			exportOptions: {
				columns: [ 0,1, 2, 3 ]
				},
		    customize: function (doc) {
		        doc.content[1].table.widths = ["20%","60%","10%","10%"];
				doc.styles.tableHeader.alignment = 'left';
		        doc.styles.tableBodyEven.alignment = 'left';
		    	doc.styles.tableBodyOdd.alignment = 'left';
	      	}
        }
       
	],     
		//"scrollY": 250,
		"responsive": true,
		'paging': true,
		'lengthChange': false,
		'searching': true,
		'ordering': true,
		'info': true,
		'autoWidth': true,
		// 'columns': [
		//             { "width": "10%" },
		//             { "width": "30%" },
		//             { "width": "10%" },
		//             { "width": "10%" },
		//             { "width": "10%" },
		//             { "width": "10%" },
		//             { "width": "10%" }
		//           ],
		/*Cambiando a espanol el lenguaje*/
		'language': {

			"sProcessing": "Procesando...",
			"sLengthMenu": "Mostrar _MENU_ registros",
			"sZeroRecords": "No se encontraron resultados",
			"sEmptyTable": "Ningun producto agregado",
			"sInfo": "Mostrando del _START_ al _END_ de un total de _TOTAL_ registros",
			"sInfoEmpty": "Mostrando del 0 al 0 de un total de 0 registros",
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
        }
    }
});

$('#buscar-productos-table').DataTable(
	{
		     
		"scrollY": 250,
		"responsive": true,
		'paging': false,
		'lengthChange': false,
		'searching': true,
		'ordering': true,
		'info': true,
		'autoWidth': true,
		// 'columns': [
		//             { "width": "10%" },
		//             { "width": "30%" },
		//             { "width": "10%" },
		//             { "width": "10%" },
		//             { "width": "10%" },
		//             { "width": "10%" },
		//             { "width": "10%" }
		//           ],
		/*Cambiando a espanol el lenguaje*/
		'language': {

			"sProcessing": "Procesando...",
			"sLengthMenu": "Mostrar _MENU_ registros",
			"sZeroRecords": "No se encontraron resultados",
			"sEmptyTable": "Ningun producto agregado",
			"sInfo": "Mostrando del _START_ al _END_ de un total de _TOTAL_ registros",
			"sInfoEmpty": "Mostrando del 0 al 0 de un total de 0 registros",
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
        }
    }
});

/*
*	TABLA PARA REPORTES DE VENTAS
*/
let fecha = $('#report').val();
$('.content-table-reporte').DataTable({
	'dom'  : 'Bfrtip',
    buttons: [        
        {
		    extend: 'pdfHtml5',
			footer: true,
			text: 'PDF',
			className: 'btn btn-sm btn-primary', 
			init: function(api, node, config) {
				$(node).removeClass('btn-secondary')
			},
		    filename: 'Reporte ',
		    pageSize: 'LEGAL',
		    orientation: 'portrait', //'landscape'
		    title:'Reporte de Ventas '+fecha,
		    customize: function (doc) {
		        doc.content[1].table.widths = ["50%","10%","20%","20%"];
				doc.styles.tableHeader.alignment = 'left';
		        doc.styles.tableBodyEven.alignment = 'left';
		    	doc.styles.tableBodyOdd.alignment = 'left';
	      	}
        },
        {
          extend: 'excel',
			footer: true,
		  text: 'Excel',
		  className: 'btn btn-sm btn-primary', 
			init: function(api, node, config) {
				$(node).removeClass('btn-secondary')
			},
          title:'Reporte de Ventas '+fecha,
          filename: 'Reporte ',
        }
       
	],       
		"scrollY": 250,
		"responsive": true,
		'paging': false,
		'lengthChange': false,
		'searching': true,
		'ordering': true,
		'info': true,
		'autoWidth': true,
		// 'columns': [
		//             { "width": "10%" },
		//             { "width": "30%" },
		//             { "width": "10%" },
		//             { "width": "10%" },
		//             { "width": "10%" },
		//             { "width": "10%" },
		//             { "width": "10%" }
		//           ],
		/*Cambiando a espanol el lenguaje*/
		'language': {

			"sProcessing": "Procesando...",
			"sLengthMenu": "Mostrar _MENU_ registros",
			"sZeroRecords": "No se encontraron resultados",
			"sEmptyTable": "Ninguna venta realizada",
			"sInfo": "Mostrando del _START_ al _END_ de un total de _TOTAL_ registros",
			"sInfoEmpty": "Mostrando del 0 al 0 de un total de 0 registros",
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
        }
    }
});

function getInputImporte() {
    
    let totalImport = 0;
    const inputElemnt = document.querySelectorAll('.inputPago');
    let methodPag = '';
    pagos = [];    
    //RECORRO CADA INPUT PAGO
    inputElemnt.forEach(element => {
        totalImport += parseFloat(element.value); 
        methodPag = element.dataset.metodo;
        // pagos.push({
        //     metodo: methodPag,
        //     importe: element.value
        // });   
        // parametros.pagos = pagos;       
    });
    parametros.netoPagado = totalImport;
    //parametros.importe_pago = totalImport;
    insertarCambio(totalImport);
    pagos.push({
        metodo: methodPag,
        importe: parametros.importe_pago
    });   
    parametros.pagos = pagos;
}
function insertarCambio(importe) {
    const lblCambio = document.querySelector('#lblCambio');
    //const tdImporte = document.querySelector('.tdImporte');
    if (importe > parseFloat(parametros.importe_nota)) {
		let cambio = importe - parseFloat(parametros.importe_nota);
		let newFormato = new Intl.NumberFormat("en-IN").format(cambio);
        lblCambio.innerHTML = `<span class="h1 text-warning">Cambio: $ ${newFormato}</span>`;
        //tdImporte.innerHTML = parametros.importe_nota;
        parametros.importe_pago = parametros.importe_nota;
    }else{
        lblCambio.innerHTML = `<span class="h3"></span>`;
        //tdImporte.innerHTML = importe;
        parametros.importe_pago = importe;
    }       
}




