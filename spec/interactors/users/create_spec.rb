require 'rails_helper'

RSpec.describe Users::Create, type: :interactor do
  describe '.run' do
    it 'увеличит количество пользователей на 1' do
      valid_params = {
        params: {
          surname: 'Ivanov',
          name: 'Ivan',
          patronymic: 'Ivanovich',
          email: 'ivan@example.com',
          age: 30,
          nationality: 'Russian',
          country: 'Russia',
          gender: 'male',
          interests: ['Gaming', 'Coding'],
          skills: ['Ruby', 'Rails']
        }
      }

      expect { Users::Create.run(valid_params) }.to change { User.count }.by(1)
    end

    it 'количество пользователей не изменится, когда отсутсвуют необходимые параметры' do
      invalid_params = {
        params: {
          surname: nil,
          name: nil,
          patronymic: 'Ivanovich',
          email: nil,
          age: 30,
          nationality: 'Russian',
          country: 'Russia',
          gender: 'male',
          interests: ['Gaming', 'Coding'],
          skills: ['Ruby', 'Rails']
        }
      }

      result = Users::Create.run(invalid_params)

      expect { result }.not_to change { User.count }
      expect(result.errors.full_messages).to include("Params surname is required")
    end
  end
end
