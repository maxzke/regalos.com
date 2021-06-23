        
            <div class="row">
				<div class="col-md-12 text-center">
					<ul class="breadcrumbs">
						<li class="nav-home">
							<button type="button" class="btn btn-sm btn-primary ml-3" data-toggle="modal" data-target="#exampleModal">
							<i class="fas fa-search"></i> Corte Por Fecha
							</button>
							<input type="hidden" id="report" value="<?php echo $fecha ?>">
						</li>
					</ul>
				</div>
				<div class="col-md-12">
					<?php
						foreach ($info as $item) { 
							$count = sizeof($item['productos']);
							if ($count > 0): ?>
							<div class="bg-white">
								<div class="alert alert-warning bg-dark my-3 text-uppercase text-white text-center" role="alert">
									<?php echo $item['nombre']."&nbsp;&nbsp;".$fecha; ?>
								</div>
								<table class="table table-sm table-hover table-bordered bg-white content-table-reporte">
										<thead>
											<tr>
												<th>PRODUCTO</th>
												<th>Cantidad</th>
												<th>Precio</th>
												<th>Total</th>
											</tr>
										</thead>
										<tbody class="bg-white">								
											<?php 
												$suma =0; 
												foreach($item['productos'] as $p){ ?>
													<tr>
														<td><?php echo $p['producto']; ?></td>
														<td><?php echo $p['cantidad']; ?></td>
														<td><?php echo number_format($p['precio'],2,".","," ); ?></td>
														<td class="text-right"><?php echo number_format($p['total'],2,".","," ); $suma += $p['total']; ?></td>
													</tr>
											<?php } ?>
										</tbody>
										<tfoot>
											<tr>
												<th></th>
												<th></th>
												<th class="text-right bg-dark text-white text-capitalize"><?php echo $item['nombre'] ?> Total</th>							
												<th class="text-right bg-dark text-white">$ <?php echo number_format($suma,2,".","," ); ?></th>
											</tr>
										</tfoot>
									</table>
							</div>
							<br>
							<?php 
							endif; 
						}  
						?>
				<!-- CONTENIDO -->
				<br>
					<div class="bg-white">
						
					<div class="alert alert-success my-3 bg-success text-center" role="alert">
						<strong>TOTAL</strong>
					</div>
						<table class="table table-sm table-hover table-bordered bg-white content-table-reporte">
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
									<td class="text-right"><?php echo number_format($p['total'],2,".","," ); $suma += $p['total']; ?></td>
								</tr>
								<?php } ?>
							</tbody>
							<tfoot>
								<tr>
									<th></th>
									<th></th>
									<th class="text-right bg-success">SubTotal</th>							
									<th class="text-right bg-success">$ <?php echo number_format($suma,2,".","," ); ?></th>
								</tr>
								<tr>
									<th></th>
									<th></th>
									<th class="text-right bg-success">Caja Inicial</th>							
									<th class="text-right bg-success">$ <?php echo number_format($caja[0]['importe'],2,".","," ); ?></th>
								</tr>
								<tr>
									<th></th>
									<th></th>
									<th class="text-right bg-success">Total en Caja</th>							
									<th class="text-right bg-success">$ <?php echo number_format($suma + $caja[0]['importe'],2,".","," ); ?></th>
								</tr>
							</tfoot>
						</table>
					</div>
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
										<form method="get" action="<?php echo site_url('reportes/getReporte'); ?>">
											POR FECHA
											<input type="date" name="desde">
											<br><br><br>
											<button type="summit" class="btn btn-info btn-sm mt-2">Generar</button>
										</form>
									</div>
									<div class="col-md-6 ml-auto">
										<form method="get" action="<?php echo site_url('reportes/getReporte'); ?>">
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