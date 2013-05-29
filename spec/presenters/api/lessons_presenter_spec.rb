require "spec_helper"

describe Api::LessonsPresenter do
	describe "#as_json" do
	  it "returns lessons hash" do
	 		lesson0 = Lesson.make!(:title => "Lesson Foo")
	 		lesson1 = Lesson.make!(:title => "Lesson Bar")
	    presenter = Api::LessonsPresenter.new([lesson0, lesson1])
	    result = presenter.as_json

	    expect(result[:lessons]).to be_present
	    expect(result[:lessons][0][:title]).to eq("Lesson Foo")
	    expect(result[:lessons][1][:title]).to eq("Lesson Bar")
	    expect(result[:lessons][1][:id]).to eq(lesson1.id)
	  end
	end
end
