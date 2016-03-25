module ApplicationHelper

  def full_title(page_title)
    base_title = "RDJ Blog"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def log_in(user)
    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    #login when not using capybara as well. have to come back and look at this
    #because it looks like it's only avaliable in the controllers spec
    #cookies[:remember_token] = user.remember_token
  end
end
