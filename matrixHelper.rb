require_relative 'floodFill'

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