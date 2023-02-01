require "matrix"
require_relative 'matrixHelper'

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
            puts "Empty input!"
            break
        end
        helper = MatrixHelper.new
        
        case input[0].upcase
        
        when "I"
            @@m = helper.create(input)
        when "L"
            helper.colourPixel(input, @@m)
        when "V"
            helper.verticalSegment(input, @@m)
        when "H"
            helper.horizontalSegment(input, @@m)
        when "F"
            helper.fillArea(input, @@m)
        when "C"
            helper.clearMatrix(@@m)
        when "S"
            helper.printMatrix(@@m)
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
