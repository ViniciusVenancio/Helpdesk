module Auth
	def auth_admin!
		redirect_to :root unless current_user.role? :admin 
	end
end