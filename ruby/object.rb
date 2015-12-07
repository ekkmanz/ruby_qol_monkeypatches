class Object

  def superclasses
    return [] if self.nil?
    x = self.superclass 
    x.superclasses.unshift x
  end
end
