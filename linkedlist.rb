class Node
    attr_accessor :value, :next_node

    def initialize(value=nil, next_node=nil)
        @value = value
        @next_node = next_node
    end
    
end

class LinkedList

    def initialize
        @head = nil
        @tail = nil
    end


    def append(value)
        if @head
            node = @head
            node = node.next_node while node.next_node
            new_node = Node.new(value)
            node.next_node = new_node
        else
            @head = Node.new(value)#new_node
        end
    end

    def prepend(value)
        new_node = Node.new(value, @head)
        @head = new_node
    end

    def size
        node_count = 0
        if !@head
            return 0
        elsif @head
            node = @head
            node_count += 1
            while node.next_node
                node_count += 1
                node = node.next_node
            end
        end
        node_count
    end

    def head
        @head.value
    end

    def tail
        return if !@head
        node = @head
        until node.next_node.nil?
            node = node.next_node
        end
        node.value
    end

    def at(index)
        return if !@head
        
        if index === 0
            return @head.value
        else
            node = @head
            node_counter = 0
            until node.next_node.nil?
                node = node.next_node
                node_counter += 1
                if node_counter === index
                    return node
                    
                end
               
            end
            
        end
       
    end

    def pop
        return nil if !@head

        if !@head.next_node
            @head = nil
            return
            
        else
            prev_node = @head
            node = prev_node.next_node
            
            while node.next_node
                node = node.next_node
                prev_node = prev_node.next_node
            end
            prev_node.next_node = nil
        end
    end

    def contains?(value)
        node = @head
        until node.next_node.nil?
            node = node.next_node
        end
        if node.value === value || @head.value === value
            true
        
        else
            false
        end
    end

    def find(value)
        if @head
            index = 0
            node = @head
            if node.value === value
                return index
            end
            while node.next_node
                node = node.next_node
                index += 1
                if node.value === value #|| @head.value === value
                    return index
                end
            end
        end
    end

    def to_s
        if !@head
            return
        end
        node = @head
        string = "#{node.value}"
        while node.next_node
            node = node.next_node
            string += "-> #{node.value}"
        end
        string + "-> nil"
    end

    def insert_at(value, index)
        node = @head
        (index - 1).times do
            raise "List not long enough!" if node.nil? 
            node = node.next_node
        end
        new_node = Node.new(value)
        new_node.next_node = node.next_node
        node.next_node = new_node
    end

    def remove_at(index)
        if !@head
            return
        elsif index == 0
            @head = @head.next_node
            return
        end
        prev_node = at(index - 1)
        if !prev_node || !prev_node.next_node
            return
        end
        prev_node.next_node = prev_node.next_node.next_node

    end



            

    def print
        if @head
            node = @head
            i = 0

            while node.next_node
                puts "#{i}:\t#{node.value}"
                node = node.next_node
                i += 1
            end
            puts "#{i}:\t#{node.value}"
        end
    end
end