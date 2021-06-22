<div class="page-inner">
    <div class="page-header">

        <div class="row">
            <div class="col-md-5">
                <div class="row">
                    <div class="col-md-12 text-left">
                        <ul class="breadcrumbs">
                            <li class="nav-home">
                                <button type="button" class="btn btn-sm btn-primary ml-3" data-toggle="modal" data-target="#exampleModal">Buscar Por Fecha</button>
                                <input type="hidden" id="report" value="<?php echo $fecha ?>">
                                <input type="hidden" id="ruta" value="<?php echo site_url()."/"; ?>">
                            </li>
                        </ul>
                    </div>
                </div>
                <table id="table-historial-folios" class="table table-sm table-hover bg-white">
                    <thead>
                        <tr>
                            <th>#Folio</th>
                            <th>Arts</th>
                            <th>Fecha</th>
                            <!-- <th>Hora</th> -->
                            <th>Total</th>
                        </tr>
                    </thead>
                        <tbody style="font-size: 11px;">
                        <?php foreach($ventas as $p){ ?>
                            <tr onclick="show_detail(<?php echo $p['folio']; ?>)">
                                <td><?php echo $p['folio']; ?></td>
                                <td><?php echo $p['cantidad']; ?></td>
                                <td>
                                    <?php 
                                    $f =  strval($p['fecha']);
                                    $date=date_create($f);
                                    echo date_format($date,"d/m/Y");
                                    ?>
                                </td>
                                <td>$<?php echo $p['total']; ?></td>
                            </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
            <div class="col-md-7 bg-white" id="detailTicket">
                <!-- TABLE DETALLES -->
                
                <!-- /TABLE DETALLES -->
            </div>
        </div>
        <!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Historial de Ventas</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="container-fluid">
								<div class="row">
									<div class="col-md-6">
										<form method="post" action="<?php echo site_url('historial_ventas/por_fecha'); ?>">
											POR FECHA
											<input type="date" name="fecha">
											<br><br><br>
											<button type="submit" class="btn btn-info btn-sm mt-2">Buscar</button>
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

    </div>
</div>