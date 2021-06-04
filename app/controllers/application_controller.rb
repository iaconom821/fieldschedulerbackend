class ApplicationController < ActionController::API
    before_action :authorized

    def encode_token(payload)
      JWT.encode(payload, 'yourSecret')
    end
  
    def auth_header
      # { Authorization: 'Bearer <token>' }
      request.headers['Authorization']
    end
  
    def decoded_token
      if auth_header
        token = auth_header.split(' ')[1]
        # header: { 'Authorization': 'Bearer <token>' }
        begin
          JWT.decode(token, 'yourSecret', true, algorithm: 'HS256')
        rescue JWT::DecodeError
          nil
        end
      end
    end

    def logged_in_player
        if decoded_token
          player_id = decoded_token[0]['player_id']
          @player = Player.find_by(id: player_id)
        end
      end
    
      def logged_in?
        !!logged_in_player
      end

      def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
      end

      def unauthorized
        render json: { message: 'Unauthorized' }, status: :unauthorized
      end
  
end
