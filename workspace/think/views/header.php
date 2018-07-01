<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>THINK</title>
    <link rel="stylesheet" href="<?php echo URL; ?>public/css/bootstrap-theme.css" />
    <link rel="stylesheet" href="<?php echo URL; ?>public/css/bootstrap.min.css" />
    <link rel="stylesheet" href="<?php echo URL; ?>public/css/full-slider.css" />
    <link rel="stylesheet" href="<?php echo URL; ?>public/css/guest.css" />
    <link rel="stylesheet" href="<?php echo URL; ?>public/css/soal.css" />
    <link rel="stylesheet" href="<?php echo URL; ?>public/css/quiz.pop.css" />
    <link rel="stylesheet" href="<?php echo URL; ?>public/css/jquery.gritter.css" />
    <link rel="stylesheet" href="<?php echo URL; ?>public/css/font.css" />
    <link rel="stylesheet" href="<?php echo URL; ?>public/css/kategori.css" />
    <link rel="stylesheet" href="<?php echo URL; ?>public/css/animate.css" />
    <link href="<?php echo URL; ?>public/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <script src="<?php echo URL; ?>public/js/jquery.min.js"></script>    
    <script src="<?php echo URL; ?>public/js/bootstrap.min.js"></script>
    <script>
        $(function(){
            $('.carousel').carousel({
                interval: 2000 //changes the speed
            })
        });
    </script>
    <?php
        if(isset($this->js)){
            foreach ($this->js as $js){
                echo '<script type="text/javascript" src="'.URL.'views/'.$js.'"></script>';
            }
        }
    ?>
</head>
<body>

<?php Session::init(); ?>

<div class="navbar-wrapper">
    <div class="container-fluid">
        <nav class="navbar navbar-fixed-top">
            <div class="container">
                <div class="navbar-header" id="kiri">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="<?php echo URL; ?>">
                    <img class="home-logo" height="40" width="180" src="<?php echo URL; ?>public/images/logo.png"></a>
                </div>
                <div id="navbar" class="navbar-collapse collapse" id="kiri">
                    <ul class="nav navbar-nav">
                        
                         <?php if(Session::get('peran')): ?>
                            <?php if(Session::get('peran') !== 'admin'): ?>
                                <li><a href="<?php echo URL; ?>pelajar"><span class="glyphicon glyphicon-dashboard">
                                </span> Dashboard</a></li>
                                <li><a href="#1" data-toggle="modal" data-target="#upload">
                                <span class="glyphicon glyphicon-upload"></span> Rekomendasi Soal</a></li>
                                <li><a href="<?php echo URL; ?>pelajar/leaders" >
                                <span class="glyphicon glyphicon-stats"></span> Peringkat</a></li>
                            <?php else: ?>
                                <li><a href="<?php echo URL; ?>admin"><span class="glyphicon glyphicon-dashboard">
                                </span> Dashboard</a></li>
                                <li><a href="<?php echo URL; ?>admin/soal" >
                                <span class="glyphicon glyphicon-list"></span> Soal</a></li>
                            <?php endif; ?>
                        <?php endif; ?>
                    </ul>
                    <ul class="nav navbar-nav pull-right ">
                        <?php if(Session::get('peran')): ?>
                            <?php if(Session::get('peran') == 'admin'): ?>
                                <li class=" dropdown"><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" 
                                aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user"></span> <?php echo " ".Session::get('username'); ?> <span class="caret"></span></a>
                            <?php else: ?>    
                                <li class=" dropdown"><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" 
                                aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user"></span> <?php echo " ".Session::get('username'); ?> <span class="caret"></span></a>
                            <?php endif; ?>
                                    <ul class="dropdown-menu">
                                    <?php if(Session::get('peran') == 'admin'): ?>
                                        <li><a href=""><span class="glyphicon glyphicon-console"></span> Login as Admin</a></li>
                                        <li class="login-logout" class=""><a href="<?php echo URL; ?>admin/logout"><span class="glyphicon glyphicon-log-out"> </span> Logout</a></li>
                                    <?php else: ?> 
                                        <li><a href=""><span class="glyphicon glyphicon-console"></span> Login as Pelajar</a></li>
                                        <li class="login-logout" class=""><a href="<?php echo URL; ?>pelajar/logout"><span class="glyphicon glyphicon-log-out"> </span> Logout</a></li>
                                    <?php endif; ?>
                                    </ul>
                                </li>
                            <?php endif; ?>

                        <?php if(!Session::get('loggedIn')): ?>
                            <li class="login-logout" ><a href="<?php echo URL; ?>guest/login"><span class="glyphicon glyphicon-log-in"> </span> Login</a></li>
                        <?php endif; ?>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>

<!-- Modal Rekomendasi Soal-->
<div id="upload" class="modal fade" role="dialog">
    <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
    <form role="form" action="<?php echo URL; ?>pelajar/upload" method="post">
        
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
            <h4 class="modal-title" align="center">Rekomendasi Soal</h4>
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
                <input required type="text" name="jawabana" id="jawabana" class="form-control" aria-describedby="basic-addon1">
            </div>
            <div class="input-group" style="margin-bottom: 10px">
                <span class="input-group-addon" id="basic-addon1">Jawaban B</span>
                <input required type="text" name="jawabanb" id="jawabanb" class="form-control" aria-describedby="basic-addon1">
            </div>
            <div class="input-group" style="margin-bottom: 10px">
                <span class="input-group-addon" id="basic-addon1">Jawaban C</span>
                <input required type="text" name="jawabanc" id="jawabanc" class="form-control" aria-describedby="basic-addon1">
            </div>
            <div class="input-group" style="margin-bottom: 10px">
                <span class="input-group-addon" id="basic-addon1">Jawaban D</span>
                <input required type="text" name="jawaband" id="jawaband" class="form-control" aria-describedby="basic-addon1">
            </div>
            <!-- Jawaban Benar -->
            <div class="row">
                <div class="form-group col-xs-12">
                    <label for="rekomjawaban" class="col-xs-12 control-label">Jawaban Benar</label>
                    <div class="col-xs-12 input-group">
                        <div id="radioBtn" class="btn-group col-xs-12" role="group">
                            <div class="col-xs-3 btn btn-default notActive" role="group" data-toggle="estado" data-value="1">A</div>
                            <div class="col-xs-3 btn btn-default notActive" role="group" data-toggle="estado" data-value="2">B</div>
                            <div class="col-xs-3 btn btn-default notActive" role="group" data-toggle="estado" data-value="3">C</div>
                            <div class="col-xs-3 btn btn-default notActive" role="group" data-toggle="estado" data-value="4">D</div>
                        </div>
                        <input type="hidden" name="rekomjawaban" id="rekomjawaban" value="">
                    </div>
                </div>
            </div>
            <!-- End Jawaban Benar -->
        </div>

        <div class="modal-footer">
            <div class="col-xs-6 col-sm-6 col-md-6">
                <input id="submit-recom" type="submit" class="btn btn-lg btn-success btn-block" value="Tambah">
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
<!-- End Modal Rekomendasi Soal-->