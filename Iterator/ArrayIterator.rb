class ArrayIterator
  def initialize(array)
    @array = array
    @index = 0
  end

  def has_next?
    @index < @array.length
  end

  def item
    @array[@index]
  end

  def next_item
    value = @array[@index]
    @index += 1
    value
  end
end

array = ['Red', 'Green', 'Blue']

i = ArrayIterator.new(array)
while i.has_next?
  puts("Item: #{i.next_item}")
end

# i = ArrayIterator.new('ABCDEFG')
# while i.has_next?
#   puts("Item: #{i.next_item}")
# end
