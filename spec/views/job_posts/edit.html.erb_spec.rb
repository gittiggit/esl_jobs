require 'rails_helper'

RSpec.describe "job_posts/edit", type: :view do
  before(:each) do
    @job_post = assign(:job_post, JobPost.create!())
  end

  it "renders the edit job_post form" do
    render

    assert_select "form[action=?][method=?]", job_post_path(@job_post), "post" do
    end
  end
end
