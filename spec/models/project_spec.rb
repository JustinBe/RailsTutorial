require 'spec_helper'

describe Project do
  it { should allow_mass_assignment_of(:name) }
  it { should validate_presence_of(:name) }
  it { should have_many(:tickets).dependent(:delete_all) }
end
