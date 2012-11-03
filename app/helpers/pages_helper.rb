module PagesHelper
  def haiku_generator
    @haiku_generator ||= HaikuGenerator.new
  end
end
