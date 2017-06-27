$ ->
  $(document).on 'click', '#character_career_id_chosen', (evt) ->
    $.ajax 'skills_select',
      type: 'GET'
      dataType: 'script'
      data: {
        career: $("#character_career_id_chosen > a > span").text()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic market select OK!")

  $(document).on 'click', '.fa-plus-circle', (evt) ->
    $.ajax 'increment_rank',
      type: 'PATCH'
      dataType: 'script'
      data: { 
        skill_name: $(this).data("name"),
        character_id: $(this).data("character")
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic market select OK!")

  $(document).on 'click', '.fa-minus-circle', (evt) ->
    $.ajax 'decrement_rank',
      type: 'PATCH'
      dataType: 'script'
      data: { 
        skill_name: $(this).data("name")
        character_id: $(this).data("character")
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic market select OK!")
