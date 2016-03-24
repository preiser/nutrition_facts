class NutritionFacts::Item
  attr_accessor :total_hits, :hits, :max_score, :item_name, :nf_calories, :nf_total_fat, :nf_total_carbohydrate, :nf_dietary_fiber, :nf_sugars, :nf_protein, :nf_serving_size_qty, :nf_serving_size_unit

  # def initialize(item_list = {})
  #   item_list["hits"].each do |item|
  #     item["fields"].each do |key, value|
  #       send("#{key}=", value)
  #     end
  #   end
  # end

  @@all = []

  def initialize(item_list = {})
    item_list.each do |key, value|
      send("#{key}=", value)
    end
  end

  def self.find_by_name(name)
    uri = URI.parse("https://api.nutritionix.com/v1_1/search/#{name}?results=0%3A3&cal_min=0&cal_max=50000&fields=item_name%2Cnf_calories%2Cnf_total_fat%2Cnf_total_carbohydrate%2Cnf_dietary_fiber%2Cnf_sugars%2Cnf_protein&appId=da276553&appKey=f501b79647768ba684af20428a44ef59")

    response = Net::HTTP.get_response(uri)

    raw_data = JSON.parse(response.body)
    # binding.pry

    @@all << NutritionFacts::Item.new(raw_data["hits"][0]["fields"])
    @@all << NutritionFacts::Item.new(raw_data["hits"][1]["fields"])
    @@all << NutritionFacts::Item.new(raw_data["hits"][2]["fields"])
    # binding.pry
  end

  def self.all
    @@all
  end

  def self.reset
    @@all.clear
  end

end
