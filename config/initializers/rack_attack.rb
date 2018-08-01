class Rack::Attack

  # `Rack::Attack` is configured to use the `Rails.cache` value by default,
  # but you can override that by setting the `Rack::Attack.cache.store` value
  # Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new
  #
  #
  # # Allow an IP address to make 100 requests every 1 day
  # throttle('req/ip', limit: 100, period: 1.day) do |req|
  #   req.ip
  # end
  #
  # self.throttled_response = ->(env) {
  #   retry_after = (env['rack.attack.match_data'] || {})[:period]
  #   [
  #     429,
  #     {'Content-Type' => 'application/json', 'Retry-After' => retry_after.to_s},
  #     [{error: "Throttle limit reached. Retry later."}.to_json]
  #   ]
  # }
end
