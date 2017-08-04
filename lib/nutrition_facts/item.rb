class NutritionFacts::Item
  attr_accessor :total_hits, :hits, :max_score,
                :item_name, :nf_calories, :nf_total_fat,
                :nf_total_carbohydrate, :nf_dietary_fiber, :nf_sugars,
                :nf_protein, :nf_serving_size_qty, :nf_serving_size_unit,
                :nf_serving_weight_grams, :nf_sodium, :nf_vitamin_c_dv,
                :nf_vitamin_a_dv, :nf_calories_from_fat, :nf_saturated_fat,
                :nf_cholesterol, :nf_calcium_dv, :nf_iron_dv

  def initialize(item_list = {})
    item_list.each do |key, value|
      send("#{key}=", value)
    end
  end

  def self.find_by_name(name)
    num_of_results = 9
    returned_items = []

    uri = URI.parse("https://api.nutritionix.com/v1_1/search/#{name}?results=0%3A#{num_of_results}&cal_min=0&cal_max=50000&fields=item_name%2Cnf_calories%2Cnf_total_fat%2Cnf_total_carbohydrate%2Cnf_dietary_fiber%2Cnf_sugars%2Cnf_protein%2Cnf_serving_weight_grams%2Cnf_cholesterol%2Cnf_saturated_fat%2Cnf_calories_from_fat%2Cnf_sodium%2Cnf_calcium_dv%2Cnf_iron_dv%2Cnf_vitamin_a_dv%2Cnf_vitamin_c_dv%2Cnf_serving_size_qty%2Cnf_serving_size_unit&appId=da276553&appKey=f501b79647768ba684af20428a44ef59")

    response = Net::HTTP.get_response(uri)

    raw_data = JSON.parse(response.body)

    unless raw_data['hits'].empty?
      num = raw_data['hits'].count
      hits_array = raw_data['hits']
      hits_array.each do |item|
        returned_items << NutritionFacts::Item.new(item['fields'])
      end
    end
    returned_items
  end
end
