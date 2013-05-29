require "spec_helper"

describe Api::LessonPresenter do
	let(:image) { uploaded_file("test.jpg", "image/jpeg") }

	describe "#as_json" do
		it "returns lesson hash" do
			lesson = Lesson.make!(:title => "Some Title", :image => image)
			presenter = Api::LessonPresenter.new(lesson)
			result = presenter.as_json

			expect(result[:lesson]).to be_present
			expect(result[:lesson][:title]).to eq("Some Title")
			expect(result[:lesson][:id]).to eq(lesson.id)
			expect(result[:lesson][:image_thumb_url]).to match(/thumb\/test\.jpg/)
			expect(result[:lesson][:image_medium_url]).to match(/medium\/test\.jpg/)
			expect(result[:lesson][:image_large_url]).to match(/large\/test\.jpg/)
		end
	end
end
