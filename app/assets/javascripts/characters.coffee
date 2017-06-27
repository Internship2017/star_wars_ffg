$ ->
  $(document).on 'click', '#character_career_chosen', (evt) ->
    $.ajax '/characters/skills_select',
      type: 'GET'
      dataType: 'script'
      data: {
        career: $("#character_career_chosen > a > span").text()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic market select OK!")
