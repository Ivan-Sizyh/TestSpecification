class User < ApplicationRecord
  has_many :interest_users, dependent: :destroy
  has_many :interests, through: :interest_users

  has_many :skill_users, dependent: :destroy
  has_many :skills, through: :skill_users

  # Вынес валидации в модель так как не считаю, что
  # валидациями стоит перегружать интерактор
  validates :surname, presence: true
  validates :name, presence: true
  validates :patronymic, presence: true
  validates :nationality, presence: true
  validates :country, presence: true
  validates :email, presence: true,
                    uniqueness: true
  validates :age, presence: true,
                  numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 90 }
  validates :gender, presence: true,
                     inclusion: { in: %w[male female] }
end
