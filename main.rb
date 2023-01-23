require "matrix"

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

class FloodFill
    def floodFill(matrix, row, col, oldColour, newColour)
        if row < 0 || row >= matrix.to_a.length || col < 0 || col >= matrix.to_a[0].length || matrix[row, col] == newColour || matrix[row, col] != oldColour
            return
        end
        matrix[row, col] = newColour

        floodFill(matrix, row + 1, col, oldColour, newColour)
        floodFill(matrix, row - 1, col, oldColour, newColour)
        floodFill(matrix, row, col + 1, oldColour, newColour)
        floodFill(matrix, row, col - 1, oldColour, newColour)
    end
end

class MatrixHelper
    def create(input)
        if (1..250).include?(input[1].to_i) && (1..250).include?(input[2].to_i)
            Matrix.build(input[2].to_i, input[1].to_i) { |row, column| "0" }
        else
            puts "Out of range (1-250)!"
        end
    end

    def colourPixel(input, matrix)
        if matrix.nil? || input[3].to_s.empty?
            puts "Create image with I command or empty new colour"
        else
            matrix[input[2].to_i - 1, input[1].to_i - 1] = input[3].to_s
        end
    end
    
    def verticalSegment(input, matrix)
        if matrix.nil? || input[4].to_s.empty?
            puts "Create image with I command or empty new colour"
        else
            matrix.each_with_index do |e, row, col|
                if col == input[1].to_i 
                    if row >= input[2].to_i
                        if row <= input[3].to_i
                            matrix[row-1,col-1] = input[4].to_s
                        end
                    end
                end
            end
        end
    end

    def horizontalSegment(input, matrix)
        if matrix.nil? || input[4].to_s.empty?
            puts "Create image with I command or empty new colour"
        else
            matrix.each_with_index do |e, row, col|
                if row == input[3].to_i 
                    if col >= input[1].to_i
                        if col <= input[2].to_i
                            matrix[row-1,col-1] = input[4].to_s
                        end
                    end
                end
            end
        end
    end

    def fillArea(input, matrix)
        if matrix.nil? || input[3].to_s.empty?
            puts "Create image with I command or empty new colour"
        else
            x = input[2].to_i - 1
            y = input[1].to_i - 1
            original_colour = matrix[x, y]
            new_colour = input[3].to_s

            if original_colour == new_colour
                return
            end

            FloodFill.new.floodFill(matrix, x, y, original_colour, new_colour)

        end
    end

    def clearMatrix(matrix)
        if matrix.nil?
            puts "Create image with I command"
        else
            matrix.each_with_index do |e, row, col|
                matrix[row,col] = "0"
            end
        end
    end

    def printMatrix(matrix)
        if matrix.nil?
            puts "Create image with I command"
        else
            matrix.to_readable
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
