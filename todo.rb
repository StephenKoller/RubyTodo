#! /usr/bin/env ruby

@todos = []
def main
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

def add_item(item)
  puts item
  # @todos.push(item)
  main
end

def clearScreen
  if RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/i
    system('cls')
  else
    system('clear')
 end
end

if __FILE__ == $0
  user_input = ""

  until user_input == "exit" or user_input == "quit" do
    clearScreen
    case user_input
      when /a\s+(?<item>\w+( \w+)*)/
        add_item($~[:item])
      when "help"
        help_menu
      else
        main
      end
    user_input = gets.chomp
  end

  puts "Goodbye!"
end
