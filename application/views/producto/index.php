
        <div class="page-inner">
            <div class="page-header">
				<div class="row">
					<div class="col-md-3">
						<h4 class="page-title">Listado de Productos</h4>
						<input id="ruta" type="hidden" value="<?php echo base_url(); ?>">
					</div>
					<div class="col-md-3">
						<a href="<?php echo site_url('producto/add'); ?>" class="btn btn-sm btn-success">Agregar Nuevo Producto</a>
					</div>
					<div class="col-md-6">				
						<div class="form-group row">
							<label for="inputPassword" class="col-md-2 text-right">Buscar:</label>
							<div class="col-md-10">
							<input type="text" class="form-control form-control-sm" id="caja_busqueda">
							</div>
						</div>
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

					<!-- TABLA CONSULTA -->
					<table id="tableConsulta" class="table table-sm table-hover table-bordered bg-white" style="display:none">
							<thead>
								<tr>
									<th>Código</th>
									<th>Producto</th>
									<th>Stock</th>
									<th>Precio</th>
									<th>Opciones</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					<!-- FIN TABLA CONSULTA -->

				<!-- CONTENIDO -->
						<table id="tablePaginado" class="table table-sm table-hover table-bordered bg-white">
							<thead>
								<tr>
									<th>#</th>
									<th>Código</th>
									<th>Producto</th>
									<th>Stock</th>
									<th>Precio</th>
									<th>Opciones</th>
								</tr>
							</thead>
								<tbody>
								<?php foreach($productos as $p){ ?>
								<tr>
									<td><?php echo $p['id']; ?></td>
									<td><?php echo $p['codigo']; ?></td>
									<td><?php echo $p['nombre']; ?></td>
									<td class="text-center">
									<?php 
										if ( $p['stock']==0 ): ?>
											<span class="badge badge-pill badge-danger">agotado</span>
										<?php else: 
											echo $p['stock'];
										endif ?>
									</td>
									<td class="text-right"><?php echo $p['precio']; ?></td>
									<td>
										<a onclick="abastecer('<?php echo $p['id'] ?>','<?php echo $p['nombre'] ?>','<?php echo base_url('producto/abastecer'); ?>')" type="button" class="btn btn-outline-success btn-xs btnAbastecer" data-toggle="tooltip" data-placement="left" title="Re-abastecer">
											<i class="fas fa-plus"></i></button>
										<a href="<?php echo site_url('producto/edit/'.$p['id']); ?>" class="btn btn-outline-info btn-xs ml-1" data-toggle="tooltip" data-placement="left" title="Editar">
										<li class="fas fa-edit"></li></a> 
										<a href="<?php echo site_url('producto/remove/'.$p['id']); ?>" class="btn btn-outline-danger btn-xs" data-toggle="tooltip" data-placement="left" title="Eliminar">
										<li class="fas fa-times"></li></a>
									</td>
								</tr>
								<?php } ?>
							</tbody>
						</table>
						<div>
							<?php echo $this->pagination->create_links(); ?>    
						</div>
						<span class="text-mute">Mostrando del <?php echo $total_rows_de; ?> al <?php echo $total_rows_al; ?> de un total de <?php echo $total_rows; ?> registros.</span>
						

            	<!-- /CONTENIDO -->
				</div>
            </div>
        </div>