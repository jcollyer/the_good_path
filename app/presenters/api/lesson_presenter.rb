class Api::LessonPresenter

	attr_reader :lesson

	def initialize(lesson)
		@lesson = lesson
	end

	def as_json(options = {})
 		{
 			:lesson => lesson_hash
 		}
	end

	def lesson_hash
		{
			:id => lesson.id,
			:title => lesson.title,
			:summary => lesson.summary,
			:image_thumb_url => lesson.image.url(:thumb),
			:image_medium_url => lesson.image.url(:medium),
			:image_large_url => lesson.image.url(:large),
			:mp3 => lesson.mp3
		}
	end
end
