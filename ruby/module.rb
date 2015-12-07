class Module
  # List all of its sub modules inside its "namespace".
  def all_the_modules
    result = Set.new 
    queue = Queue.new
    queue << self

    while !queue.empty? 
      current = queue.pop 
      result << current
      submodules = Set.new(current.constants)
          .map    { |const| current.const_get(const) }
          .select { |const| const.is_a?(Module) && const.to_s.start_with?(self.to_s) }
      submodules = Set.new(submodules) - result
      submodules.each { |e| queue.push e }
    end
    result - [self]
  end

  # Akin to #all_the_modules but list classes instead.
  def all_the_classes
    all_the_modules.select { |x| x.is_a? Class }
  end
end
