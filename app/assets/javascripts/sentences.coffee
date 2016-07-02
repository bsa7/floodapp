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
  $add_sentence_button = $('#add-random-sentence')
  if $add_sentence_button.length > 0
    $add_sentence_button.on 'click', (e) ->
      e.stopPropagation()
      e.preventDefault()
      query_data
        href: e.target.getAttribute('href')

  $text_search_input = $('#text-search')
#  if $text_search_input.length > 0
#    $text_search_input.on 'keyup', (e) ->
#      query_data
#        href: e.target.getAttribute('href')
#        text: $text_search_input.val()
#
#    $text_search_input.on 'change', (e) ->
#      query_data
#        href: e.target.getAttribute('href')
#        text: $text_search_input.val()

#  $text_search_input.select2
#    ajax:
#      url: 'https://api.github.com/search/repositories'
#      dataType: 'json'
#      delay: 250
#      data: (params) ->
#        {
#          q: params.term
#          page: params.page
#        }
#      processResults: (data, params) ->
#        # parse the results into the format expected by Select2
#        # since we are using custom formatting functions we do not need to
#        # alter the remote JSON data, except to indicate that infinite
#        # scrolling can be used
#        params.page = params.page or 1
#        {
#          results: data.items
#          pagination: more: params.page * 30 < data.total_count
#        }
#      cache: true
#    escapeMarkup: (markup) ->
#      markup
#    minimumInputLength: 1
#    templateResult: formatRepo
#    templateSelection: formatRepoSelection
