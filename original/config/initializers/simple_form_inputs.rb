Dir["#{Rails.root}/app/inputs/**/*.rb"].each do |input_file|
  require input_file
end
