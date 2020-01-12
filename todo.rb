#! /usr/bin/env ruby

@todos = []
def main_menu
  puts %(
    Ruby Todo List
    --------------
    #{@todos.size > 0 ? @todos : "No todo list items yet."}

    type 'help' for options, 'exit' to close the program
  )
end

def help_menu
  puts %(
    Options:
    a - add new list item
    c - check / uncheck list item
    r - rename list item
    d - delete list item

    'help' for this menu
    'exit' to close the program
  )
end

if __FILE__ == $0
  user_input = ""
  until user_input == "exit" or user_input == "quit" do
    case user_input
      when "help"
        help_menu
      else
        main_menu
      end
    user_input = gets.chomp
  end
  puts "Goodbye!"
end
