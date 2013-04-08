module Ecm
  module UserArea
    class Routing
      def self.routes(router, options = {})
        options.reverse_merge!({})

        # router.resources :posts, :controller => 'ecm/user_area/posts'
      end
    end
  end
end

