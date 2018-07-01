<div class="row" style="margin-top:60px">
	<h2 align="center">Selamat Mengerjakan!</h2> 
	<br/>
    <div class="modal-dialog">
      <div class="modal-content">
      <form method="post" action="<?php echo URL; ?>pelajar/run">
         <div class="modal-header">
            <h3><span class="label label-warning" id="qid"> <?php echo $this->nomor; ?> </span><?php echo Session::get('soal',$this->index,'soal'); ?></h3>
        </div>

        <div class="modal-body">
          <div class="quiz" id="quiz" data-toggle="buttons">
           <label class="element-animation1 btn btn-lg btn-primary btn-block"><span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span> <input type="radio" name="jawaban" value="a"><?php echo Session::get('soal',$this->index,'jawabana'); ?></label>
           <label class="element-animation2 btn btn-lg btn-primary btn-block"><span class="btn-label"><i class="glyphicon glyphicon-chevron-right"> </i></span> <input type="radio" name="jawaban" value="b"><?php echo Session::get('soal',$this->index,'jawabanb'); ?></label>
           <label class="element-animation3 btn btn-lg btn-primary btn-block"><span class="btn-label"><i class="glyphicon glyphicon-chevron-right"> </i></span> <input type="radio" name="jawaban" value="c"><?php echo Session::get('soal',$this->index,'jawabanc'); ?></label>
           <label class="element-animation4 btn btn-lg btn-primary btn-block"><span class="btn-label"><i class="glyphicon glyphicon-chevron-right"> </i> </span> <input type="radio" name="jawaban" value="d"><?php echo Session::get('soal',$this->index,'jawaband'); ?></label>
          </div>
          <div id="submit-soal" style="margin-top: 20px">
            <input type="submit" name="submit" class="btn btn-lg btn-success btn-block" value="<?php echo $this->tombolsubmit; ?>" />
          </div>
        </div>    
  </form>
</div>
</div>

</div>