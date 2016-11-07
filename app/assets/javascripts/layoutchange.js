<script>
  $('#question_Question_type').on('change',function(){
     var option = $(this).val();
    if(option == "Single Choice"){
      $('.multiple-choice').hide()
      $('.single-choice').show()
      $('.yes-no').hide()
    }
    if(option == "Multiple Choice"){
      $('.multiple-choice').show()
      $('.single-choice').hide()
      $('.yes-no').hide()
    }
    if(option == "yes/no"){
      $('.multiple-choice').hide()
      $('.single-choice').hide()
      $('.yes-no').show()
    }
  })
</script>