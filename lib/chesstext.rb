require_relative 'string.rb'

# Contains all the output for Chess.
class ChessText
  def self.invalid_promotion
    print "\n That doesn't appear to be something you can promote a pawn to.. Try again:\n> "
  end
end
