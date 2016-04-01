class NutritionFacts::Item
  attr_accessor :total_hits, :hits, :max_score,
                :item_name, :nf_calories, :nf_total_fat,
                :nf_total_carbohydrate, :nf_dietary_fiber, :nf_sugars,
                :nf_protein, :nf_serving_size_qty, :nf_serving_size_unit,
                :nf_serving_weight_grams, :nf_sodium, :nf_vitamin_c_dv,
                :nf_vitamin_a_dv

  @@all = []

  def initialize(item_list = {})
    item_list.each do |key, value|
      send("#{key}=", value)
    end
  end

  def self.find_by_name(name)
    uri = URI.parse("https://api.nutritionix.com/v1_1/search/#{name}?results=0%3A3&cal_min=0&cal_max=50000&fields=item_name%2Cnf_calories%2Cnf_total_fat%2Cnf_total_carbohydrate%2Cnf_dietary_fiber%2Cnf_sugars%2Cnf_protein%2Cnf_serving_weight_grams%2Cnf_sodium%2Cnf_vitamin_a_dv%2Cnf_vitamin_c_dv&appId=da276553&appKey=f501b79647768ba684af20428a44ef59")

    response = Net::HTTP.get_response(uri)

    raw_data = JSON.parse(response.body)
    # binding.pry

    @@all << NutritionFacts::Item.new(raw_data['hits'][0]['fields'])
    @@all << NutritionFacts::Item.new(raw_data['hits'][1]['fields'])
    @@all << NutritionFacts::Item.new(raw_data['hits'][2]['fields'])
    # binding.pry
  end

  def self.all
    @@all
  end

  def self.reset
    @@all.clear
  end
end
