module PagesHelper
  include HaikuGenerator

  def haiku_generator
    @haiku_generator ||= HaikuGenerator.new
  end
end
