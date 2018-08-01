class AuthenticateTenant
  prepend SimpleCommand
  attr_accessor :full_name


  def initialize(full_name)
    @full_name = full_name
  end

  def call
    JsonWebToken.encode(tenant_id: tenant.id) if tenant
  end

  private

  def tenant
    tenant = Tenant.find_by_full_name(full_name)
    return tenant if tenant

    errors.add :tenant_authentication, 'Invalid credentials'
    nil
  end
end
