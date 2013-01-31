
require 'date'

Gem::Specification.new do |spec|

  spec.name                      = 'singleton_attr'
  spec.rubyforge_project         = 'singleton_attr'
  spec.version                   = '1.0.1'

  spec.summary                   = "Adds methods to declare attribute accessor/reader/writer on singleton instance."
  spec.description               = "Provides :singleton_attr_accessor, :singleton_attr_reader, :singleton_attr_writer, :module_attr_accessor, :module_attr_reader, :module_attr_writer, :class_attr_accessor, :class_attr_reader, :class_attr_writer."

  spec.authors                   = [ 'Asher' ]
  spec.email                     = 'asher@ridiculouspower.com'
  spec.homepage                  = 'http://rubygems.org/gems/singleton_attr'

  spec.required_ruby_version     = ">= 1.9.1"

  spec.date                      = ::Date.today.to_s
  
  spec.files                     = ::Dir[ '{lib,spec}/**/*',
                                          'README*', 
                                          'LICENSE*' ]

end
