# A user is a user of the application, default devise class
class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable
  validates :first_name, :last_name, :phone, presence: true
  validates :phone, format: { with: /\d{10}/,
                              message: 'Please enter a 10 digit US Phone Number' }

  def coach?
    has_role? :coach
  end

  def delete_role(role)
    begin
      remove_role role
    # rubocop:disable Lint/HandleExceptions
    rescue ActiveRecord::HasManyThroughAssociationNotFoundError
    end
    # rubocop:enable Lint/HandleExceptions
    !has_role?(role)
  end
end
