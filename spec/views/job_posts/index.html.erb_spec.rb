require 'rails_helper'

RSpec.describe "job_posts/index", type: :view do
  before(:each) do
    assign(:job_posts, [
      JobPost.create!(),
      JobPost.create!()
    ])
  end

  it "renders a list of job_posts" do
    render
  end
end
