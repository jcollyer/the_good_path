require 'spec_helper'

describe Api::LessonsController do
	let!(:lesson) { Lesson.make!(:title => "Foo Title") }
	let(:image) { uploaded_file("test.jpg", "image/jpeg") }

	# Note: This could be moved to spec_helper so that it could be used everywhere.
	def decoded_body
		# ActiveSupport::JSON.decode turns a json string back into a ruby hash.
		ActiveSupport::JSON.decode(response.body)
	end

	describe "GET to :index" do
		before do
			get :index
		end

		it "responds ok" do
			expect(response).to be_ok
		end

		it "returns lessons json" do
			expect(decoded_body["lessons"]).to be_present
		end
	end

	describe "GET to :show" do
		before do
			get :show, :id => lesson.id
		end

		it "responds ok" do
			expect(response).to be_ok
		end

		it "returns lesson hash" do
			expect(decoded_body["lesson"]).to be_present
		end
	end

	describe "POST to :create" do
		def create_lesson
			post :create, :lesson => {:title => "Foo Title", :summary => "Foo Summary", :image => image}
		end

		it "responds created" do
			create_lesson
			expect(response.status).to eq(201)
		end

		it "creates lesson" do
			expect { create_lesson }.to change { Lesson.count }.by(1)
		end

		it "returns lesson hash" do
			create_lesson
			expect(decoded_body["lesson"]).to be_present
		end

		it "saves image" do
			create_lesson
			lesson = Lesson.last
			expect(lesson.image).to be_present
		end
	end

	describe "PUT to :update" do
		def update_lesson
			put :update, {:id => lesson.id, :lesson => {:title => "HAHAHA", :image => image} }
		end

		it "responds accepted" do
			update_lesson
			expect(response.status).to eq(202)
		end

		it "updates the lesson" do
			update_lesson
			expect(lesson.reload.title).to eq("HAHAHA")
		end

		it "returns lesson hash" do
			update_lesson
			expect(decoded_body["lesson"]).to be_present
		end

		it "updates lesson image" do
			update_lesson
			expect(lesson.reload.image_file_name).to eq("test.jpg")
		end

		it "does not set image to nil if image not present" do
			lesson.image = image
			lesson.save
			put :update, {:id => lesson.id, :lesson => {:title => "HAHAHA"} }
			expect(lesson.reload.image_file_name).to eq("test.jpg")
		end
	end

	describe "DELETE to :destroy" do
		def destroy_lesson
			delete :destroy, :id => lesson.id
		end

		it "responds accepted" do
			destroy_lesson
			expect(response.status).to eq(204)
		end

		it "destroys lesson" do
			expect { destroy_lesson }.to change { Lesson.count }.by(-1)
		end
	end

end
