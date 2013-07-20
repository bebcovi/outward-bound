Text.delete_all

texts = [
  ["home", "index"],

  ["courses", "index"],

  ["about", "index"],
  ["about", "what"],
  ["about", "international"],
  ["about", "support"],
  ["about", "safety"],
  ["about", "locations"],
]

texts.each do |controller, action|
  Text.new(controller: controller, action: action).save(validate: false)
end
