module Validatable
  extend ActiveSupport::Concern

  included do
    def self.valid_attribute?(attr, value)
      mock = self.new(attr => value)

      return !mock.errors.key?(attr) unless mock.valid?
    end
  end
end
