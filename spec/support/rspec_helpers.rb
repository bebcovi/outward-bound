module RSpecHelpers
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
    require "active_record"
    require "nulldb"
    NullDB.nullify(schema: "#{::ROOT}/db/schema.rb")
  end

  def teardown_nulldb
    NullDB.restore
  end

  def login_as(user)
    visit login_path
    fill_in "Korisničko ime", with: user.username
    fill_in "Lozinka",        with: user.password
    click_on "Prijava"
  end

  module ClassMethods
    def use_nulldb
      before(:all) { setup_nulldb }
      after(:all)  { teardown_nulldb }
    end
  end
end
