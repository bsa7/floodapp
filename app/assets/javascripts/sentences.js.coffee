sentence_ids = []

# Serve sentence flow page
render_template = (data) ->
  sentence_template = 'hamlbars/sentences/sentence_card'
  success_status = false
  if data.sentence
    sentence_id = data.sentence[0]
    if sentence_ids.indexOf(sentence_id) == -1
      sentence_ids.push(sentence_id)
      rendered = HandlebarsTemplates[sentence_template](data)
      $('#sentence-cards-flow').append($(rendered))
      success_status = true
    else
      console.log 'Уже было'
  else
    console.log 'Нет таких'
  success_status

query_data = (options) ->
  url = options.href
  delete(options['href'])
  $.ajax
    url: url
    data: options
    dataType: 'json'
    success: (data) ->
      unless render_template(data)
        query_data(options)

$(document).on 'ready page:load', ->
  $add_sentence_button = $('[id^=add-random-sentence]')
  if $add_sentence_button.length > 0
    $add_sentence_button.on 'click', (e) ->
      e.stopPropagation()
      e.preventDefault()
      query_data
        href: e.target.getAttribute('href')
