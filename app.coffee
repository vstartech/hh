exp = require 'express'
coffee = require 'coffee-middle'
es = require 'elasticsearch'

app = exp()

app.es = es.Client()

app.configure ->
  app.set "view engine", "jade"
  app.set "views", __dirname + "/views"
  app.set "x-powered-by", false
  app.use (exp.static __dirname + "/public", {maxAge: 604800})

search = require './routes/search.coffee'
search.addRoutes app

app.listen 4010, () ->
  console.log 'app started'
  console.log 'id: ', process.pid

