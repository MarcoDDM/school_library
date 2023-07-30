require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @classroom = Classroom.new('Math Class')
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    if @books.empty?
      puts 'There are no books yet.'
    else
      @books.each { |book| puts "#{book.title} by #{book.author}" }
    end
  end

  def list_all_people
    if @people.empty?
      puts 'There are no students or teachers yet.'
    else
      @people.each { |person| puts "#{person.class} - #{person.name}" }
    end
  end

  def create_person
    puts 'Enter role (student/teacher):'
    role = gets.chomp.downcase
    puts 'Enter name:'
    gets.chomp
    name = 'John Doe'
    puts 'Enter age:'
    age = gets.chomp.to_i

    if role == 'student'
      person = Student.new(classroom: @classroom, name: name, age: age)
    elsif role == 'teacher'
      puts 'Enter specialization:'
      specialization = gets.chomp
      person = Teacher.new(specialization: specialization, name: name, age: age)
    else
      puts "Invalid role. Please enter 'student' or 'teacher'."
      return
    end

    @people << person
    puts "#{role.capitalize} #{name} (#{age} years old) created successfully!"
  end

  def create_book
    puts 'Enter title:'
    title = gets.chomp
    puts 'Enter author:'
    author = gets.chomp

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

  def rental_from_input
    puts 'Enter person ID:'
    person_id = gets.chomp.to_i
    puts 'Enter book title:'
    book_title = gets.chomp
    create_rental(person_id, book_title)
  end

  def list_rentals_for_person_from_input
    puts 'Enter person ID:'
    person_id = gets.chomp.to_i
    list_rentals_for_person(person_id)
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

  def exit_app
    puts 'Exiting the app...'
    true
  end
end
