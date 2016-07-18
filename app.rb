require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
require('./lib/division')
require('./lib/employee')
also_reload('lib/**/*.rb')
require('pg')
require('pry')

get('/') do
  @page_title = "humanresources"
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:index)
end

post('/division/new') do
  Division.create({:name => params.fetch('division-name')})
  redirect to '/'
end

get('/division/:id') do
  @division = Division.find(params.fetch('id'))
  erb(:division)
end
