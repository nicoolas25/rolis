# Rolis

Rolis is a Redis-based role management system.

## Example

``` ruby
Rolis.configure do |c|
  c.redis = Redis.new(url: ENV["REDIS_ROLIS_URL"])
end

class User < Struct.new(:id)
  include Rolis::Base

  # Define the different roles for this model. Options are:
  #   - default: default role if none are found
  #   - key: Symbol of a method to call to get an unique id of the model
  rolis_config %i(contributor moderator admin), default: nil, key: :id
end

current_user = User.new(37)

User.rolis.add(current_user, :moderator)
# => Set [:moderator]
User.rolis.add(current_user, :admin, :contributor)
# => Set [:moderator, :admin, :contributor]
User.rolis.del(current_user, :moderator)
User.rolis.get(current_user)
# => Set [:admin, :moderator]

current_user.has_role?(:moderator)
# => false
current_user.has_role?(:admin)
# => true
current_user.has_role?(:foo)
# => ArgumentError
```

## Going further

* Handle expiration when giving a role (this changes the way roles are stored and retrieved).
* Use [nest](https://github.com/soveran/nest) to support namaspacing.
* Add declarative rights through policies à la [access-granted](https://github.com/chaps-io/access-granted).
