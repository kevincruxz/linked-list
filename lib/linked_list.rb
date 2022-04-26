require_relative 'node'

# Containes all the node objects and th methods to interact with them
class LinkedList
    @@nested_obj = nil
    @@length = 0

    def append(value)
        if @@nested_obj.nil?
            @@nested_obj = Node.new(value)
        else
            # Enter the nestedest pointer
            # While pointer is diff from nil keep entering other nested obj
            a = linked_list_rail('a')
            a.pointer = Node.new(value)
        end
        @@length += 1
        'Node added.'
    end

    def prepend(value)
        # Append a node to the start of the linked list
        @@nested_obj = Node.new(value, @@nested_obj)
        @@length += 1
        'Node added.'
    end

    def size
        # Returns the total num of nodes in the list
        @@length
    end

    def head
        !@@nested_obj.nil? ? "[#{@@nested_obj.value}, --> ]" : 'There are no nodes in the list.'
    end

    def tail
        a = linked_list_rail('a')
        return 'There are no nodes in the list.' if a == 'error'

        "[#{a.value}, nil ]"
    end

    def at(index)
        return 'There are no nodes in the list.' if size == 0

        while index.to_i < 1 || index.to_i > size
            print 'Wrong index, try another: '
            index = gets.chomp
        end
        a = linked_list_rail(index)

        a.pointer.nil? ? "[#{a.value}, nil ]" : "[#{a.value}, --> ]"
    end

    def pop
        a = linked_list_rail(size - 1)
        a.pointer = nil
        @@length -= 1
        'Last element removed.'
    end

    def contains?(value)
        linked_list_rail(value, 'c') == true
    end

    def find(value)
        i = linked_list_rail(value, 'f')
        i.is_a?(Integer) ? "The value is at index: #{i}" : 'Value not found.'
    end

    def to_s
        return 'There are no nodes in the list.' if @@nested_obj.nil?

        a = @@nested_obj
        str = size == 1 ? "( #{a.value} ) --> nil" : ''
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
        return 'error' if @@nested_obj.nil?

        a = @@nested_obj
        if caller
            return true if need == a.value && caller == 'c'
            return 1 if need == a.value && caller == 'f'
        end
        i = 1
        until a.pointer.nil?
            return a if need.to_i == i && caller.nil? # at method

            a = a.pointer
            i += 1
            return true if need == a.value && caller == 'c' # c = contains method
            return i if need == a.value && caller == 'f' # f = find method
        end
        need == 'i' ? i : a
    end
end