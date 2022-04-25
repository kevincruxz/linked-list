require_relative 'node'

# Containes all the node objects and th methods to interact with them
class LinkedList
    @@nested_obj = nil

    def append(value)
        if @@nested_obj.nil?
            @@nested_obj = Node.new(value)
        else
            # Enter the nestedest pointer
            # While pointer is diff from nil keep entering other nested obj
            a = linked_list_rail('a')
            a.pointer = Node.new(value)
        end
    end

    def prepend(value)
        # Append a node to the start of the linked list
        @@nested_obj = Node.new(value, @@nested_obj)
    end

    def size
        # Returns the total num of nodes in the list
        linked_list_rail('i')
    end

    def head
        "[#{@@nested_obj.value}, --> ]"
    end

    def tail
        a = linked_list_rail('a')
        "[#{a.value}, nil ]"
    end

    def at(index)
        a = linked_list_rail(index)
        "[#{a.value}, --> ]"
    end

    def pop
        a = linked_list_rail(size - 1)
        a.pointer = nil
    end

    def contains?(value)
        linked_list_rail(value, 'c') == true
    end

    def find(value)
        linked_list_rail(value, 'f')
    end

    def to_s
        str = ''
        a = @@nested_obj
        until a.pointer.nil?
            str += "( #{a.value} )"
            a = a.pointer
            if a.pointer.nil?
                str += " --> ( #{a.value} ) -->  nil"
            else
                str += ' --> '
            end
        end
        str
    end

    def linked_list_rail(need, caller = nil)
        i = 1
        a = @@nested_obj
        until a.pointer.nil?
            return a if need == i && !caller

            a = a.pointer
            i += 1
            return true if need == a.value && caller == 'c' # c = contains method
            return i if need == a.value && caller == 'f' # f = find method
        end
        need == 'i' ? i : a
    end
end