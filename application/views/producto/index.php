
        <div class="page-inner">
            <div class="page-header">
				<div class="row">
				<div class="col-md-4">
                <h4 class="page-title">Listado de Productos Disponibles</h4>
				</div>
				<div class="col-md-8">
				<a href="<?php echo site_url('producto/add'); ?>" class="btn btn-sm btn-success">Agregar Nuevo Producto</a>
				</div>
				</div>
				<?php if ($this->session->flashdata('item')) { ?>
					<div class="alert alert-success alert-dismissible fade show" role="alert">
					<strong><?php echo $this->session->flashdata('item'); ?>!</strong> Abastecido correctamente
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					</div>
				<?php } ?>
            </div>
            <div class="row">
				<div class="col-md-12">
				<!-- CONTENIDO -->
				<div class="spinner-border text-info" role="status">
					<span class="sr-only">Loading...</span>
				</div>

					<table id="productos-table" class="table table-sm table-hover table-bordered bg-white">
                        <thead>
							<tr>
								<th>Código</th>
								<th>Producto</th>
								<th>Stock</th>
								<!-- <th>Alerta</th> -->
								<th>Precio</th>
								<!-- <th>Costo</th> 
								<th>Imagen</th>
								<th>Abastecer</th>-->
								<th>Opciones</th>
							</tr>
						</thead>
							<tbody>
							<?php foreach($productos as $p){ ?>
							<tr>
								<td><?php echo $p['codigo']; ?></td>
								<td><?php echo $p['nombre']; ?></td>
								<td><?php echo $p['stock']; ?></td>
								<!-- <td><?php //echo $p['stock_minimo']; ?></td> -->
								<td><?php echo $p['precio']; ?></td>
								<!-- <td><?php //echo $p['costo']; ?></td> -->
								<!-- <td>
									<img src="<?php //echo $p['imagen']; ?>" class="img-fluid" alt="<?php //echo $p['nombre']; ?>" width="50px">
								</td> -->
								<!-- <td>
									<form action="<?php //echo base_url('producto/abastecer'); ?>" method="post">
										<div class="input-group">
											<input type="hidden" name="id" value="<?php //echo $p['id'] ?>">
											<input name="cantidad" type="text" class="form-control form-control-sm col-md-4" placeholder="cantidad" aria-label="Recipient's username" aria-describedby="button-addon2" autocomplete="off">
											<div class="input-group-append">
												<button class="btn btn-sm btn-outline-success" type="submit"><li class="fas fa-save fa-lg"></li></button>
											</div>
										</div>
									</form>
								</td> -->
								<td>
									<a onclick="abastecer('<?php echo $p['id'] ?>','<?php echo $p['nombre'] ?>','<?php echo base_url('producto/abastecer'); ?>')" type="button" class="btn btn-outline-success btn-xs btnAbastecer" data-toggle="tooltip" data-placement="left" title="Re-abastecer">
										<i class="fas fa-plus"></i></button>
									<a href="<?php echo site_url('producto/edit/'.$p['id']); ?>" class="btn btn-outline-info btn-xs" data-toggle="tooltip" data-placement="left" title="Editar">
									<li class="fas fa-edit"></li></a> 
									<a href="<?php echo site_url('producto/remove/'.$p['id']); ?>" class="btn btn-outline-danger btn-xs" data-toggle="tooltip" data-placement="left" title="Eliminar">
									<li class="fas fa-times"></li></a>
								</td>
							</tr>
							<?php } ?>
						</tbody>
					</table>

            	<!-- /CONTENIDO -->
				</div>
            </div>
        </div>