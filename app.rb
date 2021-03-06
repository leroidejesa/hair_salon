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
  erb(:stylist_form)
end

post('/stylists') do
  stylist_name = params.fetch("stylist_name")
  stylist = Stylist.new({:name => stylist_name, :id => nil})
  stylist.save()
  erb(:success)
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @hire_date = [rand(12), rand(28), 10.+(rand(5))].join("-")
  @hours = 15.+(rand(25))
  erb(:stylist_info)
end

patch("/edit_stylist/:id") do
  stylist_name = params.fetch("name")
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:name => stylist_name})
  erb(:success)
end

delete("/stylists/:id") do
  stylist = Stylist.find(params.fetch("id").to_i())
  stylist.delete()
  erb(:success)
end

get('/clients/:id') do
    @client = Client.find(params.fetch("id").to_i())
    erb(:client_info)
end

post('/clients') do
  name = params.fetch("name")
  stylist_id = params.fetch("stylist_id").to_i()
  @stylist = Stylist.find(stylist_id)
  @client = Client.new({:name => name, :id => nil, :stylist_id => stylist_id})
  @client.save()
  erb(:success)
end

patch("/edit_client/:id") do
  client_name = params.fetch("name")
  @client = Client.find(params.fetch("id").to_i())
  @client.update({:name => client_name})
  erb(:success)
end

delete("/client/:id") do
  client = Client.find(params.fetch("id").to_i())
  client.delete()
  erb(:success)
end
