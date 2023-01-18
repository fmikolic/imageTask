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
        
        
        case input[0].upcase
        

        when "I"
            @@m = Matrix.build(input[1].to_i, input[2].to_i) { |row, column| "0" }
        when "L"
            @@m[input[1].to_i, input[2].to_i] = input[3].to_s
        when "S"
            @@m.to_readable
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
