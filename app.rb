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

post('/employee/new') do
  Employee.create({:name =>  params.fetch('employee-name'), :division_id => params.fetch('division_id')})
  redirect to "/division/#{params.fetch('division_id')}"
end

post('/division/new') do
  Division.create({:name => params.fetch('division-name')})
  redirect to '/'
end

get('/division/:id') do
  @division = Division.find(params.fetch('id'))
  erb(:division)
end

get('/employee/:id') do
  @employee = Employee.find(params.fetch('id'))
  erb(:employee)
end

delete('/employee/:id') do
  employee = Employee.find(params.fetch('id'))
  employee.destroy()
  redirect to "/"
end

delete('/division/:id') do
  division = Division.find(params.fetch('id'))
  division.destroy()
  redirect to "/"
end
