class Users::Create < ActiveInteraction::Base
  hash :params do
    string :surname
    string :name
    string :patronymic
    string :email
    integer :age
    string :nationality
    string :country
    string :gender
    array :interests, :skills, default: []
  end

  def execute
    User.transaction do
      user = User.new(user_params.merge(full_name: user_full_name))
      load_interests(user)
      load_skills(user)
      user.save!

      user
    end
  end

  private

  def user_params = params.except("interests", "skills")

  def user_full_name = "#{params['surname']} #{params['name']} #{params['patronymic']}"

  def load_interests(user) = user.interests = Interest.where(name: params["interests"])

  def load_skills(user) = user.skills = Skill.where(name: params["skills"])
end
