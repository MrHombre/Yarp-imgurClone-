module Features
  def create_post(post_title, image_url)
    visit 'posts/new'
    fill_in 'Title', :with => post_title
    fill_in 'Image Url', :with => image_url
    click_on 'Submit'
  end
end
