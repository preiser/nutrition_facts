class NutritionFacts::CLI
  def call
    start
  end

  def list
    puts ''
    puts 'Welcome to NutritionFacts CLI'
    puts ''
    @items = NutritionFacts::Item.list_items
    @items.each.with_index(1) do |item, index|
      puts "#{index}. - #{item.name}"
    end
  end

  def start
    list
    input = nil
    uri = URI.parse('https://api.nutritionix.com/v1_1/search/apple?results=0%3A5&cal_min=0&cal_max=50000&fields=item_name%2Cnf_calories%2Cnf_total_fat%2Cnf_total_carbohydrate%2Cnf_dietary_fiber%2Cnf_sugars%2Cnf_protein&appId=da276553&appKey=f501b79647768ba684af20428a44ef59')

    response = Net::HTTP.get_response(uri)

    data = JSON.parse(response.body)

    data['hits'].each do |item|
      puts item['fields']
    end
    
    while input != 'exit'
      puts 'Enter the name of a food to see its nutrition facts:'
      input = gets.strip.downcase

      if input.to_i > 0
        item = @items[input.to_i - 1]
        puts "#{item.name} - #{item.calories}"
      elsif 'list'
        @items
      else
        puts 'not sure what you mean, type in a food' unless input == 'exit'
      end

    end
  end
end
