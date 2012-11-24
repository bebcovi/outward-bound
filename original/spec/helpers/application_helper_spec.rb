require 'application_helper'

describe ApplicationHelper do
  it "renders markdown" do
    helper.render_markdown("**Foo**").should == "<p><strong>Foo</strong></p>\n"
  end

  it "previews" do
    helper.preview("Foo bar baz", :characters => 5).should == "Foo bar..."
  end
end
