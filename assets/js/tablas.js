
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

$('#productos-table').DataTable(
	{
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
$('#content-table-reporte').DataTable({
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
        lblCambio.innerHTML = `<span class="h1 text-warning">Cambio: $ ${cambio.toFixed(1)}</span>`;
        //tdImporte.innerHTML = parametros.importe_nota;
        parametros.importe_pago = parametros.importe_nota;
    }else{
        lblCambio.innerHTML = `<span class="h3"></span>`;
        //tdImporte.innerHTML = importe;
        parametros.importe_pago = importe;
    }       
}