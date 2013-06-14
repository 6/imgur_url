require 'spec_helper'

module ImgurUrl
  describe Image do
    shared_examples "with a valid imgur image URL" do
      subject { described_class.new(url) }

      its(:original_url) { should == url }
      its(:image_id) { should == "dhuY8" }
      its(:permalink_url) { should == "http://imgur.com/dhuY8" }
      its(:download_url) { should == "http://imgur.com/download/dhuY8" }
      its(:url) { should == "http://i.imgur.com/dhuY8.jpg" }

      describe "#url" do
        it "returns the direct URL for the given size" do
          subject.url(:original).should == "http://i.imgur.com/dhuY8.jpg"
          subject.url(:huge).should == "http://i.imgur.com/dhuY8h.jpg"
          subject.url(:large).should == "http://i.imgur.com/dhuY8l.jpg"
          subject.url(:medium).should == "http://i.imgur.com/dhuY8m.jpg"
          subject.url(:thumb).should == "http://i.imgur.com/dhuY8t.jpg"
          subject.url(:small).should == "http://i.imgur.com/dhuY8s.jpg"
        end

        context "with an invalid size parameter" do
          it "raises an InvalidSize exception" do
            expect { subject.url(:invalid) }.to raise_error(ImgurUrl::InvalidSize)
          end
        end
      end
    end

    context "a default permalink URL" do
      let(:url) { "http://imgur.com/dhuY8" }
      it_behaves_like "with a valid imgur image URL"
    end

    context "a default permalink URL with query params" do
      let(:url) { "http://imgur.com/dhuY8?tags" }
      it_behaves_like "with a valid imgur image URL"
    end

    context "a direct URL" do
      let(:url) { "http://i.imgur.com/dhuY8.jpg" }
      it_behaves_like "with a valid imgur image URL"
    end

    context "a gallery URL" do
      let(:url) { "http://imgur.com/gallery/dhuY8" }
      it_behaves_like "with a valid imgur image URL"
    end

    context "a download URL" do
      let(:url) { "http://imgur.com/download/dhuY8" }
      it_behaves_like "with a valid imgur image URL"
    end
  end
end
