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

    describe "#colourPixelInMatrix" do 
        matrix = Matrix.build(3, 3) { |row, column| "0" } 
        #subject { MatrixHelper.new(["i", "5", "5", "K"], matrix)}        

        context "wrong positive coordinates" do
            subject { MatrixHelper.new(["i", "5", "5", "K"], matrix)}  
            it "should raise IndexError" do 
                expect{subject.colourPixelInMatrix}.to raise_error(IndexError)
            end
        end

        context "wrong negative coordinates" do
            subject { MatrixHelper.new(["i", "-4", "-1", "K"], matrix)}  
            it "should raise IndexError" do 
                expect{subject.colourPixelInMatrix}.to raise_error(IndexError)
            end
        end

        context "wrong input variables" do
            subject { MatrixHelper.new(["i", "g", "-h", "K"], matrix)}  
            it "should raise IndexError" do 
                expect{subject.colourPixelInMatrix}.to raise_error(IndexError)
            end
        end

        context "wrong number of input variables" do
            subject { MatrixHelper.new(["i", "2", "2"], matrix)}  
            it "should write image creation and incorrect input warning" do 
                expect{subject.colourPixelInMatrix}.to output("Create image with I command or input not correct\n").to_stdout
            end
        end

        context "matrix not created yet" do
            emptyMatrix = nil
            subject { MatrixHelper.new(["i", "2", "2", "k"], emptyMatrix)}  
            it "should write image creation and incorrect input warning" do 
                expect{subject.colourPixelInMatrix}.to output("Create image with I command or input not correct\n").to_stdout
            end
        end

        context "correct input" do
            
            let(:object) { MatrixHelper.new(["i", "2", "2", "k"], matrix) }   

            it "should be the same matrixes" do 
                pending "fix coloration"

                testMatrix1 = Matrix.build(3, 3) { |row, column| "0" }
                #because coordinates start from 0 so (2,2) would be (1,1)
                testMatrix1[2-1, 2-1] = "k".to_s
                

                colouredMatrix = object.colourPixelInMatrix
                pp matrix == testMatrix1
                expect(colouredMatrix).to eq(testMatrix1)
            end
        end

    end
    
end