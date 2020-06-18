# frozen_string_literal: true

module NormalizeParamsConcern
  extend ActiveSupport::Concern

  # rubocop:disable Metrics/MethodLength
  def deep_underscore_params!
    underscore_hash = lambda do |hash|
      hash.transform_keys!(&:underscore)
      hash.each do |_, value|
        if value.is_a?(ActionController::Parameters)
          underscore_hash.call(value)
        elsif value.is_a?(Array)
          value.each do |item|
            next unless item.is_a?(ActionController::Parameters)

            underscore_hash.call(item)
          end
        end
      end
    end
    underscore_hash.call(params)
  end
  # rubocop:enable Metrics/MethodLength
end
