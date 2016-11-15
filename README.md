# Rolis

Rolis is a Redis-based role management system.

## Example

``` ruby
Rolis.config do |c|
  c.redis = Redis.new(url: ENV["REDIS_ROLIS_URL"])
end

class User < Struct.new(:id)
  include Rolis::Base

  # Set the key to ID the model (default is :id)
  # rolis_key :id

  # Define the different roles for this model
  rolis_roles %i(contributor moderator admin), default: nil
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

* Use [nest](https://github.com/soveran/nest) to support namaspacing.
* Add declarative rights through policies à la [access-granted](https://github.com/chaps-io/access-granted).
