class BasePresenter
  def initialize(object, template)
    @object = object
    @template = @t = template
  end

  def self.presents(name)
    define_method(name) do
      @object
    end
  end

  def method_missing(method, *args, &block)
    @object.send(method, *args, &block)
  end
end
