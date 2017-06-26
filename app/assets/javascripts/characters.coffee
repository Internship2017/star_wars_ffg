$ ->
  $(document).on 'change', '#character_career_chosen', (evt) ->
    $.ajax 'skills_select',
      type: 'GET'
      dataType: 'script'
      data: {
        career: $("#character_career_chosen option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic market select OK!")
