$(function(){
    $('#radioBtn div').on('click', function(){
        var sel = $(this).data('value');
        var tog = $(this).data('toggle');
        $('#'+tog).val(sel);
        // You can change these lines to change classes (Ex. btn-default to btn-danger)
        $('div[data-toggle="'+tog+'"]').not('[data-value="'+sel+'"]').removeClass('active btn-primary').addClass('notActive btn-default');
        $('div[data-toggle="'+tog+'"][data-value="'+sel+'"]').removeClass('notActive btn-default').addClass('active btn-primary');
        $('#updatejawaban').attr('value',sel);
        $('#jawaban').attr('value',sel);        
    });

    $('#confirm-delete').on('show.bs.modal', function(e) {
        var data = $(e.relatedTarget).data();
        $('#confirm-delete').on('click', '.btn-ok', function(e) {
            $('#delete-link').attr('href',data.recordTitle+data.recordId);
        });
    });

    $('#confirm-add').on('show.bs.modal', function(e) {
        var data = $(e.relatedTarget).data();
        $('#confirm-add').on('click', '.btn-ok', function(e) {
            $('#add-link').attr('href',data.recordTitle+data.recordId);
        });
    });

    $('#btn-batal').click(function() {
        $('#btn-baru,#btn-pelajar,#btn-batal').hide();
        $('#btn-tambah').show();
    });    

    $('#btn-tambah').click(function() {
        $(this).hide();
        $('#btn-baru,#btn-pelajar,#btn-batal').show();
    });    
});

$(function(){
        $('#update-data').on('show.bs.modal', function(e) {
        var data = $(e.relatedTarget).data();

        $('#updateidsoal').attr('value', data.recordId);

        if(data.recordKategori=='pengetahuanumum'){
            $('#updatekategori').val('1');
        }else if(data.recordKategori=='ipa'){
            $('#updatekategori').val('2');
        }else if(data.recordKategori=='ips'){
            $('#updatekategori').val('3');
        }else if(data.recordKategori=='matematika'){
            $('#updatekategori').val('4');
        }else if(data.recordKategori=='bahasainggris'){
            $('#updatekategori').val('5');
        }else if(data.recordKategori=='bahasaindonesia'){
            $('#updatekategori').val('6');
        }
        $('#updatesoal').val(data.recordSoal);

        $('#ujawabana').val(data.recordJawabana);
        $('#ujawabanb').val(data.recordJawabanb);
        $('#ujawabanc').val(data.recordJawabanc);
        $('#ujawaband').val(data.recordJawaband);
        $('#formupdate').attr('action',data.recordUrl);
        if(data.recordJawaban=='a'){
            $('#updatejawabana').attr('class', 'col-xs-3 btn btn-default btn-primary');
            $('#updatejawabanb').attr('class', 'col-xs-3 btn btn-default btn-default');
            $('#updatejawabanc').attr('class', 'col-xs-3 btn btn-default btn-default');
            $('#updatejawaband').attr('class', 'col-xs-3 btn btn-default btn-default');    
            $('#updatejawaban').attr('value','1');
        }else if(data.recordJawaban=='b'){
            $('#updatejawabana').attr('class', 'col-xs-3 btn btn-default btn-default');
            $('#updatejawabanb').attr('class', 'col-xs-3 btn btn-default btn-primary');
            $('#updatejawabanc').attr('class', 'col-xs-3 btn btn-default btn-default');
            $('#updatejawaband').attr('class', 'col-xs-3 btn btn-default btn-default');    
            $('#updatejawaban').attr('value','2');
        }else if(data.recordJawaban=='c'){
            $('#updatejawabana').attr('class', 'col-xs-3 btn btn-default btn-default');
            $('#updatejawabanb').attr('class', 'col-xs-3 btn btn-default btn-default');
            $('#updatejawabanc').attr('class', 'col-xs-3 btn btn-default btn-primary');
            $('#updatejawaband').attr('class', 'col-xs-3 btn btn-default btn-default');    
            $('#updatejawaban').attr('value','3');
        }else if(data.recordJawaban=='d'){
            $('#updatejawabana').attr('class', 'col-xs-3 btn btn-default btn-default');
            $('#updatejawabanb').attr('class', 'col-xs-3 btn btn-default btn-default');
            $('#updatejawabanc').attr('class', 'col-xs-3 btn btn-default btn-default');
            $('#updatejawaband').attr('class', 'col-xs-3 btn btn-default btn-primary');    
            $('#updatejawaban').attr('value','4');
        }
    });
});