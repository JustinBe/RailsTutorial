require 'spec_helper'

describe Ticket do
  it { should belong_to(:project) }
  it { should belong_to(:user) }
  it { should allow_mass_assignment_of(:description) }
  it { should allow_mass_assignment_of(:title) }
  it { should allow_mass_assignment_of(:user) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should ensure_length_of(:description).is_at_least(10) }
end
