require 'dotenv/tasks'

namespace :jekyll do
  namespace :cloudflare do

    desc "Purge the CloudFlare cache"
    task :purge_cache => :dotenv do
      %w[ CLOUDFLARE_API_TOKEN CLOUDFLARE_ZONE ].each do |var_name|
        unless ENV.key?(var_name)
          warn("Please provide #{var_name}")
          exit(1)
        end
      end
      puts "Purging CloudFlare cache..."
      system(%Q{curl -X POST "https://api.cloudflare.com/client/v4/zones/${CLOUDFLARE_ZONE}/purge_cache" \
          -H "Authorization: Bearer ${CLOUDFLARE_API_TOKEN}" \
          -H "Content-Type: application/json" \
          --data '{"purge_everything":true}'})
    end
  end

end
