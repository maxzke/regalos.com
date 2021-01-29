<!DOCTYPE html>
<html>
<head>
	<title>Regalos.com</title>
	<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
   <!--Made with love by Mutiullah Samim -->
   
	<!--Bootsrap 4 CDN-->	
	<link type="text/css" rel="stylesheet" href="<?php echo base_url()?>assets/css/bootstrap_login.min.css"/>
    
    <!--Fontawesome CDN-->
	<link type="text/css" rel="stylesheet" href="<?php echo base_url()?>assets/css/fontAwesome/css/all.min.css"/>

    <style>
        @import url('<?php echo base_url('assets/css/fontcss.css?family=Numans')?>');

html,body{
background-image: url('<?php echo base_url('assets/img/login-background.jpg')?>');
background-size: cover;
background-repeat: no-repeat;
width: 100%;
font-family: 'Numans', sans-serif;
}

.container{
height: 100%;
align-content: center;
}

.card{
height: 390px;
margin-top: 90px;
margin-bottom: auto;
width: 450px;
background-color: rgba(255,212,255,0) !important;
}

.social_icon span{
font-size: 60px;
margin-left: 10px;
color: #D2A6E0;
}

.social_icon span:hover{
color: white;
cursor: pointer;
}

.card-header{
background-color: rgba(255,212,255,0) !important;
}

.social_icon{
position: absolute;
right: 20px;
top: -45px;
}

.input-group-prepend span{
width: 50px;
background-color: #D2A6E0;
color: black;
border:0 !important;
}

input:focus{
outline: 0 0 0 0  !important;
box-shadow: 0 0 0 0 !important;

}

.remember{
color: white;
}

.remember input
{
width: 20px;
height: 20px;
margin-left: 15px;
margin-right: 5px;
}

.login_btn{
color: black;
background-color: #D2A6E0;
width: 100px;
}

.login_btn:hover{
color: black;
background-color: #FFC412;
}

.links{
color: white;
}

.links a{
margin-left: 4px;
}
	</style>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
    <?php
		// Add any javascripts
		if( isset( $javascripts ) )
		{
			foreach( $javascripts as $js )
			{
				echo '<script src="' . $js . '"></script>' . "\n";
			}
		}

		if( isset( $final_head ) )
		{
			echo $final_head;
		}
	?>
</head>
<body>
<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card border-0">
			<div class="card-header border-0">
			<h1 class="text-danger text-center mb-1"><strong>REGALOS.COM</strong></h1>
			</div>
			<div class="card-body">
				<?php
				if( ! isset( $on_hold_message ) ){
					
					echo form_open( $login_url, ['class' => 'std-form'] );?>

						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" class="form-control text-uppercase" placeholder="Usuario" name="login_string" id="login_string" 
							autocomplete="off" required/>
							
						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" name="login_pass" id="login_pass" class="form-control" placeholder="Contraseña" <?php
							if( config_item('max_chars_for_password') > 0 )
								echo 'maxlength="' . config_item('max_chars_for_password') . '"'; 
						?> autocomplete="off" readonly="readonly" onfocus="this.removeAttribute('readonly');" />

							
						</div>
						<div class="row align-items-center remember">
							<!-- <input type="checkbox">Remember Me -->
						</div>
						<div class="form-group text-center ">
							<input type="submit" value="ENTRAR" class="btn mt-5 login_btn">
						</div>
					</form>
				<?php
				if( isset( $login_error_mesg ) ){
						echo '
							<div class="text-danger text-center mt-4">
								<h5>
									Error #' . $this->authentication->login_errors_count . '/' . config_item('max_allowed_attempts') . '
								</h5>
							</div>
						';
					}

				if( $this->input->get(AUTH_LOGOUT_PARAM) ){
						echo '
							<br>
							<div class="text-danger text-center mt-4">
								<h5>
									Sesión Finalizada.
								</h5>
							</div>
						';
					}

				}else
					{
						// EXCESSIVE LOGIN ATTEMPTS ERROR MESSAGE
						echo '
							<div class="text-white text-center mt-4">
								<h5>
									Problemas para iniciar sesión 
									<br><br>
									Contacta al Administrador
								</h5>
							</div>
						';
					}
					?>
			</div>
			<!--<div class="card-footer">
				 <div class="d-flex justify-content-center links">
					Don't have an account?<a href="#">Sign Up</a>
				</div>
				<div class="d-flex justify-content-center">
					<a href="#">Forgot your password?</a>
				</div> 
			</div>-->
		</div>
	</div>
</div>
<script src="<?php echo base_url()?>assets/js/jquery.min.js"></script>
<script src="<?php echo base_url()?>assets/js/bootstrap_login.min.js"></script>

</body>
</html>
