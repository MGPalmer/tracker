buildUrl = (url, parameters) ->
  qs = ""
  for key, value of parameters
    qs += encodeURIComponent(key) + "=" + encodeURIComponent(value) + "&"
  url = url + "?" + qs if qs.length > 0
  url

tracker =
  track: (params) ->
    (console.log key; console.log params[key]) for key of params
    $(document).ready (x) ->
      $('#tracking-pixels').load buildUrl("/pixels", params)

window.hf = tracker
