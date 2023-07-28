require_relative 'classroom'
require_relative 'student'
require_relative 'book'
require_relative 'person'
require_relative 'rental'

# Creating instances of Classroom and Student
classroom = Classroom.new('Math Class')
student1 = Student.new(classroom: classroom, name: 'Alice', age: 20)
student2 = Student.new(classroom: classroom, name: 'Bob', age: 19)

# Adding students to the classroom
classroom.add_student(student1)
classroom.add_student(student2)

# Creating instances of Book and Person
book1 = Book.new('Title 1', 'Author 1')
Book.new('Title 2', 'Author 2')
person = Person.new(name: 'John', age: 25)

# Creating a Rental between a Person and a Book
date = '2023-07-26'
Rental.new(date, book1, person)

# Accessing the relationships
puts "Students in Classroom: #{classroom.students.map(&:name)}"
puts "Classroom label for Student 1: #{student1.classroom.label}"
puts "People who rented Book 1: #{book1.rentals.map { |r| r.person.name }}"
puts "Books rented by Person: #{person.rentals.map { |r| r.book.title }}"
