require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/project')
require('./lib/volunteer')
require('pg')
require('pry')

DB = PG.connect({:dbname => 'volunteer_tracker_test'})

get('/') do
  @projects = Project.all()
  @volunteers = Volunteer.all()
  erb(:index)
end
