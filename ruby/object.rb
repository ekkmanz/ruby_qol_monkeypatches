class Object

  def marshall_clone
    Marshal.load( Marshal.dump(self) )
  end

  def ensure_array
    (self.is_a? Array) ? self : [self]
  end

  def first_or_self
    (self.is_a? Array) ? first : self
  end

  def last_or_self
    (self.is_a? Array) ? last  : self
  end

  def superclasses
    return [] if self.nil?
    x = self.superclass 
    x.superclasses.unshift x
  end
end
