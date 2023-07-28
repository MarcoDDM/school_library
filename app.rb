# app.rb
require_relative 'classroom'
require_relative 'student'
require_relative 'book'
require_relative 'person'
require_relative 'rental'

class App
  def initialize
    @classroom = Classroom.new('Math Class')
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    @books.each { |book| puts "#{book.title} by #{book.author}" }
  end

  def list_all_people
    @people.each { |person| puts "#{person.class} - #{person.name}" }
  end

  def create_person(role, name, age)
    if role == 'student'
      person = Student.new(classroom: @classroom, name: name, age: age)
    elsif role == 'teacher'
      person = Teacher.new(name: name, age: age)
    else
      puts "Invalid role. Please enter 'student' or 'teacher'."
      return
    end

    @people << person
    puts "#{role.capitalize} #{name} (#{age} years old) created successfully!"
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts "Book '#{title}' by #{author} added to the library!"
  end

  def create_rental(person_id, book_title)
    person = @people.find { |p| p.id == person_id }
    book = @books.find { |b| b.title == book_title }

    if person && book
      rental = Rental.new('2023-07-26', book, person)
      person.add_rental(rental, book)
      book.add_rental(rental)
      @rentals << rental
      puts 'Rental created successfully!'
    else
      puts 'Person or book not found. Please check the IDs and titles and try again.'
    end
  end

  def list_rentals_for_person(person_id)
    person = @people.find { |p| p.id == person_id }

    if person
      puts "Rentals for #{person.name}:"
      person.rentals.each do |rental|
        puts "#{rental.book.title} (#{rental.date})"
      end
    else
      puts 'Person not found. Please check the ID and try again.'
    end
  end
end
