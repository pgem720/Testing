require "byebug"

def range(start, last)
  return [] if last <= start

  [start] + range(start + 1, last)
  
end

def sum_of_an_array(arr)
  return 0 if arr.length < 1

  arr[0] + sum_of_an_array(arr[1..-1])
end

def sum_of_an_array_iterative(arr)
  arr.inject {|acc, num| acc + num}
end

def exponentiation(b, n)
  return 1 if n == 0
  
  if n > 0
    b * exponentiation(b, n-1)
  else
    (1.0 / b) * exponentiation(b, n+1)
  end
end

def exponentiation_2(b, n)
  return 1 if n == 0
  
  if n.even?
    expo_even = exponentiation_2(b, n/2)
    expo_even * expo_even
  else
    expo_odd = (exponentiation_2(b, (n-1) / 2)) 
    expo_odd * expo_odd * b
  end

end

class Array 
  
  def deep_dup
    return [] if self.empty?
    [self[0]] + self[1..-1].deep_dup
  end

end

def fib(n)
  return [] if n == 0
  return [0] if n == 1
  return [0, 1] if n == 2
  pre_fib = fib(n-1)
  new_fib = pre_fib[-1] + pre_fib[-2]
  pre_fib += [new_fib]
end

def b_search(arr, target)
  return nil if arr.empty?

  mid_arg = arr.length / 2
  return mid_arg if arr[mid_arg] == target
  
  left = arr[0...mid_arg]
  right = arr[mid_arg+1..-1]

  if target < arr[mid_arg]
    b_search(left, target)
  else
    b_search(right, target)
  end

end

def merge_sort(arr)
  return [] if arr.length == 0
  return arr if arr.length == 1
  mid_idx = arr.length / 2
  left = arr[0..mid_idx]
  right = arr[(mid_idx + 1)..-1]
  
  merge(merge([left[0]],merge_sort(left[1..-1])), merge([right[0]], merge_sort(right[1..-1])))

end

def merge(arr1 , arr2)
  # debugger
  return [] if arr1.empty? && arr2.empty?
  # debugger
  return [arr1[0]] + merge(arr1[1..-1], arr2) if arr2.empty? 
  # debugger
  return [arr2[0]] + merge(arr1 , arr2[1..-1]) if arr1.empty?
  # debugger

  if !arr2.empty? && !arr1.empty?
    # debugger
    if (arr1[0] < arr2[0])
      # debugger
      [arr1[0]] + merge(arr1[1..-1], arr2)
    else
      # debugger
      [arr2[0]] + merge(arr1 , arr2[1..-1])
    end
  end

end


def subsets(array)
  return [[]] if array.empty?
  [[array[0]]] + subsets(array[1..-1])
end

