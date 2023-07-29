# main.rb
require_relative 'app'

def print_menu
  puts "\nWelcome to School Library App!"
  puts "\nPlease choose an option by entering a number:"
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List all rentals for a given id'
  puts '7. Exit'
end

def process_choice(app, choice)
  dispatch_table = {
    1 => :list_all_books,
    2 => :list_all_people,
    3 => :create_person,
    4 => :create_book,
    5 => :rental_from_input,
    6 => :list_rentals_for_person_from_input,
    7 => :exit_app
  }

  if dispatch_table.key?(choice)
    method_name = dispatch_table[choice]
    app.send(method_name)
  else
    puts 'Invalid option. Please try again.'
  end
end

def main
  app = App.new

  loop do
    print_menu
    choice = gets.chomp.to_i

    if process_choice(app, choice) == :exit_app
      app.exit_app # Call exit_app method to print the exit message
      break
    end
  end
end

main
