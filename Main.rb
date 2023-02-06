require_relative 'MatrixHelper'


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
        helper = MatrixHelper.new(input, @@m)
        
        case input[0].upcase
        
        when "I"
            @@m = helper.createMatrix
        when "L"
            helper.colourPixelInMatrix
        when "V"
            helper.colourVerticalSegment
        when "H"
            helper.colourHorizontalSegment
        when "F"
            helper.colourArea
        when "C"
            helper.resetMatrix
        when "S"
            helper.showMatrix
        when "X"
            exit
        else
            puts "Don't know that command!"
            break
        end
    end

end

class Runner
    Main.new
end
