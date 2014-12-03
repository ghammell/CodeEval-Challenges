class BinarySearch
  def self.search(array, term, actual_index=nil)
    current_index = array.length / 2 - 1
    actual_index ||= current_index
    if array.length == 1 then actual_index += 1 end

    return actual_index if array[current_index] == term

    if term < array[current_index]
      new_array = array[0..current_index-1]
      actual_index -= new_array.length - (new_array.length / 2 - 1)
    else
      new_array = array[current_index+1..-1]
      actual_index += new_array.length / 2
    end

    search(new_array, term, actual_index)
  end
end

test = ('a'..'z').to_a
test.each {|item| p BinarySearch.search(test, item)}

# p BinarySearch.search(test, 'r')