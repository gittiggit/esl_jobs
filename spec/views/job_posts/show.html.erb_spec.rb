require 'rails_helper'

RSpec.describe "job_posts/show", type: :view do
  before(:each) do
    @job_post = assign(:job_post, JobPost.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
