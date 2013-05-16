# extend String class to make new method called "shout"

class String

  def shout
    self.upcase
  end

  def shout!
    self.upcase!
  end

end