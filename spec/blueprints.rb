require "machinist/active_record"

Lesson.blueprint do
	title { "Lesson #{sn}" }
	summary { "The best lesson in the world!" }
end
