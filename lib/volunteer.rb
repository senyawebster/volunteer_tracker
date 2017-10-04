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

  # PG::InvalidTextRepresentation at /new_volunteer/701
  # ERROR: invalid input syntax for integer: "" LINE 1: ...TO volunteers (name, project_id) VALUES ('Vol 1', '') RETURN...
  # !!!!! You're passing in an empty string now...why??

  def save
    result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', #{@project_id}) RETURNING id;")
    @id = result.first().fetch('id').to_i
  end

# switch these function to find by ID not NAME, duhhhh
  def self.find(id)
    found_volunteer = nil
    Volunteer.all().each() do |volunteer|
      if volunteer.id() == (id)
        found_volunteer = volunteer
      end
    end
    found_volunteer
  end

end
