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

post('/new_project') do
  title = params.fetch("title")
  project = Project.new({:title => title, :id => nil})
  project.save()
  @projects = Project.all()
  @volunteers = Volunteer.all()
  erb(:index)
end

post('/new_volunteer') do
  name = params.fetch("name")
  volunteer = Volunteer.new({:name => name, :id => nil, :project_id => #{@project_id})
  volunteer.save()
  @projects = Project.all()
  @volunteers = Volunteer.all()
  erb(:index)
end
