<div class="container">

<div class="row" style="margin-top:60px">
    <div class="col-xs-8 col-sm-8 col-md-6 col-xs-offset-2 col-sm-offset-2 col-md-offset-3">
        <form role="form" action="runRegister" method="post" id="form-register">
            <fieldset>
                <h2>Silahkan Registrasi!</h2>
                <hr class="colorgraph">
                <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                        <input required type="text" name="namadepan" id="namadepan" onkeyup="validateName(this)" class="form-control input-lg" placeholder="Nama Depan" tabindex="1">
                    </div>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                        <input required type="text" name="namabelakang" id="namabelakang" class="form-control input-lg" onkeyup="validateName(this)" placeholder="Nama Belakang" tabindex="2">
                    </div>
                </div>
                </div>
                <div class="form-group">
                    <select required name="idjeniskelamin" id="idjeniskelamin" class="form-control input-lg" tagindex="2">
                        <option value="1">Laki-laki</option>
                        <option value="2">Perempuan</option>
                    </select>
                </div>
                <div class="form-group">
                    <input required type="text" name="username" id="username" class="form-control input-lg" placeholder="Username">
                </div>
                <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="form-group">
                        <input required type="password" name="password" id="pass1" class="form-control input-lg" placeholder="Password" tabindex="5" minlength="4" maxlength="16">
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="form-group">
                        <input required type="password" name="password_confirmation" id="pass2" class="form-control input-lg" placeholder="Confirm Password" tabindex="6" minlength="4" maxlength="16" onkeyup="checkPass(); return false;">
                    </div>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <h4 id="confirm-password" ></h4>
                </div>
                </div>
                <hr class="colorgraph">
                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <input type="submit" class="btn btn-lg btn-success btn-block" value="Registrasi">
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <a href="<?php echo URL; ?>guest/login" class="btn btn-lg btn-primary btn-block">Login</a>
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
</div>

</div> 