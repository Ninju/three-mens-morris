Bundler.require(:test)

Dir['./lib/**/*.rb'].each do |file|
  require file
end
