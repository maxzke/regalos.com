let parametros = {
    /*
    * BD TABLA ::: CLIENTES
    * ID=1 -> PUBLICO GENERAL
    */
    id_cliente:0,
    id_mesa:'',
    nombre_cliente:'Publico General',
    direccion_cliente:'',
    telefono_cliente:'',
    rfc_cliente:'',
    razon_social_cliente:'',
    correo_cliente:'',
    id_usuario:'',
    carrito:'',
    metodo_pago:'',
    importe_pago:0,
    importe_nota:'',
    pagos:'',
    netoPagado:''
}    

/*
     * 
     * Obtiene Carrito de la BD
     *  
     */

    //getCarrito();
    
    // function insertProductToCartManual(nombre, precio, cantidad){
    //     let item = {
    //         name:nombre,
    //         price:precio,
    //         count:cantidad
    //     }
    //     let carrito = [];
    //     carrito = JSON.parse(localStorage.getItem("shoppingCartRegalos"));
    //     if (carrito === null) {
    //         carrito = [];
    //     } 
    //     carrito.push(item);
    //     localStorage.setItem("shoppingCartRegalos",JSON.stringify(carrito));
    //     getCarrito();
    // }

    // async function getCarrito(){
    //     if (localStorage.getItem("shoppingCartRegalos") != null) {
    //         mostrarCarrito(JSON.parse(localStorage.getItem("shoppingCartRegalos")));   
    //     }        
    // }
    // async function ajaxCarrito(id_mesa,url){
    //     const response = $.ajax({
    //         type: 'ajax',
    //         method: 'post',
    //         url: url,
    //         data:{id:id_mesa},
    //         async: true,
    //         dataType: 'json'
    //     });
    //     const data = await response;
    //     return data;
    // }

    function mostrarCarrito(cartArray){
        parametros.importe_nota = 0;
        $("#show-cart").html(" ");
        let output ="";
        let ttalCar = 0;
        if (cartArray.length <= 0) {
                output = "<div class='mt-4 display-4 text-primary'><i class='fas fa-lg fa-shopping-cart'></i> </div><p class='text-muted h5'>Su carro de compra esta vacío </p >";
        }else{
            
                for (var i in cartArray) {
                    precioUnitario = (cartArray[i].price) / cartArray[i].count;
                    subtotaltem = cartArray[i].price;
                    let newFormato = new Intl.NumberFormat("en-IN").format(subtotaltem);
                    ttalCar = ttalCar + subtotaltem;
                    output += `<div class='row cart-each-product py-0'>
                            <div class='col-12 col-md-6 texto_articulo py-0'>`+ cartArray[i].name +`</div>
                            <div class='col-3 offset-4 col-md-2 offset-md-0 align-self-center py-0'>
                                <input type='number' onfocus='this.select();' class='quantity form-control form-control-sm py-0 item-count col-md-10' data-name='` + cartArray[i].name + `' data-price='` + subtotaltem + `' min='0' value=` + cartArray[i].count + ` name='number'>
                            </div>
                            <div class='col-3 col-md-2 align-self-center texto_articulo py-0'>
                                ` + precioUnitario + `</i>
                            </div>
                            <div class='col-3 col-md-2 align-self-center texto_articulo py-0'>
                                ` + newFormato + `</i>
                            </div>                                                        
                        </div>
                        </div>
                            <hr>`;
                            parametros.importe_nota += subtotaltem;
                }
            
            }
        $("#show-cart").html(output);
        let ct = new Intl.NumberFormat("en-IN").format(ttalCar);
        let str = "Total $ "+ct;
        $("#totalCarrito").html(str);
        
    }

    /**
     * 
     * Guarda Carrito en la BD
     *  
     */
    async function insertCarrito(id,url,carrito){
        const respuesta = await ajaxInsertCarrito(id,url,carrito);
        console.log(respuesta);
        if(respuesta.success){
            let str = respuesta;         
            console.log(str);
            localStorage.setItem("shoppingCartRegalos",str );   
        }else{
            this.cart = [];
        }        
    }
    async function ajaxInsertCarrito(id_mesa,url,carrito){
        const response = $.ajax({
            type: 'ajax',
            method: 'post',
            url: url,
            data:{id:id_mesa,carrito:carrito.toString()},
            async: true,
            dataType: 'json'
        });
        const data = await response;
        return data;
    }


