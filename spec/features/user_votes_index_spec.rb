require 'rails_helper'

feature 'user votes for a post' do
  scenario 'upvote' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit root_path
    create_post('first post', 'imgur.com')
    expect(page.current_path).to eq root_path

    find('.up').click

    expect(page).to have_content '1 points'
  end

  scenario 'downvote' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit root_path
    create_post('first post', 'imgur.com')
    expect(page.current_path).to eq root_path

    find('.down').click

    expect(page).to have_content '0 points'
  end
end
