
require_relative '../lib/singleton_attr.rb'

describe ::SingletonAttr do
  
  shared_examples_for :singleton do
    it '#singleton_attr_accessor declares attr_accessor on singleton' do
      instance.singleton_attr_accessor :accessor
      instance.accessor.should be nil
      instance.accessor = :value
      instance.accessor.should be :value
    end
    it '#singleton_attr_reader declares attr_reader on singleton' do
      instance.singleton_attr_reader :reader
      instance.reader.should be nil
      instance.instance_variable_set( :@reader, :value )
      instance.reader.should be :value
      instance.respond_to?( :reader= ).should be false
    end
    it '#singleton_attr_writer declares attr_writer on singleton' do
      instance.singleton_attr_writer :writer
      instance.instance_variable_get( :@writer ).should be nil
      instance.writer = :value
      instance.instance_variable_get( :@writer ).should be :value
      instance.respond_to?( :writer ).should be false
    end
    it '#alias_singleton_method aliases a method defined for singleton' do
      instance.define_singleton_method( :some_method ) { puts 'method body' }
      instance.alias_singleton_method( :other_method_name, :some_method )
      instance.respond_to?( :other_method_name ).should be true
    end
  end

  context 'Module' do
    let( :instance ) { ::Module.new }
    it_behaves_like :singleton
    it 'aliases #singleton_attr_accessor to #module_attr_accessor' do
      instance.method( :module_attr_accessor ).should == instance.method( :singleton_attr_accessor )
    end
    it 'aliases #singleton_attr_reader to #module_attr_reader' do
      instance.method( :module_attr_reader ).should == instance.method( :singleton_attr_reader )
    end
    it 'aliases #singleton_attr_writer to #module_attr_writer' do
      instance.method( :module_attr_writer ).should == instance.method( :singleton_attr_writer )
    end
    it 'aliases #alias_singleton_method to #alias_module_method' do
      instance.method( :alias_module_method ).should == instance.method( :alias_singleton_method )
    end
  end

  context 'Class' do
    let( :instance ) { ::Class.new }
    it_behaves_like :singleton
    it 'aliases #singleton_attr_accessor to #class_attr_accessor' do
      instance.method( :module_attr_accessor ).should == instance.method( :singleton_attr_accessor )
    end
    it 'aliases #singleton_attr_reader to #class_attr_reader' do
      instance.method( :class_attr_reader ).should == instance.method( :singleton_attr_reader )
    end
    it 'aliases #singleton_attr_writer to #class_attr_writer' do
      instance.method( :class_attr_writer ).should == instance.method( :singleton_attr_writer )
    end
    it 'aliases #alias_singleton_method to #alias_class_method' do
      instance.method( :alias_class_method ).should == instance.method( :alias_singleton_method )
    end
  end
  
end
