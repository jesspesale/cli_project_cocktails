class MakeACocktail::Scraper

    def self.scrape_drinks
        url = "https://www.liquor.com/classic-cocktails-4779424"

        website = Nokogiri::HTML(open(url))

        array_of_drinks = website.css("div.loc div.card-list__item")
        
        array_of_drinks.each do |drink|
            drink_name = drink.css("span.card__underline").text.strip
            url = drink.css("a").attr("href").value
            MakeACocktail::Drink.new(drink_name, url)
        end
    end

    def self.scrape_ingredients(drink_url)
        drink_recipe = {}
   
        doc = Nokogiri::HTML(open(drink_url))

        if drink_url == "https://www.liquor.com/parisian-blonde-cocktail-recipe-5091868"
            ingredients_section = doc.css("li.structured-ingredients__list-item").text
            ingredients_array = ingredients_section.split("\n")
            ingredients_with_no_empty_strings = ingredients_array.reject { |i| i.empty?}
            # binding.pry
            ingredients_with_no_empty_strings[-2] = ingredients_with_no_empty_strings[-2] + " " + ingredients_with_no_empty_strings[-1]
            ingredients_with_no_empty_strings.pop
            ingredients_with_no_empty_strings
        else 
            ingredients_arr = doc.css("li.simple-list__item").text.split("\n")
            ingredients = ingredients_arr.reject{ |i| i.empty?}
            # binding.pry
            ingredients
        end     
    end

end
