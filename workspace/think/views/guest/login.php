<div class="container">
    <div class="row" style="margin-top:60px">
        <div class="col-xs-8 col-sm-8 col-md-6 col-xs-offset-2 col-sm-offset-2 col-md-offset-3">
            <form role="form" action="runLogin" method="post" id="login-form">
                <fieldset>
                    <h2>Silahkan Login!</h2>
                    <hr class="colorgraph">
                    <div class="form-group">
                        <input required type="text" name="username" id="username" class="form-control input-lg" placeholder="Username">
                    </div>
                    <div class="form-group">
                        <input required type="password" name="password" id="password" class="form-control input-lg" placeholder="Password">
                    </div>
                    <hr class="colorgraph">
                    <div class="row">
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <input type="submit" class="btn btn-lg btn-success btn-block" value="Login">
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <a href="<?php echo URL; ?>guest/register" class="btn btn-lg btn-primary btn-block">Registrasi</a>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
</div> 
