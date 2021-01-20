class MakeACocktail::Drink

      @@all = []

      attr_accessor :name, :url, :recipe
      attr_writer :ingredients

      def initialize(name, url)
         @name = name
         @url = url
         save
      end

      def self.all
         MakeACocktail::Scraper.scrape_drinks if @@all.empty?
         @@all
      end

      def save
         @@all << self
      end
      
   end















   
   # def self.ingredients(chosen_drink)
   #    # binding.pry
   #    @drinks.each_with_index do |drink, index| 
   #       @drink_url = drink.url
   #       @index = index

   #   end
   #    MakeACocktail::Scraper.scrape_recipe(self) if ingredients.empty?
   #    @ingredients
   # end