# config/initializers/elasticsearch.rb

if File.exists?("config/elasticsearch.yml") && (Rails.env.development? || Rails.env.test?)
    config = YAML.load_file("config/elasticsearch.yml")[Rails.env].symbolize_keys
    Elasticsearch::Model.client = Elasticsearch::Client.new(config)
 end