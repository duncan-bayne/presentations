['src'].each do |path|
  Dir.glob(File.expand_path(File.join(path, '**', '*.rb'))).each { |file| require file }
end

RSpec.configure do |config|
  config.raise_errors_for_deprecations!
end
