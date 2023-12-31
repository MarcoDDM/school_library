require_relative 'rental'

class Person
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(name: 'Unknown', age: nil, parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental, book)
    @rentals << rental
    book.add_rental(rental)
  end

  private

  def of_age?
    @age && @age >= 18
  end
end
