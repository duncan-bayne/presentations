window.search = (searchString) ->
  setResults(searchString, new Demo.Search().search(searchString))
  log("search('#{searchString}')")

window.log = (commandText) ->
  $$.clear()
  $$.print("executed: <em>#{commandText}\n</em>")

window.setResults = (searchString, results) ->
  text = results.toString().replace(/,/g, "\n")
  $('#searchString').val(searchString)
  $('#results').text(text)
