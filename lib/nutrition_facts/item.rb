class NutritionFacts::Item
  attr_accessor :name, :calories, :protein, :sugars

  def self.list_items
    puts '1. apple raw, medium'
    puts '2. apple cooked, large'
  end

  def self.item_facts
    puts <<-DOC.gsub /^\s*/, ''
  Nutrition Facts for apple raw, medium

  Calories:
  Protein:
  Sugar:
  DOC
  end
end
