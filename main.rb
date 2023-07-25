require_relative 'person'
require_relative 'nameable'
require_relative 'decorator'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

person = Person.new('Maximilianus', 22)

capitalized_person = CapitalizeDecorator.new(person)
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)

puts person.correct_name
puts capitalized_person.correct_name
puts capitalized_trimmed_person.correct_name
