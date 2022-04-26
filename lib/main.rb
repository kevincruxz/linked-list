require_relative 'linked_list'

# Print the menu, then, in a loop while the user input is diff from 'exit'
# Every input call a function named checker to check if the input is correct
# If it is then call the respective function, else, print 'Wrong Input' and execute the loop again
def print_instructions
    str = "Welcome to my Linked List application.\n"
    str += "Here you can test how a linked list works in the real world.\n"
    str += "A linked list is a data structure where every data element is allocated in a node with it's value and a pointer to the next node\n"
    str += "If there is no more nodes then the last node points to a nil/null value.\n\n"
    str += " --- Selection Menu --- \n"
    selection_menu(str)
end

def selection_menu(str)
    str += "append  -- Append a node to the last position of your linked list.\n"
    str += "prepend  -- Append a node to the start of the linked list\n"
    str += "size  -- Returns the total number of nodes in the list\n"
    str += "head  -- Returns the first node in the list\n"
    str += "tail  -- Returns the last node in the list\n"
    str += "at  -- Returns the node at the given index\n"
    str += "pop  -- Removes the last element from the list\n"
    str += "contains?  -- Returns true if the passed in value is in the list and otherwise returns false.\n"
    str += "find  -- Returns the index of the node containing value, or nil if not found.\n"
    str += "to_s  -- Print the linked list\n"
    str += "menu  -- Print the selection menu\n"
    str += 'exit  -- Stop the execution.'
    puts str
    selection
end

def selection
    inp = ''
    unless inp == 'exit'
        print "\nWrite the name of the function you want to execute: "
        inp = gets.chomp
        inp == 'menu' ? selection_menu("\n--  Selection Menu  --\n") : checker(inp)
    end
end

def checker(inp)
    while true
        begin
            obj = LinkedList.new
            out = obj.send(inp)
        rescue NameError
            puts 'Wrong Input.'
            print 'Try another: '
            inp = gets.chomp
        rescue ArgumentError
            print 'Write the value: '
            meth = obj.method(inp)
            out = meth.call(gets.chomp)
            break
        else
            break
        end
    end
    puts "\n#{out}\n" unless out.nil?
    selection
end

print_instructions