/* *********************************************************************************************
 * *********************************************************************************************
 ********************************************************************************************* */
/*
 * jQuery Simple Shopping Cart v0.1
 * Basis shopping cart using javascript/Jquery.
 *
 * Authour : Sirisha
 */
/* '(function(){})();' this function is used, to make all variables of the plugin Private */
(function ($, window, document, undefined) {

    /* Default Options */
    var defaults = {
        cart: [],
        addtoCartClass: '.sc-add-to-cart',
        addtoCartClassCode: '.sc-add-to-cart-code',
        cartProductListClass: '.cart-products-list',
        totalCartCountClass: '.total-cart-count',
        totalCartCostClass: '.total-cart-cost',
        showcartID : '#show-cart',
        itemCountClass : '.item-count',
        vaciarCarrito : '.limpiar_carrito'
    };

    function Item(name, price, count, codigo) {
        this.name = name;
        this.price = price;
        this.count = count;
        this.codigo = codigo;
    }
    /*Constructor function*/
    function simpleCart(domEle, options) {

        /* Merge user settings with default, recursively */
        this.options = $.extend(true, {}, defaults, options);
        //Cart array
        this.cart = [];
        //Dom Element
        this.cart_ele = $(domEle);
        //Initial init function
        this.init();
    }


    /*plugin functions */
    $.extend(simpleCart.prototype, {
        init: function empieza() {
            this._setupCart();
            this._setEvents();
            this._loadCart();
            this._updateCartDetails();
        },
        _setupCart: function () {
            this.cart_ele.addClass("cart-grid panel panel-defaults");
            this.cart_ele.append(`<div class='panel-body cart-body'>
                                    <div class='cart-products-list' id='show-cart'>
                                        <!-- Dynamic Code from Script comes here-->
                                    </div>
                                </div>`);
        },
        _addProductstoCart: function () {
        },
        _updateCartDetails: function () {
            var mi = this;
            $(this.options.cartProductListClass).html(mi._displayCart());
            $(this.options.totalCartCountClass).html(" " + mi._totalCartCount() + " Artículos");
            let str = mi._totalCartCost();
            let unDecimal = Number(str);
            let formato = new Intl.NumberFormat("en-IN").format(unDecimal);
            $(this.options.totalCartCostClass).html(formato);
            //actualiza carrito para enviarlo post al guardar/cobrar la venta
            getCarrito();
            
        },
        _setCartbuttons: function () {

        },
        _setEvents: function () {
            var mi = this;
            $(document).on("click",this.options.addtoCartClass, function (e) {
                e.preventDefault();
                var name = $(this).attr("data-name");
                var cost = Number($(this).attr("data-price"));
                var amount = Number($(this).attr("data-quantity"));
                var codigo = $(this).attr("data-codigo");
                mi._addItemToCart(name, cost, amount, codigo);                
                mi._updateCartDetails();
                //mostrarCarrito(JSON.parse(localStorage.getItem("shoppingCartRegalos"))); 
                Swal.fire({
                    position: 'center',
                    icon: 'success',
                    title: 'Agregado !',
                    showConfirmButton: false,
                    timer: 1500
                })
            });

            $(document).on("keypress",this.options.addtoCartClassCode, function (e) {
                if(e.keyCode == 13){
                    let url = $('#ruta').val();
                    let codigo = $('#inputBuscarPorCodigo').val();
                    $.ajax({
                        type: 'ajax',
                        method: 'post',
                        url: url+'producto/getProductoByCodigo',
                        data: { codigo:codigo  },
                        async: true,
                        dataType:'json',
                        success: function(response){
                            if (response.success) {
                                if (response.producto[0]['stock'] > 0) {
                                    var name = response.producto[0]['nombre'];
                                    var cost = response.producto[0]['precio'];
                                    var amount = Number(1);
                                    var codigo = response.producto[0]['codigo'];
                                    mi._addItemToCart(name, cost, amount, codigo);                
                                    mi._updateCartDetails();
                                    $('#inputBuscarPorCodigo').val('');
                                } else {
                                    Swal.fire(
                                    'Agotado !',
                                    response.producto[0]['nombre'],
                                    'error'
                                    )
                                }                                
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
                        }
            
                    });
                    
                }//end if
                
            });

            $(this.options.showcartID).on("change", this.options.itemCountClass, function (e) {
                var ci = this;
                e.preventDefault();
                var count = $(this).val();
                var name = $(this).attr("data-name");
                var cost = Number($(this).attr("data-price"));
                var codigo = $(this).attr("data-codigo");
                console.log('codigo: '+codigo);
                mi._removeItemfromCart(name, cost, count, codigo);
                mi._updateCartDetails();
            });

            $(document).on("click",this.options.vaciarCarrito, function (e) {
                mi._clearCart();
                mi._updateCartDetails();
            });

        },
        /* Helper Functions */
        _addItemToCart: function (name, price, count, codigo) {
            for (var i in this.cart) {
                if (this.cart[i].codigo === codigo) {
                    this.cart[i].count++;
                    this.cart[i].price = price * this.cart[i].count;
                    this.cart[i].codigo = codigo;
                    this._saveCart();
                    return;
                }
            }
            var item = new Item(name, price, count, codigo);
            this.cart.push(item);
            this._saveCart();
        },
        _removeItemfromCart: function (name, price, count, codigo) {
            console.log('codigo: '+codigo);
            for (var i in this.cart) {
                console.log('codigo: '+this.cart[i].codigo);

                if (this.cart[i].codigo === codigo) {
                    var singleItemCost = Number(price / this.cart[i].count);
                    this.cart[i].count = count;
                    this.cart[i].price = singleItemCost * count;
                    if (count == 0) {
                        this.cart.splice(i, 1);
                    }
                    break;
                }
            }
            this._saveCart();
        },
        _clearCart: function () {
            this.cart = [];
            this._saveCart();
        },
        _totalCartCount: function () {
            return this.cart.length;
        },
        _displayCart: function () {
            var cartArray = this._listCart();
            parametros.importe_nota = 0 ;
            //console.log(cartArray);
            var output = "";
            let precioUnitario = 0;
            let subtotaltem = 0;
            if (cartArray.length <= 0) {
                output = "<div class='mt-4 display-4 text-primary'><i class='fas fa-lg fa-shopping-cart'></i> </div>";
            }else{
                for (var i in cartArray) {
                    precioUnitario = (cartArray[i].price) / cartArray[i].count;
                    subtotaltem = cartArray[i].price;
                    let newFormato = new Intl.NumberFormat("en-IN").format(subtotaltem);
                    let newFormatoUnitario = new Intl.NumberFormat("en-IN").format(precioUnitario);
                    output += `<div class='row cart-each-product'>
                            <div class='col-12 col-md-6 texto_articulo'>`+ cartArray[i].name +`</div>
                            <div class='col-3 offset-4 col-md-2 offset-md-0 align-self-center'>
                                <input type='number' 
                                onfocus='this.select();' 
                                class='quantity form-control form-control-sm item-count col-md-10' 
                                data-name='` + cartArray[i].name + `' 
                                data-price='` + subtotaltem + `' 
                                data-codigo='` + cartArray[i].codigo + `' 
                                min='0' 
                                value=` + cartArray[i].count + ` 
                                name='number'>
                            </div>
                            <div class='col-3 col-md-2 align-self-center texto_articulo'>
                                ` + newFormatoUnitario + `</i>
                            </div>
                            <div class='col-3 col-md-2 align-self-center texto_articulo'>
                                ` + newFormato + `</i>
                            </div>                                                        
                        </div>
                        </div>
                            <hr>`;
                            parametros.importe_nota += Number(subtotaltem);
                }
            }
            
            return output;
        },
        _totalCartCost: function () {
            var totalCost = 0;
            for (var i in this.cart) {
                totalCost += Number(this.cart[i].price);
            }
            
            return totalCost;
        },
        _listCart: function () {
            var cartCopy = [];
            for (var i in this.cart) {
                var item = this.cart[i];
                var itemCopy = {};
                for (var p in item) {
                    itemCopy[p] = item[p];
                }
                cartCopy.push(itemCopy);
            }
            return cartCopy;
        },
        _calGST: function () {
            var GSTPercent = 18;
            var totalcost = this.totalCartCost();
            var calGST = Number((totalcost * GSTPercent) / 100);
            return calGST;
        },
        _saveCart: function () {            
            localStorage.setItem("shoppingCartRegalos", JSON.stringify(this.cart));
        },
        _loadCart: function () {
            this.cart = [];
            this.cart = JSON.parse(localStorage.getItem("shoppingCartRegalos"));
            if (this.cart === null) {
                this.cart = [];
            } 
        }
    });
    /* Defining the Structure of the plugin 'simpleCart'*/
    $.fn.simpleCart = function (options) {
        return this.each(function () {
            $.data(this, "simpleCart", new simpleCart(this));
            //console.log($(this, "simpleCart"));
        });
    };
})(jQuery, window, document)
/* *********************************************************************************************
 * *********************************************************************************************
 **********************************************************************************************/


//SE DEFINE EL ESTILO Y DISEÑO DE LA ALERTA

// $('#inputBuscarPorCodigo').keypress(function(e){
//     if(e.keyCode == 13){
//         let url = $('#ruta').val();;
//         let codigo = $('#inputBuscarPorCodigo').val();
//         $.ajax({
//             type: 'ajax',
//             method: 'post',
//             url: url+'producto/getProductoByCodigo',
//             data: { codigo:codigo  },
//             async: true,
//             dataType:'json',
//             success: function(response){
//               if (response.success) {
//                   let n = response.producto[0]['codigo']+' - '+response.producto[0]['nombre'];
//                   let p = response.producto[0]['precio'];
//                 insertProductToCartManual(n, p, 1);
//                 // Swal.fire(
//                 //     'ok',
//                 //     'codigo: '+response.producto[0]['codigo'],
//                 //     'success'
//                 //   )
//               }else{
//                 Swal.fire(
//                     'Error!',
//                     'Codigo no encontrado',
//                     'error'
//                   )
//               }

//             },
//             error: function(response){              
//               alert('No se pudieron eliminar');
//             }

//         });
        
//     }
// });

 $('#btnGuardarImprimirTicket').click(function(){
    // let mensaje = {
    //     title: 'Total: $ 350.00 <br> Pagado: $ 200.00 <br> Cambio: $ 50.00',
    //     text:'',
    //     button:'success'
    // }
    // alert_confirm_success(mensaje);
    if (parametros.importe_pago < parametros.importe_nota) {
        //venta a credito
        if ( parametros.id_cliente == 0 ) {
            //Alerta debe seleccionar cliente
            //alertaSinClienteSeleccionado();
        } else {
            //cliente seleccionado
            //se guardara venta a credito?
            alertaPago();
        }        
    }else{
        console.log('con pago' + parametros.importe_pago);
        console.log(parametros);
        sendData();
    }
 });

 async function sendData() {
    let baseUrl = $('#ruta').val();
    const urlDetalles = baseUrl+'Ventas/registrar_venta';
    const respAsyncDetalles = await postData(urlDetalles,parametros);
    console.log(parametros);
    if (respAsyncDetalles.success) {
        console.log(respAsyncDetalles);
        // parametros.nombre_cliente = '';
        // parametros.carrito = '';
        ventaRealizada();  
    }else{
        console.log(respAsyncDetalles.error);
        let msg = '';
        respAsyncDetalles.error.forEach(element => {
            msg += element.msg+'<br>';
        });
        Swal.fire(
            msg,
            'Intente de nuevo...',
            'error'
        )
    }
}
function ventaRealizada(){
           
    deleteItemLocalStorage('shoppingCartRegalos'); 
    parametros = {
        id_cliente:'',
        nombre_cliente:'',
        direccion_cliente:'',
        telefono_cliente:'',
        rfc_cliente:'',
        razon_social_cliente:'',
        correo_cliente:'',
        id_usuario:'',
        carrito:'',
        metodo_pago:'',
        importe_pago:0,
        importe_nota:'',
        pagos:''
    }
    pagos = [];
    location.reload();
}
function deleteItemLocalStorage(key){
    localStorage.removeItem(key);
}
function getCarrito() {
    parametros.carrito = getLocalStorage();        
}
function getLocalStorage() {
    let items = [];
    if (localStorage.getItem('shoppingCartRegalos') === null) {
        items = [];
    } else {
        let info = localStorage.getItem('shoppingCartRegalos');
        items = JSON.parse(info);
    }
    return items;
}

async function postData(url,datos) {
    const response = $.ajax({
        url: url,
        data: { data: datos },
        method: 'post',
        async: true,
        dataType: 'json',
    });
    const data = await response;
    return data;
}
 
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

/*
 * BUSCADOR PRODUCTOS PAGINADO
 */
 function buscar_datos(dato,direccion){	
     
    $.ajax({
        type: 'ajax',
        method: 'post',
        url: direccion +'producto/consulta',
        data: { busqueda:dato  },
        async: true,
        dataType:'json',
        success: function(response){
            if (response.success) {
                pintaTablaConsulta(response.response);
                console.log(response);                            
            }else{
            Swal.fire(
                'Ups !',
                'Codigo no encontrado',
                'error'
                )
            }

        },
        error: function(response){   
            console.log(direccion +'producto/consulta');             
            alert('No se pudieron finder');
        }

    });
}


$(document).on('keyup','#caja_busqueda', function(){
    let url = $('#ruta').val();
	let valor = $(this).val();
	if (valor != "") {
		buscar_datos(valor,url);
        $('#tablePaginado').hide();
        $('#tableConsulta').show();
	}else{
		$('#tablePaginado').show();
        $('#tableConsulta').hide();
	}
});

function pintaTablaConsulta(productos){
    let table = document.querySelector('#tableConsulta tbody');
    cadena="";
    
            productos.forEach(elemento => {
                cadena += `<tr>
                            <td>${elemento.codigo}</td>
                            <td>${elemento.nombre}</td>
                            <td class="text-center">`;
                            if (elemento.stock ==0) {
                                cadena+=`<span class="badge badge-pill badge-danger">agotado</span>`;
                            }else{
                                cadena+=elemento.stock;
                            }
                                
                            cadena+=`</td>
                            <td class="text-right">${elemento.precio}</td>
                            <td>
                                <a onclick="abastecer('${elemento.id}','${elemento.nombre}','http://localhost/regalos.com/producto/abastecer')" type="button" class="btn btn-outline-success btn-xs btnAbastecer" data-toggle="tooltip" data-placement="left" title="Re-abastecer">
                                    <i class="fas fa-plus"></i></button>
                                <a href="http://localhost/regalos.com/producto/edit/${elemento.id}" class="btn btn-outline-info btn-xs ml-1" data-toggle="tooltip" data-placement="left" title="Editar">
                                <li class="fas fa-edit"></li></a> 
                                <a href="http://localhost/regalos.com/producto/remove/${elemento.id}" class="btn btn-outline-danger btn-xs" data-toggle="tooltip" data-placement="left" title="Eliminar">
                                <li class="fas fa-times"></li></a>
                            </td>
                        </tr>`;
                        table.innerHTML = cadena;
            });

}