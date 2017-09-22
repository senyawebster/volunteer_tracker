class Volunteer
  attr_reader(:id, :name)
  attr_accessor(:project_id)

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id)
  end

  def ==(another_volunteer)
    self.name().==(another_volunteer.name())
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@title}', #{@project_id}) RETURNING id;")
    @id = result.first().fetch('id').to_i
  end

end
