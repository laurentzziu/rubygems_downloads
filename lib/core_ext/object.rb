# frozen_string_literal: true

class Object
  def present?
    return false if nil?

    respond_to?(:empty?) ? !empty? : !blank?
  end
end
