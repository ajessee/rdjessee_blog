module ApplicationHelper

  include StoriesHelper
  
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

  def ga_script
    tracking_id = "UA-98485844-1"
    if Rails.env.production?
      javascript_tag("(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','//www.google-analytics.com/analytics.js','ga');ga('create', '#{tracking_id}', 'auto');")
    end
  end

  def ga_track
    javascript_tag("if(window.ga != undefined){ga('send', 'pageview');}")
  end
end
