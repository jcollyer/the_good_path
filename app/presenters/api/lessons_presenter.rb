class Api::LessonsPresenter

	attr_reader :lessons

	def initialize(lessons)
		@lessons = lessons
	end

	def as_json(options = {})
		{
			:lessons => lessons_array
		}
	end

	def lessons_array
		lessons.map do |lesson|
			Api::LessonPresenter.new(lesson).lesson_hash
		end
	end
end
