class NutritionFacts::CLI

  def call
    @food_data = nil
    start
  end

  def welcome
    system 'clear'
    puts ""
    puts "--------- Welcome to NutritionFacts CLI ---------"
    puts ""
  end

  def start
    food_search
  end

  def food_search
    welcome
    puts "Please type the name of a food to search:"

    food_name = gets.chomp
    get_food_data(food_name)
    which_item

  end

  def get_food_data(food_name)
    @food_data = NutritionFacts::Item.find_by_name(food_name)
    # binding.pry
  end

  def which_item
    puts ""
    puts "1. #{@food_data[0].item_name}"
    puts "2. #{@food_data[1].item_name}"
    puts "3. #{@food_data[2].item_name}"

    user_input = nil

    loop do
    "Please enter 1, 2, or 3, to see more info about that food:"
    user_input = gets.chomp
    break if user_input == "1" || user_input == "2" || user_input == "3"
    puts "Not sure what you meant, please type 1, 2, or 3."
    end

    if user_input == "1"
      display_item_1
    elsif user_input == "2"
      display_item_2
    elsif user_input == "3"
      display_item_3
    else
    loop_or_quit
    end

  end

  def display_item_1
    puts ""
    puts "#{@food_data[0].item_name}"
    puts "---"
    puts "Calories: #{@food_data[0].nf_calories}"
    puts "Total Fat: #{@food_data[0].nf_total_fat}"
    puts "Protein: #{@food_data[0].nf_protein}"
    puts "Dietary Fiber: #{@food_data[0].nf_dietary_fiber}"
    puts "Sugar: #{@food_data[0].nf_sugars}"
    puts "Serving Size: #{@food_data[0].nf_serving_size_qty} #{@food_data[0].nf_serving_size_unit}"
    loop_or_quit
  end

  def display_item_2
    puts ""
    puts "#{@food_data[1].item_name}"
    puts "---"
    puts "Calories: #{@food_data[1].nf_calories}"
    puts "Total Fat: #{@food_data[1].nf_total_fat}"
    puts "Protein: #{@food_data[1].nf_protein}"
    puts "Dietary Fiber: #{@food_data[1].nf_dietary_fiber}"
    puts "Sugar: #{@food_data[1].nf_sugars}"
    puts "Serving Size: #{@food_data[1].nf_serving_size_qty} #{@food_data[1].nf_serving_size_unit}"
    loop_or_quit
  end

  def display_item_3
    puts ""
    puts "#{@food_data[2].item_name}"
    puts "---"
    puts "Calories: #{@food_data[2].nf_calories}"
    puts "Total Fat: #{@food_data[2].nf_total_fat}"
    puts "Protein: #{@food_data[2].nf_protein}"
    puts "Dietary Fiber: #{@food_data[2].nf_dietary_fiber}"
    puts "Sugar: #{@food_data[2].nf_sugars}"
    puts "Serving Size: #{@food_data[2].nf_serving_size_qty} #{@food_data[2].nf_serving_size_unit}"
    loop_or_quit
  end


  def loop_or_quit
    puts ""
    puts 'Please type "pick another", "search", or "exit".'
    choice = gets.chomp.downcase

    case choice
    when 'pick another'
      which_item
    when 'search'
      NutritionFacts::Item.reset
      start
    when 'exit'
      puts ""
      puts 'Thanks for using NutritionFacts CLI!'
      puts ""
    else
      puts ""
      puts 'Invalid input. Please try again.'
      loop_or_quit
    end
  end
end
