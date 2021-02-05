
        <div class="page-inner">
            <div class="page-header">
				<div class="row">
					<div class="col-md-4">
						<h4 class="page-title">Listado de Productos Disponibles</h4>
					</div>
					<div class="col-md-5">
						<a href="<?php echo site_url('producto/add'); ?>" class="btn btn-sm btn-success">Agregar Nuevo Producto</a>
					</div>
					<div class="col-md-3">				
						
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

					<div id="cargando" class="progress">
						<div 
						class="progress-bar progress-bar-striped progress-bar-animated" 
						role="progressbar" 
						aria-valuenow="15" 
						aria-valuemin="0" 
						aria-valuemax="100" 
						style="width: 100%;">
						Por Favor Espere. Cargando Productos . . .
						</div>
					</div>
				<!-- CONTENIDO -->
					<div id="mostrartable">
						<table id="productos-table" class="table table-sm table-hover table-bordered bg-white">
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
								<?php foreach($productos as $p){ ?>
								<tr>
									<td><?php echo $p['codigo']; ?></td>
									<td><?php echo $p['nombre']; ?></td>
									<td class="text-center">
									<?php 
										if ( $p['stock']==0 ): ?>
											<span class="badge badge-danger">agotado</span>
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
					</div>

            	<!-- /CONTENIDO -->
				</div>
            </div>
        </div>