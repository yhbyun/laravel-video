$ = require 'jquery'

hljs = remark.highlighter.engine

hljs.registerLanguage 'terminal', ->
  contains: [
    className: 'string', begin: '^([\\w.]+)@([\\w.]+)'
  ,
    className: 'constant', begin: ' (.*) \\$ '
  , 
    className: 'ansi', begin: '<span class\\="([^"]+)">', end: '<\\/span>'
  ]

remark.macros.scale = (percentage)->
  '<img src="' + @ + '" style="width: ' + percentage + '" />';

slides = remark.create
  navigation:
    scroll : false
  sourceUrl         : 'slide.md'
  highlightStyle    : 'monokai'
  highlightLanguage : 'php'
  #ratio : '16:9'

# extract the embedded styling from ansi spans
$('code.terminal span.hljs-ansi').replaceWith (i, x) ->
  x.replace /&lt;(\/?(\w+).*?)&gt;/g, '<$1>'
