class Class
  def mixin_ancestors(include_ancestors=true)
    ancestors
        .take_while {|ancestor| include_ancestors || ancestor != superclass }
        .select     {|ancestor| ancestor.instance_of?(Module)               }
  end
end
