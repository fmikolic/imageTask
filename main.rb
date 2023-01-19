require "matrix"

#build empty matrix with MxN Populate with O colour
#m = Matrix.build(3, 2) { |row, column| "0" }


#write out all variables in matrix with their coordinates in matrix
#m.each_with_index do |e, row, col|
#    puts "(#{row}, #{col}) value - #{e.is_a?(String)}"
#end

class Matrix
    def to_readable
        i = 0
        self.each do |number|
            print number.to_s + " "
            i+= 1
            if i == self.column_size
            print "\n"
            i = 0
            end
        end
    end
end

class Main
    @@m = nil;
    loop do
        puts "-----------------------------------------------------------------------------------------------------"
        puts "Select one of the following commands: "
        puts "I M N - to create new M x N image with pixels colour O"
        puts "L X Y C - to colour the pixel (X,Y) with colour C"
        puts "V X Y1 Y2 C - draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive)"
        puts "H X1 X2 Y C - draw a horizontal semgnet of colour C in row Y between columns X1 and X2 (inclusive)"
        puts "F X Y C - fill the region R with colour C"
        puts "C - clears table, all pixels O"
        puts "S - show the current image"
        puts "X - exit"
        puts "-----------------------------------------------------------------------------------------------------"
        puts "Your choice: "
        input = gets.chomp.split(" ")
        if input.empty?
            break
        end
        
        case input[0].upcase
        
        when "I"
           if (1..250).include?(input[1].to_i) && (1..250).include?(input[2].to_i)
            @@m = Matrix.build(input[2].to_i, input[1].to_i) { |row, column| "0" }
           else
            puts "Out of range (1-250)!"
           end
        when "L"
            if @@m.nil?
                puts "Create image with I command"
            else
                @@m[input[2].to_i - 1, input[1].to_i - 1] = input[3].to_s
            end
        when "V"
            if @@m.nil?
                puts "Create image with I command"
            else
                @@m.each_with_index do |e, row, col|
                    if col == input[1].to_i 
                        if row >= input[2].to_i
                            if row <= input[3].to_i
                                @@m[row-1,col-1] = input[4].to_s
                            end
                        end
                    end
                end
            end

        when "H"
            if @@m.nil?
                puts "Create image with I command"
            else
                @@m.each_with_index do |e, row, col|
                    if row == input[3].to_i 
                        if col >= input[1].to_i
                            if col <= input[2].to_i
                                @@m[row-1,col-1] = input[4].to_s
                            end
                        end
                    end
                end
            end
        when "F"
            if @@m.nil?
                puts "Create image with I command"
            else
                original_colour = @@m[input[2].to_i - 1, input[1].to_i - 1]
                @@m[input[2].to_i - 1, input[1].to_i - 1] = input[3].to_s
                #need rework for common side request
                    
                # @@m.to_a.each do |a|
                    
                #     p a
                # end

                @@m.each_with_index do |e, row, col|
                    if e == original_colour
                        @@m[row,col] = input[3].to_s
                    end
                end
            end
        when "C"
            if @@m.nil?
                puts "Create image with I command"
            else
                @@m.each_with_index do |e, row, col|
                    @@m[row,col] = "0"
                end
            end
        when "S"
            if @@m.nil?
                puts "Create image with I command"
            else
                @@m.to_readable
                #p @@m.to_a
            end
        when "X"
            exit
        else
            puts "Don't know that command!"
        end
    end
end

class Runner
    Main.new
end
