#! /usr/bin/env ruby

@todos = []
def main
  formattedItems = @todos.map do |item|
    checkbox = item[:checked] ? "[✔]" : "[ ]"
    "#{checkbox} #{item[:title]} \n"
  end

  puts "Ruby Todo List"
  puts "--------------"

  if @todos.size > 0
    puts formattedItems
  else
    "No todo list items yet."
  end

  puts "\ntype 'help' for options, 'exit' to close the program"
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
'enter' to return to list
  )
end

def add_item(title)
  @todos << {title: title, checked: false}
  main
end

def check_item(title)
  selectedItem = @todos.find { |i| i[:title] == title}
  selectedItem[:checked] = !selectedItem[:checked]
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
      when /c\s+(?<item>\w+( \w+)*)/
        check_item($~[:item])
      when "help"
        help_menu
      else
        main
      end
    user_input = gets.chomp
  end

  puts "Goodbye!"
end
