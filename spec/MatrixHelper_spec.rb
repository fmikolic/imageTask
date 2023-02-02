require './MatrixHelper'
require "matrix"


RSpec.describe "Matrix helper" do
    describe "#create" do
        context "is negative first dimension input" do  
            let(:object) { MatrixHelper.new(["i", "-2", "2"], []) }   

            it "should return Out of range warning" do
                expect{object.createMatrix}.to output("Out of range (1-250)!\n").to_stdout
            end
        end

        context "is negative second dimension input" do
            let(:object) { MatrixHelper.new(["i", "2", "-2"], []) }   

            it "should return Out of range warning" do
                expect{object.createMatrix}.to output("Out of range (1-250)!\n").to_stdout
            end
        end

        context "wrong number of parameters - just numbers" do
            let(:object) { MatrixHelper.new(["2", "-2"], []) }   

            it "should return Wrong number of parameters warning" do
                expect{object.createMatrix}.to output("Wrong number of parameters!\n").to_stdout
            end
        end

        context "wrong number of parameters - just letters" do
            let(:object) { MatrixHelper.new(["h", "n"], []) }   

            it "should return Wrong number of parameters warning" do
                expect{object.createMatrix}.to output("Wrong number of parameters!\n").to_stdout
            end
        end

        context "wrong number of parameters - empty" do
            let(:object) { MatrixHelper.new([], []) }   

            it "should return Wrong number of parameters warning" do
                expect{object.createMatrix}.to output("Wrong number of parameters!\n").to_stdout
            end
        end

        context "wrong number of parameters - combination letters numbers" do
            let(:object) { MatrixHelper.new(["h", "n", "45", "0"], []) }   

            it "should return Wrong number of parameters warning" do
                expect{object.createMatrix}.to output("Wrong number of parameters!\n").to_stdout
            end
        end

        context "is greater than 250 second dimension input" do
            let(:object) { MatrixHelper.new(["i", "2", "251"], []) }   

            it "should return Out of range warning" do
                expect{object.createMatrix}.to output("Out of range (1-250)!\n").to_stdout
            end
        end

        context "is greater than 250 first dimension input" do
            let(:object) { MatrixHelper.new(["i", "251", "2"], []) }   

            it "should return Out of range warning" do
                expect{object.createMatrix}.to output("Out of range (1-250)!\n").to_stdout
            end
        end
        
        context "is correct input" do  
            let(:object) { MatrixHelper.new(["i", "2", "2"], []) }   

            it "should create Matrix 2x2" do
                matrix = object.createMatrix
                testMatrix = Matrix.build(2, 2) { |row, column| "0" }
                expect(matrix).to eq(testMatrix)
            end
        end

        
    end
    
end