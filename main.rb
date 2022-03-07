# global variables for product prices
$milk_price = 3.97
$bread_price = 2.17 
$apple_price = 0.89 
$banana_price = 0.99
$discount = 0

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
        count = $order.uniq.map do |e|
            [e, frequency(e)]
        end
        bill = []
        bill.push(apple_price(count[0][1].to_i))
        bill.push(banana_price(count[1][1].to_i))
        bill.push(bread_price(count[2][1].to_i))
        bill.push(milk_price(count[3][1].to_i)) 
        puts "Item\tQuantity\tPrice"
        puts "--------------------------------------"
        total = 0;
        i = 0;
        $len = count.size
        loop do
            break if i == $len
            total += bill[i]
            print count[i][0]
            print "\t#{count[i][1]}"
            print "\t\t%0.2f" % [bill[i]]
            puts 
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