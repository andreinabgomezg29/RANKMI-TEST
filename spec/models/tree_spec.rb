
require 'rails_helper'

RSpec.describe Tree, type: :model do
  before do
  @area = Tree.create(area: "Gerencia General", score: 0)
end

  it { is_expected.to validate_presence_of(:score) }
  it { is_expected.to validate_presence_of(:area) }

  describe "#sibling_count" do

   it "returns the number in the tree when the areas are siblings" do
      area_1_1 = @area.children.create(area: "Gerencia 1", score: 1)
      area_1_2 = @area.children.create(area: "Gerencia 2", score: 2)
     expect(area_1_1.sibling_count - 1).to eq 1
   end

   it "returns the number of siblings in the tree when the areas arent siblings" do
     expect(@area.sibling_count - 1).to eq 0
   end
  end

  describe "#sibling_score" do

   it "when is siblings, returns the sum of the siblings score" do
      area_1_1 = @area.children.create(area: "Gerencia 1", score: 10)
      area_1_2 = @area.children.create(area: "Gerencia 2", score: 1)
     expect(area_1_2.sibling_score).to eq 11
   end
  end
end
