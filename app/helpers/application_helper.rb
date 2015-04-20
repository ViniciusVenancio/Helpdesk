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

  # formatando data para o padrão Brasileiro
  def format_date(date)
    date.strftime('%d/%m/%Y')
  end

  # Verifico se o nome e o sobrenome estão vazios. Se sim, exibo o email do usuário
  # caso contrario o nome e sobrenome
  def user_to_show(user)
    user.first_name.nil? && user.last_name.nil? ? "#{user.email}" : "#{user.first_name} #{user.last_name}"
  end

  def format_package(package)
    case package
      when 'H' then 'Hora'  
      when 'D' then 'Dia' 
      when 'M' then 'Mês'
      when 'Y' then 'Ano'
    end
  end

  def format_ticket(status)
    status.capitalize!
    case status
      when 'Pending' then 'pendentes'
      when 'Open' then 'em aberto'
      when 'Closed' then 'fechados'
      when 'Medium' then 'Médio'
      when 'Low' then 'Baixa'
      when 'High' then 'Alta'
        
    end
  end
end