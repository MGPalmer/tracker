buildUrl = (url, parameters) ->
  qs = ""
  for key, value of parameters
    qs += encodeURIComponent(key) + "=" + encodeURIComponent(value) + "&"
  url = url + "?" + qs if qs.length > 0
  url

#alert 'tracker loaded'
tracker =
  track: (params) ->
    (console.log key; console.log params[key]) for key of params
    $(document).ready (x) ->
      # $('script[src$="tracker.js"]').after "<iframe src='/scripts?ref=" + params['ref'] + "' style='width:0px height:0px' />"
      $('#tracking-scripts').load buildUrl("/scripts", params)

window.hf = tracker
