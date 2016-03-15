require 'rails_helper'


RSpec.feature "Content check", :type => :feature do

  subject {page}

  describe "signup page" do
    before {visit signup_path}
    it { should have_selector('h1', text: 'Sign up') }
    it { should have_title(full_title('Sign up')) }
  end

end
