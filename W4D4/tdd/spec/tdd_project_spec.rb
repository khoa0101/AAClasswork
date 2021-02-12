require 'tdd_project'

describe Array do
  describe "#my_uniq" do
    it "should remove duplicates" do 
      expect([1, 2, 1, 3, 3].my_uniq).to eq([1,2,3])
    end
  end

  describe "#two_sum" do
    it "should return indexes of pairs where elements sum to zero" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
  end 
end

describe "my_transpose" do
  subject(:rows) { rows = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]
}
  it "should return transposed version of the matrix" do
    expect(transpose(rows)).to eq([
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
    ])
  end

  it "should not mutate the original array" do
    expect(rows).to eq([
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
    ])

  end

end

describe "stock_picker" do
  it "should return most profitable pair" do
    expect(stock_picker([1,2,3,4,5])).to eq([0, 4])
    expect(stock_picker([3,2,99,500,5,1000,1])).to eq([1, 5])
    expect(stock_picker( [100, 40, 300, 500, 1] ) ).to eq([1, 3])
  end
end

describe TowersOfHanoi do 
  subject(:tower) {TowersOfHanoi.new}

  describe "#initialize" do 
    it "should initialize the board to have 3 rods and 3 discs" do
      expect(tower.rods.length).to eq(3)
      expect(tower.rods[0].length).to eq(3)
    end

    it "should initialize the discs inside the first rod" do
      expect(tower.rods[0]).to eq([3,2,1])
    end
  end
  
  # describe "#prompt" do

  #   it "should print \"Please enter a starting rod and an ending rod\"" do
  #     input = double("0 2\n", :chomp=>"0 2")
  #     allow(tower).to receive(:gets).and_return(input)

  #     expect { tower.prompt }.to output("Please enter a starting rod and an ending rod").to_stdout
  #   end

  #   it "it should call gets.chomp to get input from the user" do
  #     input = double("0 2\n", :chomp=>"0 2")
  #     allow(tower).to receive(:gets).and_return(input)

  #     expect(input).to receive(:chomp)
  #     expect(tower).to receive(:gets)
  #   end
  # end

  describe "#won?" do

    context "when the game is won" do
      
      it "should return true" do
        tower.rods[2] = [3,2,1]
        expect(tower.rods[2]).to eq([3,2,1])
        expect(tower.won?).to eq(true)
      end
    end

    context "when the game is not won" do
      
      it "should return false" do
        tower.rods[2] = []
        expect(tower.rods[2]).to_not eq([3,2,1])
        expect(tower.won?).to eq false
      end
    end
  end

  describe "#move" do
    it "should mutate @rods" do
      tower.move(0, 1)

      expect(tower.rods[0]).to eq([3, 2])
      expect(tower.rods[1]).to eq([1])

      tower.move(0, 2)
      expect(tower.rods[0]).to eq([3])
    end
  end

end