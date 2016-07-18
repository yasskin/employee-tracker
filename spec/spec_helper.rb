ENV['RACK_ENV'] = 'test'

require('rspec')
require('pg')
require('sinatra/activerecord')
require('division')
require('employee')

RSpec.configure do |config|
  config.after(:each) do
    Division.all().each do |task|
      task.destroy()
    end
    Employee.all().each do | emp |
      emp.destroy()
    end
  end
end
