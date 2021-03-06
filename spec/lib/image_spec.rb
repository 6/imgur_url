require 'spec_helper'

module ImgurUrl
  describe Image do
    shared_examples "with a valid imgur image URL" do
      its(:id) { should == "dhuY8" }
      its(:permalink_url) { should == "http://imgur.com/dhuY8" }
      its(:download_url) { should == "http://imgur.com/download/dhuY8" }
      its(:url) { should == "http://i.imgur.com/dhuY8.jpg" }

      describe "#url" do
        it "returns the direct URL for the given size" do
          subject.url(:original).should == "http://i.imgur.com/dhuY8.jpg"
          subject.url(:huge).should == "http://i.imgur.com/dhuY8h.jpg"
          subject.url(:large).should == "http://i.imgur.com/dhuY8l.jpg"
          subject.url(:medium).should == "http://i.imgur.com/dhuY8m.jpg"
          subject.url(:box).should == "http://i.imgur.com/dhuY8b.jpg"
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
      subject { described_class.new("http://imgur.com/dhuY8") }
      it_behaves_like "with a valid imgur image URL"
    end

    context "a default permalink URL with query params" do
      subject { described_class.new("http://imgur.com/dhuY8?tags") }
      it_behaves_like "with a valid imgur image URL"
    end

    context "a direct URL" do
      subject { described_class.new("http://i.imgur.com/dhuY8.jpg") }
      it_behaves_like "with a valid imgur image URL"
    end

    context "a download URL" do
      subject { described_class.new("http://imgur.com/download/dhuY8") }
      it_behaves_like "with a valid imgur image URL"
    end

    describe ".from_id" do
      subject { described_class.from_id('dhuY8') }
      it_behaves_like "with a valid imgur image URL"
    end

    shared_examples "with an invalid URL" do
      it "raises an InvalidUrl error on initialization" do
        expect { described_class.new(url) }.to raise_error(ImgurUrl::InvalidUrl)
      end
    end

    %w[
      http://imgur.com/a/CrSqu
      http://imgur.com/blog
      http://imgur.com/blog/2013/06/11/tech-tuesday-real-time-messaging/
      http://imgur.com/user/alan
      http://imgur.com/new/time
      http://imgur.com/removalrequest
      http://imgur.com/gallery
      https://imgur.com/signin
    ].each do |url|
      context "with the non-image imgur url: #{url}" do
        let(:url) { url }
        it_behaves_like "with an invalid URL"
      end
    end

    context "with a non-imgur URL" do
      let(:url) { "http://google.com" }
      it_behaves_like "with an invalid URL"
    end
  end
end
