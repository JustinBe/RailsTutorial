require 'spec_helper'

describe User do
  it do
    should allow_mass_assignment_of(:email)
    should allow_mass_assignment_of(:password)
    should allow_mass_assignment_of(:password_confirmation)
    should allow_mass_assignment_of(:remember_me)
    should allow_mass_assignment_of(:admin)
  end
end
