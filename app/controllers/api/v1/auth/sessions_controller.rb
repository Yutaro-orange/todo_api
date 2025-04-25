class Api::V1::Auth::SessionsController < DeviseTokenAuth::SessionsController
    def create
      super do |resource|
        if resource.errors.empty?
          auth_token = resource.create_new_auth_token
          @resource_json = resource.token_validation_response.merge({
            'access-token': auth_token['access-token'],
            client: auth_token['client'],
            uid: auth_token['uid']
          })
        end
      end
    end
end
  