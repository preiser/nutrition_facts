class NutritionFacts::Item
  attr_accessor :name, :calories, :protein, :sugar

  # @@all = []

  def self.list_items
    item_1 = new
    item_1.name = 'apple raw, medium'
    item_1.calories = '100'
    item_1.protein = '0'
    item_1.sugar = '10'
    # @@all << item_1

    item_2 = new
    item_2.name = 'apple cooked, large'
    item_2.calories = '150'
    item_2.protein = '0'
    item_2.sugar = '20'
    # @@all << item_2

    # @@all

    [item_1, item_2]
  end

  def self.item_facts
    puts <<-DOC.gsub /^\s*/, ''
  Nutrition Facts for apple raw, medium

  Calories:
  Protein:
  Sugar:
  DOC
  end

  def self.all
    @@all
  end
end
