$ ->
  token = $("meta[name=\"csrf-token\"]").attr("content")
  $.ajaxPrefilter (options, originalOptions, xhr) ->
    xhr.setRequestHeader "X-CSRF-Token", token
    return

  return