class Volunteer
  attr_reader(:id, :name, :project_id)
  # attr_accessor(:project_id)

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id)
  end

  def ==(another_volunteer)
    self.name().==(another_volunteer.name())
  end

  def self.all
    returned_volunteers = DB.exec('SELECT * FROM volunteers;')
    volunteers = []
    returned_volunteers.each() do |volunteer|
      name = volunteer.fetch('name')
      project_id = volunteer.fetch('project_id')
      id = volunteer.fetch('id')
      volunteers.push(Volunteer.new({:name => name, :project_id => project_id.to_i, :id => id.to_i}))
    end
    volunteers
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', #{@project_id}) RETURNING id;")
    @id = result.first().fetch('id').to_i
  end

  def self.find(name)
    found_volunteer = nil
    Volunteer.all().each() do |volunteer|
      if volunteer.name().==(name)
        found_volunteer = volunteer.id
      end
    end
    found_volunteer
  end

end
