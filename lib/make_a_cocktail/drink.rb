class MakeACocktail::Drink

      @@all = []

      attr_accessor :name, :url, :ingredients, :recipe

      def initialize(name, url)
         @name = name
         @url = url
         save
      #   drink_hash.each do |drink, url|
      #   end
      end

      def self.all
         MakeACocktail::Scraper.scrape_drinks if @@all.empty?
         # binding.pry
         @@all
      end

      def save
         @@all << self
      end

      def info(drink)
        #shows drinks ingredients and recipe
      end




end