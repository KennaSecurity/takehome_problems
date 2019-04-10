class Language
   attr_reader :language_table
  
  # Hash object containing language letter-value pairs
  Languages = {
    :spanish => {
      %w[A E O S I U N L R T] => 1,
      %w[C D G] => 2,
      %w[B M P] => 3,
      %w[F H V Y] => 4,
      %w[J] => 6,
      %w[K LL Ñ Q RR W X] => 8,
      %w[Z] => 10
    }.freeze,
    :english  => {
      %w[E A I O N R T L S U] => 1,
      %w[D G] => 2,
      %w[B C M P] => 3,
      %w[F H V W Y] => 4,
      %w[K] => 5,
      %w[J X] => 8,
      %w[Q Z] => 10
    }.freeze
  }.freeze

  # Initializer, instantiating new Language instance containing relevant point table
  def initialize(language)
    @language_table = Languages[language]
  end

  # Get method allows Scoring instantiation to access relevant language hash
  def get
    self.language_table
  end
  
end