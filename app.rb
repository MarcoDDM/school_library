require_relative 'classroom'
require_relative 'student'
require_relative 'book'
require_relative 'person'
require_relative 'rental'

class App
  def initialize
    @classroom = Classroom.new("Math Class")
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
    if role == "student"
      person = Student.new(classroom: @classroom, name: name, age: age)
    elsif role == "teacher"
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
      rental = Rental.new("2023-07-26", book, person)
      person.add_rental(rental, book)
      book.add_rental(rental)
      @rentals << rental
      puts "Rental created successfully!"
    else
      puts "Person or book not found. Please check the IDs and titles and try again."
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
      puts "Person not found. Please check the ID and try again."
    end
  end

  def main
    loop do
      puts "\nWelcome to School Library App!"
      puts "\nPlease choose an option by entering a number:"
      puts "1. List all books"
      puts "2. List all people"
      puts "3. Create a person"
      puts "4. Create a book"
      puts "5. Create a rental"
      puts "6. List all rentals for a given id"
      puts "7. Exit"

      choice = gets.chomp.to_i

      case choice
      when 1
        list_all_books
      when 2
        list_all_people
      when 3
        puts "Enter role (student/teacher):"
        role = gets.chomp.downcase
        puts "Enter name:"
        name = gets.chomp
        puts "Enter age:"
        age = gets.chomp.to_i
        create_person(role, name, age)
      when 4
        puts "Enter title:"
        title = gets.chomp
        puts "Enter author:"
        author = gets.chomp
        create_book(title, author)
      when 5
        puts "Enter person ID:"
        person_id = gets.chomp.to_i
        puts "Enter book title:"
        book_title = gets.chomp
        create_rental(person_id, book_title)
      when 6
        puts "Enter person ID:"
        person_id = gets.chomp.to_i
        list_rentals_for_person(person_id)
      when 7
        puts "Exiting the app..."
        break
      else
        puts "Invalid option. Please try again."
      end
    end
  end
end

# Entry point to the console app
app = App.new
app.main
