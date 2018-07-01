<div class="row col-xs-10 col-sm-8 col-md-8 col-xs-offset-1 col-sm-offset-2 col-md-offset-2" >

    <div id="rank-title" style="margin-top: 50px">
        <h3 id="ranking-title" align="center">RANKING DAN SCORE</h3>
    </div>

    <div class="container lb promos">  
 <div class="posisi">
    <div class="promo">
      <div class="deal">
        <span>Peringkat 2</span>
        <span><?php echo $this->leaders[1]['username']; ?></span>
      </div>
      <span class="price"><?php echo $this->leaders[1]['skor']; ?></span>
        <ul class="features">
        </ul>
    </div>

  <div class="promo scale">
    <div class="deal">
      <span>Peringkat 1</span>
      <span><?php echo $this->leaders[0]['username']; ?></span>
    </div>
    <span class="price"><?php echo $this->leaders[0]['skor']; ?></span>
    <ul class="features">
    </ul>
  </div>

  <div class="promo">
    <div class="deal">
      <span>Peringkat 3</span>
      <span><?php echo $this->leaders[2]['username']; ?></span>
    </div>
    <span class="price"><?php echo $this->leaders[2]['skor']; ?></span>
    <ul class="features">
    </ul>
  </div>
  </div>
</div>
    <div class="table-soal" style="margin-top:80px">
        <table class="table table table-bordered custab table-hover">
            <thead>
                <tr class="active">
                    <th>Ranking</th>
                    <th>Username</th>
                    <th>Terjawab</th>
                    <th>Benar</th>
                    <th>Skor</th>
                </tr>
            </thead>
            <?php
                $count = 0;
                $found = false;
                foreach ($this->leaders as $key => $value) {
                    if ($count < 10) {
                        if($value['username']==Session::get('username')){
                            echo '<tr style="background-color: #09BA32; color: white">';
                            $found = true;
                        }else{
                            echo '<tr>';
                        }
                        echo "<td>".(++$count)."</td>";
                        echo "<td>".$value['username']."</td>";
                        echo "<td>".$value['terjawab']."</td>";
                        echo "<td>".$value['benar']."</td>";
                        echo "<td>".$value['skor']."</td>";
                        echo "</tr>";
                    }else{
                        if($found){
                            break;
                        }
                        $count++;{
                            if($value['username']==Session::get('username')){
                                echo '<tr style="background-color: #09BA32; color: white">';
                                echo "<td>".$count."</td>";
                                echo "<td>".$value['username']."</td>";
                                echo "<td>".$value['terjawab']."</td>";
                                echo "<td>".$value['benar']."</td>";
                                echo "<td>".$value['skor']."</td>";
                                echo "</tr>";      
                                break;
                            }
                        }
                    }
                }
            ?>
    	</table>
    </div>
</div>
<link rel="stylesheet" href="<?php echo URL; ?>public/css/lead.css" />