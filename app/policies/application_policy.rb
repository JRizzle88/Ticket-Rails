class ApplicationPolicy
  attr_reader :current_user, :record

  def initialize(current_user, record)
    @current_user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(current_user, record.class)
  end

  class Scope
    attr_reader :current_user, :scope

    def initialize(current_user, scope)
      @current_user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
