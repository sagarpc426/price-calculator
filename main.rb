# global variables for product prices
$milk_price = 3.97
$bread_price = 2.17 
$apple_price = 0.89 
$banana_price = 0.99
$discount = 0
$item_count = {"apple"=>0, "banana"=>0, "bread"=>0, "milk"=>0}

module Store
    # module for all calculations

    # method to calculate milk price
    def milk_price(count)
        if count == 2
            return 5.0
        else
            $discount += 2.94
            count -= 2
            return (5.0 + (count * $milk_price))
        end
    end

    #method to calculate bread price
    def bread_price(count)
        if count == 3
            return 6.0
        else
            count -= 3
            $discount += 0.51
            return (6.0 + (count*$bread_price))
        end
    end

    # method to calculate banana price
    def banana_price(count)
        count*$banana_price
    end

    # method to calculate apple price
    def apple_price(count)
        count*$apple_price
    end
end

class Shop1
    # class to 
    include Store
    def frequency(item)
        c = $order.select do |e|
         item.downcase == e
        end 
        c.size
     end
     
     def getdata
        puts "Please enter all the items purchased separated by a comma"
        $order = gets.chomp
        $order = $order.split(/\,/)
        $order.uniq.map do |e|
            $item_count[e] = frequency(e)
        end
        # puts $item_count["milk"]
        bill = []
        bill.push(apple_price($item_count["apple"])) if $item_count["apple"] != 0
        bill.push(banana_price($item_count["banana"])) if $item_count["banana"] !=0
        bill.push(bread_price($item_count["bread"])) if $item_count["bread"] != 0
        bill.push(milk_price($item_count["milk"])) if $item_count["milk"] != 0
        # puts $item_count.size
        puts "Item\tQuantity\tPrice"
        puts "--------------------------------------"
        total = 0;
        i = 0;
        $len = $item_count.size
        
        $item_count.each do |key, value|
            next if value == 0
            puts "#{key.capitalize}\t#{value}\t\t%0.2f" % [bill[i]]
            total += bill[i]
            i += 1
        end
        puts "Total: $%0.2f" % [total]
        if $discount != 0
            puts "You saved $%0.2f today" % [$discount]
        end
     end
end

s = Shop1.new
s.getdata