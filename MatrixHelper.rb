require_relative 'FloodFill'
require "matrix"

class String
    def is_integer?
      self.to_i.to_s == self
    end
end

class MatrixHelper
    attr_reader :input
    attr_reader :matrix

    def initialize(input, matrix)
      @input = input
      @matrix = matrix
    end


    def createMatrix
        create(@input)
    end

    def colourPixelInMatrix
        colourPixel(@input, @matrix)
    end

    def colourVerticalSegment
        verticalSegment(@input, @matrix)
    end

    def colourHorizontalSegment
        horizontalSegment(@input, @matrix)
    end

    def colourArea
        fillArea(@input, @matrix)
    end

    def resetMatrix
        clearMatrix(@matrix)
    end

    def showMatrix
        printMatrix(@matrix)
    end

    private

    def create(input)
        if input.length != 3
            return puts "Wrong number of parameters!"
        end

        if (1..250).include?(input[1].to_i) && (1..250).include?(input[2].to_i)
            Matrix.build(input[2].to_i, input[1].to_i) { |row, column| "0" }
        else
            puts "Out of range (1-250)!"
        end
    end

    def colourPixel(input, matrix)

        if matrix.nil? || input.length != 4
            return puts "Create image with I command or input not correct"
        end

        if !input[2].is_integer? || !input[1].is_integer?
            return puts "Coordinates aren't numbers!"
        end

        if matrix[input[2].to_i-1, input[1].to_i-1]
            matrix[input[2].to_i - 1, input[1].to_i - 1] = input[3].to_s
            matrix
        else
            raise IndexError
        end
    end
    
    def verticalSegment(input, matrix)
        if matrix.nil? || input.length != 5
            return puts "Create image with I command or input not correct"
        end

        if !input[2].is_integer? || !input[1].is_integer? || !input[3].is_integer?
            return puts "Coordinates aren't numbers!"
        end
        
        if matrix.column_count < input[1].to_i || matrix.row_count < input[2].to_i || 
            matrix.row_count < input[3].to_i || input[1].to_i <= 0 || input[2].to_i <= 0 || input[3].to_i <= 0
            raise IndexError
        else
            matrix.each_with_index do |e, row, col|
                if col == input[1].to_i 
                    if row >= input[2].to_i
                        if row <= input[3].to_i
                            matrix[row-1,col-1] = input[4].to_s
                            matrix
                        end
                    end
                end
            end
        end
    end

    def horizontalSegment(input, matrix)
        if matrix.nil? || input.length != 5
            return puts "Create image with I command or input not correct"
        end

        if !input[2].is_integer? || !input[1].is_integer? || !input[3].is_integer?
            return puts "Coordinates aren't numbers!"
        end
        
        if matrix.column_count < input[1].to_i || matrix.row_count < input[2].to_i || 
            matrix.row_count < input[3].to_i || input[1].to_i <= 0 || input[2].to_i <= 0 || input[3].to_i <= 0
            raise IndexError
        else
            matrix.each_with_index do |e, row, col|
                if row == input[3].to_i 
                    if col >= input[1].to_i
                        if col <= input[2].to_i
                            matrix[row-1,col-1] = input[4].to_s
                            matrix
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