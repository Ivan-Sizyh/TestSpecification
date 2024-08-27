class UsersController < ApplicationController
  def create
    outcome = Users::Create.run(params: user_params)
    if outcome.valid?
      render json: outcome.result, status: :created
    else
      render json: outcome.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:surname, :name, :patronymic, :email, :age, :nationality, :country, :gender, interests: [], skills: [])
  end
end
