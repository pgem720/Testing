require "byebug"

class Array

  def my_each(&prc)
    
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    new_arr = []
    self.my_each do |num| 
      new_arr << num if prc.call(num) 
    end
    new_arr
  end

  def my_reject(&prc)
    new_arr = []
    self.my_each do |num| 
      new_arr << num if !prc.call(num) 
    end
    new_arr
  end

  def my_any?(&prc)
    self.my_each do |num|
      return true if prc.call(num)
    end
    false
  end

    def my_all?(&prc)
    self.my_each do |num|
      return false if !prc.call(num)
    end
    true
  end

  def my_flatten
    return [self] if self.class != Array

    flattened = []
    self.my_each do |ele| 
      if ele.class != Array
        flattened << ele
      else
        flattened += ele.my_flatten
      end
    end
    flattened
  end

  def my_zip(*args)
    arr = [self] + args
    new_arr = []
    
    i = 0
    while i < args.count + 1
      temp_arr = []
      arr.each do |subarr|
          temp_arr << subarr[i]
      end
      new_arr += [temp_arr]
      i += 1 
    end
    new_arr

  end


  def my_rotate(num=1)

    new_self = self.dup
    letters = new_self.shift(num % self.length)
    return new_self += letters    
  end



  def my_join(sep="")
    new_str = ""
    self.each_with_index do |ch, i| 
      if i!=self.length-1
        new_str += ch + sep
      else
        new_str += ch
      end
    end
    new_str
  end

  def my_reverse
    new_arr = []

    (self.length-1).downto(0).each do |i|
      new_arr << self[i]
    end
    new_arr

  end



end




# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
# p return_value

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []
 
# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]


# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p  [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]


