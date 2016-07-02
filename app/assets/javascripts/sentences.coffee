# Serve sentence flow page
render_template = (data) ->
  sentence_template = 'hamlbars/sentences/sentence_card'
  if data
    if $("[data-id=#{data[0]}]").length == 0
      rendered = HandlebarsTemplates[sentence_template](data)
      $('#sentence-cards-flow').append($(rendered))
    else
      console.log 'Уже было'
  else
    console.log 'Нет таких'

query_template = (options) ->
  url = options.href
  delete(options['href'])
  $.ajax
    url: url
    data: options
    dataType: 'json'
    success: (data) ->
      render_template(data)

$(document).on 'ready page:load', ->
  $add_sentence_button = $('#add-random-sentence')
  if $add_sentence_button.length > 0
    $add_sentence_button.on 'click', (e) ->
      e.stopPropagation()
      e.preventDefault()
      query_template
        href: e.target.getAttribute('href')

  $text_search_input = $('#text-search')
  if $text_search_input.length > 0
    $text_search_input.on 'keyup', (e) ->
      query_template
        href: e.target.getAttribute('href')
        text: $text_search_input.val()

    $text_search_input.on 'change', (e) ->
      query_template
        href: e.target.getAttribute('href')
        text: $text_search_input.val()
