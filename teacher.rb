require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(name = "Unknown", age = nil, parent_permission = true, specialization)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
