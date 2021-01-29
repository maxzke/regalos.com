
        <div class="page-inner">
            <div class="page-header">
                <h4 class="page-title">Editar Producto</h4>
                <ul class="breadcrumbs">
                    <li class="nav-home">
                        <a href="<?php echo base_url('producto'); ?>">
                            <i class="flaticon-home"></i> Volver
                        </a>
                    </li>
                </ul>
            </div>
            <div class="row">
				<div class="col-md-12">
				<!-- CONTENIDO -->
					
					<?php echo form_open('producto/edit/'.$producto['id'],array("class"=>"form-horizontal")); ?>

						<div class="row">
								<div class="col-md-3">
									<!-- Código -->
									<div class="form-group">
										<label for="codigo" class="col-md-12 control-label" data-toggle="tooltip" data-placement="right" title="Código de producto">Código</label>
										<div class="col-md-12">
											<input type="text" name="codigo" value="<?php echo ($this->input->post('codigo') ? $this->input->post('codigo') : $producto['codigo']); ?>" class="form-control" id="codigo" autocomplete="off"/>
											<span class="text-danger"><?php echo form_error('codigo');?></span>
										</div>
									</div>
								</div>
								<div class="col-md-9">
									<!-- NOMBRE -->
									<div class="form-group">
										<label for="nombre" class="col-md-12 control-label"><span class="text-danger">*</span>Nombre del Producto</label>
										<div class="col-md-12">
											<input type="text"  name="nombre" value="<?php echo ($this->input->post('nombre') ? $this->input->post('nombre') : $producto['nombre']); ?>" class="form-control" id="nombre" autocomplete="off"/>
											<span class="text-danger"><?php echo form_error('nombre');?></span>
										</div>
									</div>	
								</div>
							</div>
							<div class="row">
								<!-- <div class="col-md-3">
									<div class="form-group">
										<label for="costo" class="col-md-12 control-label">Precio de Compra</label>
										<div class="col-md-12">
											<input type="text" name="costo" value="<?php //echo $this->input->post('costo'); ?>" class="form-control" id="costo" placeholder="$" autocomplete="off"/>
											<span class="text-danger"><?php //echo form_error('costo');?></span>
										</div>
									</div>
								</div> -->
								<div class="col-md-3">
									<!-- PRECIO -->
									<div class="form-group">
										<label for="precio" class="col-md-4 control-label"><span class="text-danger">*</span>Precio de Venta</label>
										<div class="col-md-12">
											<input type="text" name="precio" min="1" value="<?php echo ($this->input->post('precio') ? $this->input->post('precio') : $producto['precio']); ?>" class="form-control" id="precio" autocomplete="off" placeholder="$"/>
											<span class="text-danger"><?php echo form_error('precio');?></span>
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<!-- STOCK -->
									<div class="form-group">
										<label for="stock" class="col-md-2 control-label" data-toggle="tooltip" data-placement="right" title="Cantidad Existente">Existencias</label>
										<div class="col-md-12">
											<input type="number" min="1" name="stock" value="<?php echo ($this->input->post('stock') ? $this->input->post('stock') : $producto['stock']); ?>" class="form-control" id="stock" placeholder="cantidad" autocomplete="off" />
											<span class="text-danger"><?php echo form_error('stock');?></span>
										</div>
									</div>
								</div>							
							</div>
							<!-- BTN-GUARDAR -->
							<div class="row">
								<div class="col-md-8">
									<button type="submit" class="btn btn-success">Guardar</button>
									<a href="<?php echo base_url('producto'); ?>" class="btn btn-warning">
										<i class="flaticon-home"></i> Volver
									</a>
								</div>
							</div>

					<?php echo form_close(); ?>
            	<!-- /CONTENIDO -->
				</div>
            </div>
        </div>