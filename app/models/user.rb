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
  validates :email, presence: true
  validates :age, presence: true
  validates :nationality, presence: true
  validates :country, presence: true
  validates :gender, presence: true
  validates :email, uniqueness: true
  validates :age, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 90 }
  validates :gender, inclusion: { in: %w[male female] }
end
