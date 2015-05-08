require("sinatra")
require("sinatra/reloader")
require('./lib/client')
also_reload("lib/**/*.rb")
require("./lib/stylist")
require("pg")

DB = PG.connect({:dbname => "hair_salon_test"})

get('/') do
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end

get('/stylists/new') do
  #add a stylist
  erb(:stylist_form)
end

post('/stylists') do
  stylist_name = params.fetch("stylist_name")
  stylist = Stylist.new({:name => stylist_name, :id => nil})
  stylist.save()
  erb(:success)
end

get('/stylists/:id') do
  #page where owner views/updates/deletes SPECIFIC stylist
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist_info)
end

patch("/edit_stylist/:id") do
  stylist_name = params.fetch("name")
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:name => stylist_name})
  erb(:success)
end
