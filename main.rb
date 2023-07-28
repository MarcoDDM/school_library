# main.rb
require_relative 'app'

def main
  app = App.new

  loop do
    puts "\nWelcome to School Library App!"
    puts "\nPlease choose an option by entering a number:"
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given id'
    puts '7. Exit'

    choice = gets.chomp.to_i

    case choice
    when 1
      app.list_all_books
    when 2
      app.list_all_people
    when 3
      puts 'Enter role (student/teacher):'
      role = gets.chomp.downcase
      puts 'Enter name:'
      name = gets.chomp
      puts 'Enter age:'
      age = gets.chomp.to_i
      app.create_person(role, name, age)
    when 4
      puts 'Enter title:'
      title = gets.chomp
      puts 'Enter author:'
      author = gets.chomp
      app.create_book(title, author)
    when 5
      puts 'Enter person ID:'
      person_id = gets.chomp.to_i
      puts 'Enter book title:'
      book_title = gets.chomp
      app.create_rental(person_id, book_title)
    when 6
      puts 'Enter person ID:'
      person_id = gets.chomp.to_i
      app.list_rentals_for_person(person_id)
    when 7
      puts 'Exiting the app...'
      break
    else
      puts 'Invalid option. Please try again.'
    end
  end
end

main