module SpecHelpers
  def self.included(base)
    base.extend(ClassMethods)
  end

  def benchmark(name, &block)
    start = Time.now
    result = yield
    puts "#{name} (#{Time.now - start}s)"
    result
  end

  def setup_nulldb
    require "nulldb"
    NullDB.nullify(schema: "#{::ROOT}/db/schema.rb")
  end

  def teardown_nulldb
    NullDB.restore
  end

  module ClassMethods
    def use_nulldb
      before(:all) { setup_nulldb }
      after(:all)  { teardown_nulldb }
    end
  end
end
