class BasePresenter
  def initialize(object, template)
    @object = object
    @template = template
  end

  def self.presents(name)
    define_method(name) do
      @object
    end
  end

  def method_missing(*args, &block)
    @template.send(*args, &block)
  end

  private

  def l(*args)
    I18n.l(*args)
  end

  def t(*args)
    I18n.t(*args)
  end
end
