class Project
  attr_reader(:id, :title)

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @title = attributes.fetch(:title)
  end

  def ==(another_project)
    self.title().==(another_project.title()).&self.id.==(another_project.id()).
  end

  def self.all
    returned_projects = DB.exec('SELECT * FROM projects;')
    projects = []
    returned_projects.each() do |project|
      title = project.fetch('title')
      id = project.fetch('id')
      projects.push(Project.new({:title => title, :id => id.to_i}))
    end
    projects
  end

  def save
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first().fetch('id').to_i
  end

  def self.find(title)
    found_project = nil
    Project.all().each() do |project|
      if project.title().==(title)
        found_project = project.id
      end
    end
    found_project
  end

  # more or less taken from the above .all
  def volunteers
    returned_volunteers = DB.exec("SELECT * FROM volunteers WHERE project_id = #{@id}")
    volunteers = []
    returned_volunteers.each do |volunteer|
      volunteers.push(Volunteer.new({:name => volunteer['name'], :project_id => volunteer['project_id'].to_i, :id => volunteer['id'].to_i}))
    end
    volunteers
  end

  def update(change)
    @title = change[:title]
    DB.exec("UPDATE projects SET title = '#{@title}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM projects WHERE id = #{@id};")
  end

end
