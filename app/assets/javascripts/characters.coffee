$ ->
  $(document).on 'click', '#character_career_id_chosen', (evt) ->
    $.ajax 'skills_select',
      type: 'GET'
      dataType: 'script'
      data: {
        career: $("#character_career_id_chosen > a > span").text()
      }

  $(document).on 'click', '.fa-plus-circle', (evt) ->
    $.ajax 'increment_rank',
      type: 'PATCH'
      dataType: 'script'
      data: { 
        skill_name: $(this).data("name"),
        character_id: $(this).data("character")
        total_xp: $(this).data("total_xp")
        available_xp: $(this).data("available_xp")
      }

  $(document).on 'click', '.fa-minus-circle', (evt) ->
    $.ajax 'decrement_rank',
      type: 'PATCH'
      dataType: 'script'
      data: { 
        skill_name: $(this).data("name")
        character_id: $(this).data("character")
        total_xp: $(this).data("total_xp")
        available_xp: $(this).data("available_xp")
      }