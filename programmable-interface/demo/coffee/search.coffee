class Demo.Search

  search: (searchString) ->
    dictionary = new Demo.Dictionary()
    matchingWords = _.select(dictionary.words, (word) -> word.match(searchString))

