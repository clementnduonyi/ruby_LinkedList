require_relative "linkedlist"

list = LinkedList.new

list.append(25)
list.append(30)
list.append(40)
list.prepend(500)
list.append(450)
list.insert_at(255, 3)
list.remove_at(2)
list.insert_at(199000, 4)

puts list.print

list.pop()
list.append(450)
puts list.print

puts list.to_s

puts list.size

puts list.head

puts list.tail

puts list.at(2)

puts list.at(0)

puts list.contains?(450)

puts list.contains?(45)

puts list.contains?(500)

puts list.find(30)
puts list.find(500)

p list.find(20)

