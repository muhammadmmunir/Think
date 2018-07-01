<div class="row" style="margin-top:60px">
    <fieldset>
        <h2 align="center">
        <?php 
            if($this->recom)    echo 'Rekomendasi Soal';
            else    echo 'Soal';
        ?>
        </h2>          
    </fieldset>
    <div class="table-soal">
        <table class="table table-bordered custab table-hover">
            <thead>
                <?php if(!$this->recom): ?>
                    <button id="btn-tambah" class="btn-margin btn btn-primary btn-md pull-left"><span class="glyphicon glyphicon-plus"></span> TAMBAH</button>
                    <button id="btn-baru" style="display:none;" class="btn-margin btn btn-primary btn-md pull-left" data-toggle="modal" data-target="#myModal"></span><i class="fa fa-plus-square" aria-hidden="true"></i>BARU</button>
                    <a href="<?php echo URL; ?>admin/recomSoal"><button id="btn-pelajar" style="display:none;" class="btn-margin btn btn-primary btn-md pull-left" data-toggle="modal" data-target=""></span>PELAJAR</button></a>
                    <button id="btn-batal" style="display:none;" class="btn-margin btn btn-primary btn-md pull-left" ></span>BATAL</button>
                <?php else: ?>
                    <a href="<?php echo URL; ?>admin/soal"><button id="btn-pelajar" class="btn-margin btn btn-primary btn-md pull-left" data-toggle="modal" data-target=""></span>KEMBALI</button></a>
                    <br/>
                <?php endif; ?>
                <tr class="active">
                    <th>ID</th>
                    <th>Uploader</th>
                    <th>Soal</th>
                    <th>Kategori</th>
                    <th>Tanggal</th>
                    <th class="text-center">Action</th>
                </tr>
            </thead>
            <?php
                $count = 1;
                $soal = $this->soalList;
                foreach ($soal as $key => $value) {
                    if(!$this->recom){
                        $idSoal = $value['idsoal'];
                        $urlUpdate = URL.'admin/editSave/'.$idSoal;
                        $urlDelete = URL.'admin/delete/';
                    }else{
                        $idSoal = $value['idsoaltunggu'];
                        $urlUpdate = URL.'admin/recomEditSave/'.$idSoal;
                        $urlDelete = URL.'admin/recomDelete/';
                        $urlAdd = URL.'admin/recomInsert/';
                    }
                    
                        
                    $edit = $soal[$key];
                    echo "<tr>";
                    echo "<td>".($count++)."</td>";
                    echo "<td>".$value['username']."</td>";
                    echo "<td>".$value['soal']."</td>";
                    echo "<td>".$value['kategori']."</td>";
                    echo "<td>".$value['tanggal']."</td>";
                    if($this->recom){
                        echo '<td align="center"><a href="" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#confirm-add" data-record-id="'.$idSoal.'" data-record-title="'.$urlAdd.'""><span class="glyphicon glyphicon-plus"></span> TAMBAH  </a> ';
                    }else{
                        echo '<td align="center">';
                    }
                    echo '<a href="" class="btn btn-info btn-sm" data-toggle="modal" data-target="#update-data" 
                    data-record-url="'.$urlUpdate.'" data-record-id="'.$idSoal.'" data-record-soal="'.$value['soal'].'"
                    data-record-jawabana="'.$value['jawabana'].'" data-record-jawabanb="'.$value['jawabanb'].'"
                    data-record-jawabanc="'.$value['jawabanc'].'" data-record-jawaband="'.$value['jawaband'].'"
                    data-record-jawaban="'.$value['jawaban'].'" data-record-kategori="'.$value['kategori'].'""><span class="glyphicon glyphicon-edit"></span> DETAIL </a> ';
                    echo '<a href="" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#confirm-delete" data-record-id="'.$idSoal.'" data-record-title="'.$urlDelete.'""><span class="glyphicon glyphicon-remove"></span> HAPUS </a></td>';
                    echo '</tr>';
            }
            ?>
        </table>
    </div>
</div>

