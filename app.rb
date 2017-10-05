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

# WORK ON ME !!!!!!!!!!!!!!
post('/new_volunteer/:id') do
  @project = Project.find(params.fetch("id").to_i())
  name = params.fetch("name")
  volunteer = Volunteer.new({:name => name, :id => nil, :project_id => @project.id})
  volunteer.save()
  # @projects = Project.all()
  # @volunteers = Volunteer.all()
  redirect '/'
end
# WORK ON ME !!!!!!!!!!!!!!

get('/project/:id') do
  @project = Project.find(params.fetch('id').to_i())
  @projects = Project.all()
  @volunteers = Volunteer.all()
  erb(:project)
end

get('/volunteer/:id') do
  @volunteers = Volunteer.all
  @volunteer = Volunteer.find(params.fetch("id").to_i())
  erb(:volunteer)
end

patch('/volunteer/:id') do
  rename = params.fetch('rename')
  @volunteer = Volunteer.find(params.fetch('id').to_i())
  @volunteer.update({:name => rename})
  @volunteer = Volunteer.all()
  redirect '/'
end

# project page delete & patch
delete '/project/:id' do
  @project = Project.find(params.fetch('id').to_i())
  @project.delete()
  @projects = Project.all()
  redirect '/'
end
patch '/project/:id' do
  rename = params.fetch('rename')
  @project = Project.find(params.fetch('id').to_i())
  @project.update({:title => rename})
  @project = Project.all()
  redirect '/'
end
# End project delete & patch
