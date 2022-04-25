# Creates a node object with a value and a pointer to the next node
class Node
  attr_accessor :pointer, :value

  def initialize(value = nil, pointer = nil)
    @value = value
    @pointer = pointer
  end
end
