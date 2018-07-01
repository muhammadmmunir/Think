<div class="row" style="margin-top:60px">
<div align="center">
	<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">

  		<div class="panel panel-default">
            <div class="panel-heading" id="prepare-message">
                <h3 >Skor Akhir <?php echo Session::get('username'); ?></h3>
            </div>
            <ul class="list-group quiz-rule" >
                <li class="list-group-item"><span class="glyphicon glyphicon-plus">
                </span> Pertanyaan yang sudah terjawab : <?php echo $this->terjawab; ?></li>
                <li class="list-group-item"><span class="glyphicon glyphicon-plus">
                </span> Total Jawaban benar : <?php echo $this->benar; ?></li>
                <li class="list-group-item"><span class="glyphicon glyphicon-plus">
                </span> Total Jawaban salah : <?php echo $this->salah; ?></li>
                <li class="list-group-item"><span class="glyphicon glyphicon-plus">
                </span> Skormu adalah : <?php echo $this->skor; ?></li>
            </ul>
            <div class="panel-heading" id="prepare-message">
                <h4>Selamat, skor dan peringkat Anda sudah naik!</h4>    
            </div>
        </div>

	</div>
</div>
</div>