<!-- Modal Tambah Soal-->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
        <form role="form" action="create" method="post">
        
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                <h4 class="modal-title" align="center">Tambah Soal</h4>
            </div>
            
            <div class="modal-body">

                <!-- Kategori -->
                <div class="form-group">
                    <label for="exampleSelect1">Kategori Soal</label>
                    <select required class="form-control" id="kategori" name="kategori">
                        <option value="1">Pengetahuan Umum</option>
                        <option value="2">IPA</option>
                        <option value="3">IPS</option>
                        <option value="4">Matematika</option>
                        <option value="5">Bahasa Inggris</option>
                        <option value="6">Bahasa Indonesia</option>
                    </select>
                </div>
                <!-- End Kategori -->

                <!-- Soal -->
                <div class="panel panel-default">
                    <div class="panel-heading">Soal</div>
                    <div class="panel-body">
                        <textarea required class="form-control" name="soal" id="soal" rows="3"></textarea>
                    </div>
                </div>
                <!-- Isian setiap jawaban -->
                <div class="input-group" style="margin-bottom: 10px">
                    <span class="input-group-addon" id="basic-addon1">Jawaban A</span>
                    <input required type="text" name="jawabana" class="form-control" aria-describedby="basic-addon1">
                </div>
                <div class="input-group" style="margin-bottom: 10px">
                    <span class="input-group-addon" id="basic-addon1">Jawaban B</span>
                    <input required type="text" name="jawabanb" class="form-control" aria-describedby="basic-addon1">
                </div>
                <div class="input-group" style="margin-bottom: 10px">
                    <span class="input-group-addon" id="basic-addon1">Jawaban C</span>
                    <input required type="text" name="jawabanc" class="form-control" aria-describedby="basic-addon1">
                </div>
                <div class="input-group" style="margin-bottom: 10px">
                    <span class="input-group-addon" id="basic-addon1">Jawaban D</span>
                    <input required type="text" name="jawaband" class="form-control" aria-describedby="basic-addon1">
                </div>
                <!-- Jawaban Benar -->
                <div class="row">
                    <div class="form-group col-xs-12">
                        <label for="jawaban" class="col-xs-12 control-label" name="jawaban">Jawaban Benar</label>
                        <div class="col-xs-12 input-group">
                            <div id="radioBtn" class="btn-group col-xs-12" role="group">
                                <div class="col-xs-3 btn btn-default notActive" role="group" data-toggle="jawaban" data-value="1">A</div>
                                <div class="col-xs-3 btn btn-default notActive" role="group" data-toggle="jawaban" data-value="2">B</div>
                                <div class="col-xs-3 btn btn-default notActive" role="group" data-toggle="jawaban" data-value="3">C</div>
                                <div class="col-xs-3 btn btn-default notActive" role="group" data-toggle="jawaban" data-value="4">D</div>
                            </div>
                            <input type="hidden" id="jawaban" name="jawaban"  value="" >
                        </div>
                    </div>
                </div>
                <!-- End Jawaban Benar -->
            
            </div>

            <div class="modal-footer">
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <input id="submit-new" type="submit" class="btn btn-lg btn-success btn-block" value="Tambah">
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <input type="button" class="btn btn-lg btn-primary btn-block" value="Batal" data-dismiss="modal">
                </div>
             </div>
        
        </form>
        </div>
         <!-- End Modal content-->
        </div>

    </div>
    <!-- End Tambah Soal -->

    <!-- Modal Update Soal-->
    <div id="update-data" class="modal fade" role="dialog">
        <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
        <form role="form" action="" method="post" id="formupdate">
        
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                <h4 class="modal-title" align="center">
                    <?php 
                        if($this->recom)    echo 'Update Soal Rekomendasi';
                        else    echo 'Update Soal';
                    ?>
                </h4>
            </div>
            
            <div class="modal-body">
                <input type="hidden" name="updateidsoal" id="updateidsoal" value="" />
                <!-- Kategori -->
                <div class="form-group">
                    <label for="exampleSelect1">Kategori Soal</label>
                    <select required class="form-control" id="updatekategori" name="updatekategori">
                        <option id="pu" value="1">Pengetahuan Umum</option>
                        <option id="ipa" value="2">IPA</option>
                        <option id="ips" value="3">IPS</option>
                        <option id="mtk" value="4">Matematika</option>
                        <option id="bing" value="5">Bahasa Inggris</option>
                        <option id="bind" value="6">Bahasa Indonesia</option>
                    </select>
                </div>
                <!-- End Kategori -->

                <!-- Soal -->
                <div class="panel panel-default">
                    <div class="panel-heading">Soal</div>
                    <div class="panel-body">
                        <textarea required class="form-control" name="updatesoal" id="updatesoal" rows="3"></textarea>
                    </div>
                </div>
                <!-- Isian setiap jawaban -->
                <div class="input-group" style="margin-bottom: 10px">
                    <span class="input-group-addon" id="basic-addon1">Jawaban A</span>
                    <input required type="text" id="ujawabana" name="jawabana" class="form-control" aria-describedby="basic-addon1">
                </div>
                <div class="input-group" style="margin-bottom: 10px">
                    <span class="input-group-addon" id="basic-addon1">Jawaban B</span>
                    <input required type="text" id="ujawabanb" name="jawabanb" class="form-control" aria-describedby="basic-addon1">
                </div>
                <div class="input-group" style="margin-bottom: 10px">
                    <span class="input-group-addon" id="basic-addon1">Jawaban C</span>
                    <input required type="text" id="ujawabanc" name="jawabanc" class="form-control" aria-describedby="basic-addon1">
                </div>
                <div class="input-group" style="margin-bottom: 10px">
                    <span class="input-group-addon" id="basic-addon1">Jawaban D</span>
                    <input required type="text" id="ujawaband" name="jawaband" class="form-control" aria-describedby="basic-addon1">
                </div>
                <!-- Jawaban Benar -->
                <div class="row">
                    <div class="form-group col-xs-12">
                        <label for="updatejawaban" class="col-xs-12 control-label">Jawaban Benar</label>
                        <div class="col-xs-12 input-group">
                            <div id="radioBtn" class="btn-group col-xs-12" role="group">
                                <div id="updatejawabana" class="col-xs-3 btn btn-default notActive" role="group" data-toggle="estado" data-value="1">A</div>
                                <div id="updatejawabanb" class="col-xs-3 btn btn-default notActive" role="group" data-toggle="estado" data-value="2">B</div>
                                <div id="updatejawabanc" class="col-xs-3 btn btn-default notActive" role="group" data-toggle="estado" data-value="3">C</div>
                                <div id="updatejawaband" class="col-xs-3 btn btn-default notActive" role="group" data-toggle="estado" data-value="4">D</div>
                            </div>
                            <input type="hidden" id="updatejawaban" name="updatejawaban"  value="">
                        </div>
                    </div>
                </div>
                <!-- End Jawaban Benar -->
            
            </div>

            <div class="modal-footer">
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <input type="submit" class="btn btn-lg btn-success btn-block" value="Update">
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <input type="button" class="btn btn-lg btn-primary btn-block" value="Batal" data-dismiss="modal">
                </div>            
             </div>
        
        </form>
        </div>
         <!-- End Modal content-->
        </div>

    </div>
    <!-- End Update Soal -->

