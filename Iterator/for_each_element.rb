# Internal iterator
def for_each_element(array)
  i = 0
  while i < array.length
    yield(array[i])
    i += 1
  end
end

# arr = [10, 20, 30]
# for_each_element(arr) {|element| puts("The element is #{element}")}
# for_each_element(arr) {|element| puts("#{element} x 2 = " + (element*2).to_s)}

# Ruby way
# a = ['foo', 'bar','baz']
# a.each {|element| puts("The element is #{element}")}

a = [ 'joe', 'samuel', 'george' ]
# a.all? {|element| element.length < 4}
puts a.any? {|element| element.length < 4}
