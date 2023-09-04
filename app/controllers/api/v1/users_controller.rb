class Api::V1::UsersController < ApplicationController
  def index
    users = User.includes(:posts => :comments).all
    json_data = users.to_json(
      :include => {
        :posts => {
          :include => :comments
        }
      },
      # :except => [:created_at, :updated_at]
    )
    pretty_json = JSON.pretty_generate(JSON.parse(json_data))
    render json: pretty_json, status: :ok
  end
end
