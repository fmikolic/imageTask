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