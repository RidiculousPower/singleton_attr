
###
# Adds methods to declare attribute accessors/readers/writers on singletons. 
#
module ::SingletonAttr
  
  #############################
  #  singleton_attr_accessor  #
  #############################
  
  ###
  # Define an attribute accessor on the singleton of instance for which method is called.
  #
  # @overload singleton_attr_accessor( name, ... )
  #
  #   @param [Symbol,String] name
  #
  #                          Name for reader method.
  # 
  # @return [Module,Class] Self.
  #
  def singleton_attr_accessor( *names )
    
    singleton_class.instance_eval { attr_accessor *names }
    
    return self
    
  end

  ###########################
  #  singleton_attr_reader  #
  ###########################
  
  ###
  # Define an attribute reader on the singleton of instance for which method is called.
  #
  # @overload singleton_attr_reader( name, ... )
  #
  #   @param [Symbol,String] name
  #
  #                          Name for reader method.
  # 
  # @return [Module,Class] Self.
  #
  def singleton_attr_reader( *names )

    singleton_class.instance_eval { attr_reader *names }
    
    return self

  end

  ###########################
  #  singleton_attr_writer  #
  ###########################
  
  ###
  # Define an attribute writer on the singleton of instance for which method is called.
  #
  # @overload singleton_attr_writer( name, ... )
  #
  #   @param [Symbol,String] name
  #
  #                          Name for reader method.
  # 
  # @return [Module,Class] Self.
  #
  def singleton_attr_writer( *names )

    singleton_class.instance_eval { attr_writer *names }
    
    return self

  end
  
  ############################
  #  alias_singleton_method  #
  ############################
  
  def alias_singleton_method( alias_name, method_name )

    singleton_class.instance_eval { alias_method alias_name, method_name }
    
    return self

  end
  
end

###
# Add aliases to substitute module prefix for singleton prefix. 
#
module ::SingletonAttr::Module
  
  include ::SingletonAttr
  
  alias_method :module_attr_accessor, :singleton_attr_accessor
  alias_method :module_attr_reader,   :singleton_attr_reader
  alias_method :module_attr_writer,   :singleton_attr_writer

  alias_method :alias_module_method,   :alias_singleton_method
  
end

###
# Add aliases to substitute class prefix for singleton prefix. 
#
module ::SingletonAttr::Class

  include ::SingletonAttr
  
  alias_method :class_attr_accessor, :singleton_attr_accessor
  alias_method :class_attr_reader,   :singleton_attr_reader
  alias_method :class_attr_writer,   :singleton_attr_writer

  alias_method :alias_class_method,   :alias_singleton_method

end

class ::Module
  include ::SingletonAttr::Module
end

class ::Class
  include ::SingletonAttr::Class
end
