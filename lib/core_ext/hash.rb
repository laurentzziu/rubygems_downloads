# frozen_string_literal: true

class Hash
  # File activesupport/lib/active_support/core_ext/hash/slice.rb, line 21
  def slice(*keys)
    keys.map! { |key| convert_key(key) } if respond_to?(:convert_key, true)
    keys.each_with_object(self.class.new) { |k, hash| hash[k] = self[k] if key?(k) }
  end
end
