class Admin::Authenticator
  def initialize(administrator)
    @staff_member = staff_member
  end

  def authenticate(raw_password)
    @administrator &&
      # @staff_member.hashed_password &&
      # @staff_member.start_date <= Date.today &&
      (@administrator.end_date.nil? || @administrator.end_date > Date.today) &&
      BCrypt::Password.new(@administrator.hashed_password) == raw_password
  end
end