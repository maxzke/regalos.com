
        <div class="page-inner">
            <div class="page-header">
                <h4 class="page-title">Agregar Nuevo Producto</h4>
            </div>
            <div class="row">
				<div class="col-md-12">
				<!-- CONTENIDO -->					
					<?php echo form_open('producto/add',array("class"=>"form-group","enctype"=>"multipart/form-data")); ?>
						<div class="row">
							<div class="col-md-3">
								<!-- Código -->
								<div class="form-group">
									<label for="codigo" class="col-md-12 control-label" data-toggle="tooltip" data-placement="right" title="Código de producto">Código</label>
									<div class="col-md-12">
										<input type="text" name="codigo" value="<?php echo $this->input->post('codigo'); ?>" class="form-control" id="codigo" autocomplete="off"/>
										<span class="text-danger"><?php echo form_error('codigo');?></span>
									</div>
								</div>
							</div>
							<div class="col-md-9">
								<!-- NOMBRE -->
								<div class="form-group">
									<label for="nombre" class="col-md-12 control-label"><span class="text-danger">*</span>Nombre del Producto</label>
									<div class="col-md-12">
										<input type="text"  name="nombre" value="<?php echo $this->input->post('nombre'); ?>" class="form-control" id="nombre" autocomplete="off"/>
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
										<input type="text" name="precio" min="1" value="<?php echo $this->input->post('precio'); ?>" class="form-control" id="precio" autocomplete="off" placeholder="$"/>
										<span class="text-danger"><?php echo form_error('precio');?></span>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<!-- STOCK -->
								<div class="form-group">
									<label for="stock" class="col-md-2 control-label" data-toggle="tooltip" data-placement="right" title="Cantidad Existente">Existencias</label>
									<div class="col-md-12">
										<input type="number" min="1" name="stock" value="<?php echo $this->input->post('stock'); ?>" class="form-control" id="stock" placeholder="cantidad" autocomplete="off" />
										<span class="text-danger"><?php echo form_error('stock');?></span>
									</div>
								</div>
							</div>							
						</div>
						<!-- BTN-GUARDAR -->
						<div class="row">
							<div class="col-md-8">
								<button type="submit" class="btn btn-success">Guardar</button>
								<a href="<?php echo site_url('producto'); ?>" class="btn btn-warning">
									<i class="flaticon-home"></i> Volver
								</a>
							</div>
						</div>
							







					<div class="row">
						<!-- COLUMNA-1 -->
						<div class="col-md-8">
							
							<!-- INVENTARIABLE -->
							<div class="form-group" style="display:none">
									<div class="form-check">
										<label class="form-check-label" data-toggle="tooltip" data-placement="right" title="si se activa se llevara el conteo y descuento de almacen"/>
											<input class="form-check-input" type="checkbox" name="inventariable" value="1" id="inventariable"/>
											<span class="form-check-sign">inventariable</span>
										</label>
									</div>
								</div>
																				
							<!-- CATEGORIA -->
							<div class="form-group"  style="display:none">
								<label for="id_categoria" class="col-md-4 control-label"><span class="text-danger">*</span>Categoria</label>
								<div class="col-md-8">
									<select name="id_categoria" class="form-control" disabled>
										<option value="">select categoria</option>
										<?php 
										foreach($all_categorias as $categoria)
										{
											$selected = ($categoria['id'] == $this->input->post('id_categoria')) ? ' selected="selected"' : "";

											echo '<option value="'.$categoria['id'].'" '.$selected.'>'.$categoria['nombre'].'</option>';
										} 
										?>
									</select>
									<span class="text-danger"><?php echo form_error('id_categoria');?></span>
								</div>
							</div>
							
						<!--</div>
						 COLUMNA-2 
						<div class="col-md-4">-->
							
							<!-- STOCK MINIMO -->
							<div class="form-group" style="display:none">
								<label for="stock_minimo" class="col-md-4 control-label">Alerta Minimo</label>
								<div class="col-md-2">
									<input type="text" name="stock_minimo" value="<?php echo $this->input->post('stock_minimo'); ?>" class="form-control" id="stock_minimo" placeholder="cantidad"/>
								</div>
							</div>
							
							<!-- COSTO -->
							<div class="form-group" style="display:none">
								<label for="costo" class="col-md-4 control-label">Costo</label>
								<div class="col-md-8">
									<input type="text" name="costo" value="<?php echo $this->input->post('costo'); ?>" class="form-control" id="costo" />
									<span class="text-danger"><?php echo form_error('costo');?></span>
								</div>
							</div>
						</div>
						<!-- COLUMNA-3 -->
						<div class="col-md-4">
							<!-- IMAGEN -->
							<!-- <div class="form-group">
								<label for="imagen" class="col-md-4 control-label">Imagen</label>
								<div class="col-md-8">
									<input type="file" name="imagen" id="foto" class="nuevaFoto" required="true">
										<img src="<?php //echo base_url()?>assets/img/productos/no-image.png" class="img-thumbnail previsualizar" width="150px" >
										<span class="text-danger"><?php //echo $img_error;?></span>
								</div>
							</div>							 -->
							
						</div><!-- end columna-3 -->
						</div>
					<?php echo form_close(); ?>
            	<!-- /CONTENIDO -->
				</div>
            </div>
        </div>