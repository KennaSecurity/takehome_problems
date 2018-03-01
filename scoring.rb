# frozen_string_literal: true

class Scoring

  def initialize(lang)
    @language = lang.downcase   # Account for capitalization in language input
  end

  # Added setLang function for if user doesn't want to re-initialize the class for every
  def setLang(lang)
    @language = lang.downcase
  end

  # Added getLang function to check what current language is
  def getLang()
    return @language
  end

  def score_letter(letter)
    letter = letter.upcase
    if @language == :english
      # Switched to case vs. if-elsif block due to slightly faster runtime on test-cases and ease of reading
      case
      when %w[A E I O U L N R S T].include?(letter)
        1
      when %w[D G].include?(letter)
        2
      when %w[B C M P].include?(letter)
        3
      when %w[F H V W Y].include?(letter)
        4
      when %w[K].include?(letter)
        5
      when %w[J X].include?(letter)
        8
      when %w[Q Z].include?(letter)
        10
      else
        puts "Invalid Character"      # Tells user that character is not included in set
        0
      end
    elsif @language == :spanish
      case
      when %w[A E O S I U N L R T].include?(letter)
        1
      when %w[C D G].include?(letter)
        2
      when %w[B M P].include?(letter)
        3
      when %w[F H V Y].include?(letter)
        4
      when %w[J].include?(letter)
        6
      when %w[K LL Ñ Q RR W X].include?(letter)
        8
      when %w[Z].include?(letter)
        10
      else
        puts "Invalid Character"      # Tells user that character is not included in set
        0
      end
    else
      puts 'Language input invalid'   # Tells user that language input is invalid
      return 0
    end
  end
end
