class NutritionFacts::CLI
  def call
    food_search
  end

  def food_search
    system 'clear'
    puts ''
    puts '--- Welcome to NutritionFacts CLI ---'
    puts ''
    puts 'Please type the name of a food to search:'

    food_name = gets.chomp.gsub(' ', '%20')
    if food_name == 'exit'
      puts ''
      puts 'Thanks for using NutritionFacts CLI!'
      puts ''
    else
      get_food_data(food_name)
      which_item
    end
  end

  def get_food_data(food_name)
    @food_data = NutritionFacts::Item.find_by_name(food_name)
  end

  def which_item
    puts ''
    puts "1. #{@food_data[0].item_name}"
    puts "2. #{@food_data[1].item_name}"
    puts "3. #{@food_data[2].item_name}"
    puts ''

    user_input = nil

    loop do
      'Please enter 1, 2, or 3, to see more info about that food:'
      user_input = gets.chomp
      break if user_input == '1' || user_input == '2' || user_input == '3'
      puts 'Not sure what you meant, please type 1, 2, or 3.'
    end

    if user_input == '1'
      display_item(@food_data[user_input.to_i-1])
    elsif user_input == '2'
      display_item(@food_data[user_input.to_i-1])
    elsif user_input == '3'
      display_item(@food_data[user_input.to_i-1])
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
