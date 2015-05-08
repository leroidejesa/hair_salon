require("sinatra")
require("sinatra/reloader")
require('./lib/client')
also_reload("lib/**/*.rb")
require("./lib/stylist")
require("pg")

DB = PG.connect({:dbname => "hair_salon_test"})

get('/') do
  erb(:index)
end
