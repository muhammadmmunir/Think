<div class="row" style="margin-top:60px">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
            <div class="welcome">
            <h1 id="hello">
                HELLO!
            </h1>
            <fieldset id="user-message">
                <h2 id="hello-user">Selamat datang <?php echo Session::get('username'); ?>.</h2>
            </fieldset id="user-message">
            <hr>
            <div id="choose-category">
            	<h4 id="choose-message">
            		Sebelum mengerjakan soal, silahkan pilih kategori terlebih dahulu!
            	</h4>
            	<div><span class="glyphicon glyphicon-triangle-bottom"></span></div>
            	<a href="<?php echo URL; ?>pelajar/choose" class="btn btn-success btn-lg" 
             	role="button" aria-pressed="true">PILIH KATEGORI</a>
            </div>
        </div> 
    </div>
</div>