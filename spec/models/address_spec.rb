require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Address do
  fixtures :all

  it { Address.should belong_to(:addressable) }
  
  # should_require_unique_attributes :title, :scoped_to => [:addressable_id, :addressable_type]
  # should_ensure_length_at_least :zip, 5
  # should_only_allow_numeric_values_for :zip
end
