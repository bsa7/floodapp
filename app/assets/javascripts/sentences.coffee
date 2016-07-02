# Serve sentence flow page
render_template = (data) ->
  sentence_template = 'hamlbars/sentences/sentence_card'
  if data.sentence
    if $("[data-id=#{data.sentence[0]}]").length == 0
      rendered = HandlebarsTemplates[sentence_template](data)
      $('#sentence-cards-flow').append($(rendered))
    else
      console.log 'Уже было'
  else
    console.log 'Нет таких'

query_data = (options) ->
  url = options.href
  delete(options['href'])
  $.ajax
    url: url
    data: options
    dataType: 'json'
    success: (data) ->
      render_template(data)

$(document).on 'ready page:load', ->
  $add_sentence_button = $('[id^=add-random-sentence]')
  if $add_sentence_button.length > 0
    $add_sentence_button.on 'click', (e) ->
      e.stopPropagation()
      e.preventDefault()
      query_data
        href: e.target.getAttribute('href')
