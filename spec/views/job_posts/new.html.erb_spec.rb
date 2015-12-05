require 'rails_helper'

RSpec.describe "job_posts/new", type: :view do
  before(:each) do
    assign(:job_post, JobPost.new())
  end

  it "renders new job_post form" do
    render

    assert_select "form[action=?][method=?]", job_posts_path, "post" do
    end
  end
end
