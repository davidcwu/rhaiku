module PagesHelper
  include HaikuGenerator

  def haiku_generator
    @haiku_generator ||= HaikuGenerator.new
  end

  def title
    base_title = "Rhaiku"
    if @title
      return "#{base_title} | #{@title}"
    else
      return "#{base_title}"
    end
  end
end
