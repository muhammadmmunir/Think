<div class="row" style="margin-top:60px">
    <div  align="center">
    <fieldset id="prepare-message" 
    class="col-xs-10 col-sm-8 col-md-6 col-md-offset-3 col-sm-offset-2 col-xs-offset-1">

        <div class="panel panel-default">
            <div class="panel-heading" id="prepare-message">
                <h3 >Kategori <?php echo $this->selection; ?></h3>
            </div>
            <ul class="list-group quiz-rule" >
                <li class="list-group-item"><span class="glyphicon glyphicon-plus">
                </span> Sebelum submit harus memilih jawaban terlebih dahulu.</li>
                <li class="list-group-item"><span class="glyphicon glyphicon-plus">
                </span> Tidak bisa kembali ke soal sebelumnya.</li>
                <li class="list-group-item"><span class="glyphicon glyphicon-plus">
                </span> Harus mengisi jawaban setiap soal.</li>
                <li class="list-group-item"><span class="glyphicon glyphicon-plus">
                </span> Tidak ada batasan waktu.</li>
                <li class="list-group-item"><span class="glyphicon glyphicon-plus">
                </span> Soal berjumlah 10 nomor.</li>
            </ul>
            <div class="panel-heading" id="prepare-message">
                <h4>Apakah kamu ingin mengerjakan soal kategori ini, jika ya silahkan klik MULAI!</h4>    
            </div>
        </div>
        <span class="glyphicon glyphicon-triangle-bottom"></span>

        <div>
            <div class="col-xs-6 col-sm-4 col-md-offset-4 col-sm-offset-4 col-xs-offset-3">
            <form method="post" action="../run/<?php echo $this->idKategori; ?>">
                <button class="btn btn-lg btn-success btn-block" >MULAI</button>
                <input type="hidden" value="<?php echo $this->idKategori; ?>" name="kategori" />
                <input type="hidden" value="0" name="idsoal" />
                <input type="hidden" value="0" name="q_answer" />
            </form>
            </div>    
        </div>
    </fieldset>
    </div>
</div>