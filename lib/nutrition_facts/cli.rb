class NutritionFacts::CLI
  def call
    welcome
    food_search
  end

  def welcome
    system 'clear'
    puts ''
    puts '--- Welcome to NutritionFacts CLI ---'
    puts ''
  end

  def food_search
    puts 'Please type the name of a food to search:'
    food_name = gets.chomp.gsub(' ', '%20')
    get_food_data(food_name)

    if food_name == 'exit'
      puts 'Thanks for using NutritionFacts CLI!'
      puts ''
    elsif !@food_items.nil?
      which_item
    else
      puts 'That item was not found, please try another search term.'
      puts ''
      NutritionFacts::Item.reset
      food_search
    end
  end

  def get_food_data(food_name)
    @food_items = NutritionFacts::Item.find_by_name(food_name)
  end

  def which_item
    puts ''
    @food_items.each.with_index do |_data, index|
      puts "#{index + 1}. #{@food_items[index].item_name}"
    end

    user_input = nil

    loop do
      puts ''
      puts 'Please enter the number of the food to see more info about that item:'
      user_input = gets.chomp
      break if user_input.to_i.between?(0, @food_items.count)
      puts ''
      puts 'Not sure what you meant, please type the number of the food item.'
    end

    if user_input.to_i.between?(0, @food_items.count)
      display_item(@food_items[user_input.to_i - 1])
    else
      loop_or_quit
    end
  end

  def display_item(food_item_data)
    puts ''
    puts food_item_data.item_name.to_s
    puts '---'
    puts "Calories: #{food_item_data.nf_calories} kcal"
    puts "Total Fat: #{food_item_data.nf_total_fat}g"
    puts "Protein: #{food_item_data.nf_protein}g"
    puts "Dietary Fiber: #{food_item_data.nf_dietary_fiber}g"
    puts "Sugar: #{food_item_data.nf_sugars}g"
    puts "Sodium: #{food_item_data.nf_sodium}mg"
    puts "Vitamin C: #{food_item_data.nf_vitamin_c_dv}%"
    puts "Vitamin A: #{food_item_data.nf_vitamin_a_dv}%"
    puts "Serving Size: #{food_item_data.nf_serving_weight_grams}g"
    loop_or_quit
  end

  def loop_or_quit
    puts ''
    puts 'Please type "other", "search", or "exit".'
    puts ''
    choice = gets.chomp.downcase

    case choice
    when 'other'
      which_item
    when 'search'
      NutritionFacts::Item.reset
      call
    when 'exit'
      puts ''
      puts 'Thanks for using NutritionFacts CLI!'
      puts ''
    else
      puts ''
      puts 'Invalid input. Please try again.'
      loop_or_quit
    end
  end
end
