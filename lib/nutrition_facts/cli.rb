class NutritionFacts::CLI
  def call
    welcome
    food_search
  end

  def welcome
    system 'clear'
    puts ' '
    puts '--- Welcome to NutritionFacts CLI ---'
    puts ''
  end

  def food_search
    puts 'Please type the name of a food to search:'
    puts ''
    food_name = gets.chomp.gsub(' ', '%20')
    if food_name == 'exit'
      puts ''
      puts 'Thanks for using NutritionFacts CLI!'
      puts ''
      Kernel.abort
    else
      get_food_data(food_name)
    end
  end

  def get_food_data(food_name)
    @food_items = NutritionFacts::Item.find_by_name(food_name)
    which_item
  end

  def which_item
    if @food_items.empty?
      puts ''
      puts 'That item was not found, please try another search term.'
      puts ''
      food_search
    else
      puts ''
      @food_items.each.with_index do |_data, index|
        puts "#{index + 1}. #{@food_items[index].item_name}"
      end
      puts ''
      puts 'Please enter the number of the food to see more info about that item:'
    end

    user_input = gets.chomp.downcase

    if user_input == 'exit'
      puts ''
      puts 'Thanks for using NutritionFacts CLI!'
      puts ''
      Kernel.abort
    elsif user_input.to_i.between?(1, @food_items.count)
      display_item(@food_items[user_input.to_i - 1])
      loop_or_quit
    else
      puts ''
      puts 'Not sure what you meant, please type the number of the food item.'
      which_item
    end
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
      call
    when 'exit'
      puts ''
      puts 'Thanks for using NutritionFacts CLI!'
      puts ''
      Kernel.abort
    else
      puts ''
      puts 'Invalid input. Please try again.'
      loop_or_quit
    end
  end

  def display_item(food_item_data)
    puts ''
    puts food_item_data.item_name.to_s
    puts '---'
    puts "Serving Size: #{food_item_data.nf_serving_size_qty} #{food_item_data.nf_serving_size_unit}" unless food_item_data.nf_serving_size_unit.nil?
    puts "Serving Weight: #{food_item_data.nf_serving_weight_grams}g" unless food_item_data.nf_serving_weight_grams.nil?
    puts "Calories: #{food_item_data.nf_calories} kcal" unless food_item_data.nf_calories.nil?
    puts "Calories from fat: #{food_item_data.nf_calories_from_fat} kcal" unless food_item_data.nf_calories_from_fat.nil?
    puts "Total Fat: #{food_item_data.nf_total_fat}g" unless food_item_data.nf_total_fat.nil?
    puts "Saturated Fat: #{food_item_data.nf_saturated_fat}g" unless food_item_data.nf_saturated_fat.nil?
    puts "Cholesterol: #{food_item_data.nf_cholesterol}mg" unless food_item_data.nf_cholesterol.nil?
    puts "Protein: #{food_item_data.nf_protein}g" unless food_item_data.nf_protein.nil?
    puts "Total Carbohydrates: #{food_item_data.nf_total_carbohydrate}g" unless food_item_data.nf_total_carbohydrate.nil?
    puts "Sugar: #{food_item_data.nf_sugars}g" unless food_item_data.nf_sugars.nil?
    puts "Dietary Fiber: #{food_item_data.nf_dietary_fiber}g" unless food_item_data.nf_dietary_fiber.nil?
    puts "Sodium: #{food_item_data.nf_sodium}mg" unless food_item_data.nf_sodium.nil?
    puts "Vitamin C: #{food_item_data.nf_vitamin_c_dv}%" unless food_item_data.nf_vitamin_c_dv.nil?
    puts "Vitamin A: #{food_item_data.nf_vitamin_a_dv}%" unless food_item_data.nf_vitamin_a_dv.nil?
    puts "Calcium: #{food_item_data.nf_calcium_dv}%" unless food_item_data.nf_calcium_dv.nil?
    puts "Iron: #{food_item_data.nf_iron_dv}%" unless food_item_data.nf_iron_dv.nil?
    loop_or_quit
  end
end
