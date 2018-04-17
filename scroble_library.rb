class ScrobleLibrary
  
  def self.get_score(language, letter)
    # Check if english or spanish -- might not be neccessary
    if (language == :english || language == :spanish)
      if language.eql?(:english) 
        dictionary = {}
        %w[A E I O U L N R S T].each {|i| dictionary[i] = 1}
        %w[D G].each {|i| dictionary[i] = 2}
        %w[B C M P].each {|i| dictionary[i] = 3}
        %w[F H V W Y].each {|i| dictionary[i] = 4}
        %w[K].each {|i| dictionary[i] = 5}
        %w[J X].each {|i| dictionary[i] = 8}
        %w[Q Z].each {|i| dictionary[i] = 10}
        
      else
        dictionary = {}
        %w[A E O U S I U N L R T].each {|i| dictionary[i] = 1}
        %w[C D G].each {|i| dictionary[i] = 2}
        %w[B M P].each {|i| dictionary[i] = 3}
        %w[F H V Y].each {|i| dictionary[i] = 4}
        %w[J].each {|i| dictionary[i] = 6}
        %w[K LL Ñ Q RR W X].each {|i| dictionary[i] = 8}
        %w[Z].each {|i| dictionary[i] = 10}
      end
      
    else
      return "Enter English or Spanish"
    end
    
    # return value if key/letter is valid, otherwise return 0
    if dictionary.key?(letter)
      dictionary[letter]
    else 
      0
    end

  end
end

    