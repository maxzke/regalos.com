<div class="row">
    <div class="col-md-2 py-1">
            <h4><strong>VENTA DE PRODUCTOS</strong></h4>
    </div>
    <div class="col-md-2">
        <input type="text" class="form-control form-control-sm sc-add-to-cart-code" name="inputBuscarPorCodigo" id="inputBuscarPorCodigo" placeholder="Código"
        onclick="this.select()">
        <input type="hidden" name="url" id="ruta" value="<?php echo base_url(); ?>">
    </div>
    <div class="col-md-8">
        <button 
        class="btn btn-sm btn-info my-2 my-sm-0" 
        type="button" 
        data-toggle="modal" 
        data-target="#modalBuscarProducto">
            <i class="fas fa-search"></i> Buscar Producto
        </button>
        <!-- <form class="form-inline my-2 my-lg-0">
            <input class="form-control form-control-sm mr-sm-2 col-sm-3" id="inputCodigoProducto" type="text" placeholder="Código" autocomplete="off">
            <button class="btn btn-sm btn-info my-2 my-sm-0" type="button" data-toggle="modal" data-target="#modalBuscarProducto">
            <i class="fas fa-search"></i> Buscar</button>
        </form> -->
    </div>    
</div>

<div class="row mt-4">
    <!-- CONTENIDO -->
    <!-- CONTENIDO CARRITO      -->
    <!-- COL-5 CARRITO -->
    <div class="col-sm-12 col-md-7">
        <div class="card py-2 px-4">
            <div class="row">
                <div class="col-md-6 text-center text-dark bg-secondary py-1">
                    Producto
                </div>
                <div class="col-md-2 text-center text-dark bg-secondary py-1">
                    Cant
                </div>
                <div class="col-md-2 text-dark bg-secondary py-1">
                    Precio
                </div>
                <div class="col-md-2 text-dark bg-secondary py-1">
                    Total
                </div>
                <div class="col-md-12 pt-2 Carrito" id="Carrito">
                    <!-- cart -->
                    <div id="cart" class="cart-grid panel panel-defaults">
                        <!-- AQUI SE CARGARAN LOS ARTICULOS DINAMICAMENTE -->	                                    	  							
                    
                    </div>
                </div>
            </div>
        </div>
    </div><!-- /COL-5 CARRITO -->
    <!-- COL-7 PRODUCTOS -->
    <div class="col-md-5">
        <!-- TAB-CARRITO******************************************************************* -->
        
        <!-- TOTAL A PAGAR -->
        <div class="row">
            <div class="col-md-12 text-center" id="totalImporte">
                <i class="fas fa-dollar-sign fa-5x text-success"> 
                    <span class="total-cart-cost"></span>
                </i>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-md-12 text-center">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><strong>Importe Recibido</strong></span>
                        <span class="input-group-text">$</span>
                    </div>
                    <!-- <input type="number" class="form-control" id="inputImportePagado"> -->
                    <input 
                        class="form-control inputPago" 
                        type="text" 
                        onkeyup="getInputImporte()" 
                        onclick="this.select()" 
                        value="0" 
                        data-metodo="1">
                    </div>
                </div>
                <table id="tableMetodo" class="table">
                    <tbody>                           
                        <tr class="text-center">
                            <th>
                                                            
                            </th>
                            <th>
                            <div class="col-md-12 text-center" id="lblCambio"></div>
                                <!-- <span class="text-warning display-4">$ 0</span> -->
                            </th>
                        </tr>
                        <tr>
                            <td colspan="2">                                
                                <button 
                                id="btnGuardarImprimirTicket" 
                                class="btn btn-lg btn-block btn-success mt-4 text-dark" 
                                type="button">
                                    <i class="fas fa-print fa-lg"></i>
                                    Guardar e Imprimir Ticket
                                </button>
                                
                            </td>
                        </tr>
                    </tbody>
                </table>
                <!-- CAMBIO -->
                <div class="col-md-12 text-center" id="lblCambio">
                    <!-- IMPORTE TOTAL CART JS-->
                </div>
            </div>
        </div>
        <!-- /TAB-CARRITO******************************************************************* -->
    </div><!-- /COL-7 PRODUCTOS -->
    <!-- /CONTENIDO CARRITO      -->
    <!-- /CONTENIDO -->
</div>


<!-- Modal Buscar Producto-->
<div class="modal fade" id="modalBuscarProducto" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="modalBuscarProductoLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header bg-secondary">
        <h5 class="modal-title" id="modalBuscarProductoLabel"><span class="text-primary">Buscar Producto</span></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
            <div class="col-md-12">
            <table id="buscar-productos-table" class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">Código</th>
                    <th scope="col">Producto</th>
                    <th scope="col">Stock</th>
                    <th scope="col">Precio</th>
                    <th scope="col">x</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach($productos as $p){ ?>
                <tr>
                    <td><?php echo $p['codigo']; ?></td>
                    <td><?php echo $p['nombre']; ?></td>
                    <td><?php echo $p['stock']; ?></td>
                    <td><?php echo $p['precio']; ?></td>
                    <td>
                        <?php 
                        if ($p['stock']>0) : ?>                        
                        <a type="button" 
                        class="btn btn-outline-success btn-xs sc-add-to-cart" 
                        data-toggle="tooltip" 
                        data-placement="top" 
                        title="seleccionar"
                        data-name="<?php echo $p['nombre']; ?>" 
                        data-price="<?php echo $p['precio']; ?>" 
                        data-quantity="1"
                        data-codigo="<?php echo $p['codigo']?>">
                        <i class="fas fa-check"></i>
                        </a>
                        <?php else: ?>
                            <span class="badge badge-danger">Agotado</span>
                        <?php endif; ?>
                    </td>
                </tr>
                <?php } ?>
            </tbody>
        </table>
            </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>