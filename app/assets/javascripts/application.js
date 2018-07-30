// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require rails-ujs
//= require bootstrap
//= require activestorage
//= require turbolinks
//= require_tree .
 $(document).on('change','#bug_types', (function(){
       

        var bug=this.value
        if(bug=='bug'){
            var  status_select=$('#bug_status');
            var bug_options=['new','started','resolved'];
            status_select.html('');

             bug_options.forEach(function(option,index){
                     status_select.append(`<option value='${option}'>${option} </option>`)
              })

         }else{
            var  status_select=$('#bug_status');
            var bug_options=['new','started','completed'];
            status_select.html('');

             bug_options.forEach(function(option,index){
                     status_select.append(`<option value='${option}'>${option} </option>`)
              })



         }


    })
)


 $(document).ready(function(){
      $('.assignme_mark').on('click', function(){
         var button = $(this);
         var bugId = this.parentElement.id;
          $.ajax({ 
            url: '/bugs/'+ bugId +'/assignme',
            type: "GET",
            success: function(data){
            button.html("Mark");
           status_id = button.attr("data-id")
           $("#bug_status_"+status_id).html("started")

    $(document).ready(function(){
      $('.assignme_mark').on('click', function(){
         var button = $(this);
         var bugId = this.parentElement.id;
          $.ajax({ 
            url: '/bugs/'+ bugId +'/markup',
            type: "GET",
            success: function(data){
            button.html("Completed");
            status_id = button.attr("data-id")
            $("#bug_status_"+status_id).html("Completed")

        }
      });
    });
  });

        }
      });
    });
  });



   


