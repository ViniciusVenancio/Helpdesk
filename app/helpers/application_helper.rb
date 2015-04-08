module ApplicationHelper
  include Redcarpet

  def flashy(flash)
    flash.map do |type, message|
      render "shared/flash/#{ type }", message: message
    end.join.html_safe
  end

  def logo(link_url = root_path)
    render "shared/logo", url: link_url
  end

  def markdownify(text)
    markdown = Markdown.new(Render::XHTML.new(:hard_wrap => true))
    raw Render::SmartyPants.render(markdown.render(text))
  end

  def format_date(date)
    date.strftime('%d/%m/%Y')
  end

  def user_to_show(user)
    user.first_name.empty? && user.last_name.empty? ? "#{user.email}" : "#{user.first_name} #{user.last_name}"
  end
end