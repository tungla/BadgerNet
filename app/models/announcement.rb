# announcement model
# checkbox validation code reference: http://www.humbug.in/2010/ruby-on-rails-validate-atleast-one-checkbox-is-checked-in-a-form/
class Announcement < ApplicationRecord
  extend Scoping::Retrieve
  include Scoping::Scopey
  validate :atleast_one_is_checked

  private

  def atleast_one_is_checked
    errors.add(:base, 'Select at least one output format type') unless email || sms
  end
end
