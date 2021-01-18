class MakeACocktail::Scraper

    def self.scrape_drinks
        @url = "https://www.liquor.com/classic-cocktails-4779424"

        website = Nokogiri::HTML(open(@url))
        drinks = []

        array_of_drinks = website.css("div.loc div.card-list__item")
        
        array_of_drinks.each do |drink|
            drink_name = drink.css("span.card__underline").text.strip
            url = drink.css("a").attr("href").value
            drinks << {name: drink_name, url: url}

            MakeACocktail::Drink.new(drink_name, url)
            # binding.pry
        end
        drinks
    end

    #ingredients_section = doc.css("ul.structured-ingredients__list").text[2,5]
    #   def self.scrape_recipe(drink_url)

    def self.scrape_recipe(drink_url)
        drink_recipe = {}
   
        doc = Nokogiri::HTML(open(drink_url))
        ingredients_section = doc.css("li.structured-ingredients__list-item").text
        ingredients_array = ingredients_section.split("\n")
        no_empty_strings = ingredients_array.reject { |i| i.empty?}
        @first_ingredient = no_empty_strings[0]
        @second_ingredient =  no_empty_strings[1]
        @third_ingredient = no_empty_strings[2]
        @fourth_ingredient = no_empty_strings[3]
        @
        
        binding.pry 
        
    end
    
    # def self.scrape_url
    #     doc = Nokogiri::HTML(open(@url))

    #     links = website.css("div.loc div.card-list__item")
        
    #     links.each do |url|
    #         drink_url = drink.css("a").attr("href").value

    #         MakeACocktail::Drink.new(drink_name, drink_url)
    #         # binding.pry
    #     end
    #     drinks
    # end

end
