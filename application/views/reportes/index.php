        
            <div class="row">
				<div class="col-md-12 text-center">
					<ul class="breadcrumbs">
						<li class="nav-home">
							<h3 class="text-dark text-uppercase">Reporte de ventas <?php echo $fecha ?></h3>
						</li>
						<li class="nav-home">
							<button type="button" class="btn btn-sm btn-primary ml-3" data-toggle="modal" data-target="#exampleModal">Buscar Por Fecha</button>
							<input type="hidden" id="report" value="<?php echo $fecha ?>">
						</li>
					</ul>
				</div>
				<div class="col-md-12">
				<!-- CONTENIDO -->
					<table id="content-table-reporte" class="table table-sm table-hover table-bordered bg-white">
                        <thead>
							<tr>
								<th>PRODUCTO</th>
								<th>Cantidad</th>
								<th>Precio</th>
								<th>Total</th>
							</tr>
						</thead>
						<tbody>
							<?php 
								$suma =0; 
								foreach($productos as $p){ ?>
							<tr>
								<td><?php echo $p['producto']; ?></td>
								<td><?php echo $p['cantidad']; ?></td>
								<td><?php echo number_format($p['precio'],2,".","," ); ?></td>
								<td><?php echo number_format($p['total'],2,".","," ); $suma += $p['total']; ?></td>
							</tr>
							<?php } ?>
					</tbody>
					<tfoot class="bg-success">					
						<tr>
							<th class="text-center">TOTAL</th>
							<th></th>
							<th></th>
							<th class="text-left"><?php echo number_format($suma,2,".","," ); ?></th>
						</tr>
					</tfoot>
				</table>
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Generar reporte</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="container-fluid">
								<div class="row">
									<div class="col-md-6">
										<form method="get" action="<?php echo base_url('reportes/getReporte'); ?>">
											POR FECHA
											<input type="date" name="desde">
											<br><br><br>
											<button type="summit" class="btn btn-info btn-sm mt-2">Generar</button>
										</form>
									</div>
									<div class="col-md-6 ml-auto">
										<form method="get" action="<?php echo base_url('reportes/getReporte'); ?>">
											RANGO DE FECHA
											<input type="date" name="desde">
											<input type="date" name="hasta">
											<br><br>
											<button type="summit" class="btn btn-info btn-sm">Generar</button>
										</form>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-warning" data-dismiss="modal">Cancelar</button>
						</div>
						</div>
					</div>
				</div>

            	<!-- /CONTENIDO -->
				</div>
            </div>