<!-- Modal Hapus Soal-->
    <div id="confirm-delete" class="modal fade" role="dialog">
        <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
        
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                <h3 class="modal-title" id="myModalLabel" >Konfirmasi Hapus Soal</h3>
            </div>
            
            <div class="modal-body" style="min-height: 100px">
               <h4>Anda yakin ingin menghapus soal ini, prosedur ini tidak bisa dikembalikan.
                    Apa Anda ingin tetap menghapusnya?
               </h4>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Tidak</button>
                <a href="#" class="btn btn-danger btn-ok" id="delete-link">Ya</a>
             </div>
        
        </div>
         <!-- End Modal content-->
        </div>

    </div>
<!-- End Modal -->

<!-- Modal Tambah Soal-->
    <div id="confirm-add" class="modal fade" role="dialog">
        <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
        
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                <h3 class="modal-title" id="myModalLabel" >Konfirmasi Penambahan Soal</h3>
            </div>
            
            <div class="modal-body" style="min-height: 100px">
               <h4>Apakah Anda ingin menambahkan soal ini ke database?</h4>
            </div>

            <div class="modal-footer">
                <a href="#" class="btn btn-danger btn-ok" id="add-link">Ya</a>
                <button type="button" class="btn btn-default" data-dismiss="modal">Tidak</button>
             </div>
        
        </div>
         <!-- End Modal content-->
        </div>

    </div>
<!-- End Modal -->

<!-- Modal Sukses Menambahkan -->
    <div id="success-add" class="modal fade" role="dialog">
        <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
        
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                <h3 class="modal-title" id="myModalLabel" >Informasi</h3>
            </div>
            
            <div class="modal-body" style="min-height: 100px">
               <h4>Soal telah sukses ditambahkan</h4>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Tidak</button>
             </div>
        
        </div>
         <!-- End Modal content-->
        </div>

    </div>
<!-- End Sukses Menambahkan -->