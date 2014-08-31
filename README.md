## Problem

Within the Rails console I can run this code successfully:

```ruby
u = User.new
u.username = "u"
u.password = "p"
u.email = "e"
u.save!
#> success

User.destroy_all
```

However, I when I run this code I get an error:

```ruby
User.create!(username:"u", password:"p", email:"e")

WARNING: Can't mass-assign protected attributes for User: username, password, email

   (0.2ms)  BEGIN
[deprecated] I18n.enforce_available_locales will default to true in the future. If you really want to skip validation of your locale you can set I18n.enforce_available_locales = false to avoid this message.
  User Exists (0.4ms)  SELECT 1 AS one FROM "users" WHERE "users"."email" IS NULL LIMIT 1
   (0.2ms)  ROLLBACK
ActiveRecord::RecordInvalid: Validation failed: Password can't be blank, Email can't be blank
	from /Users/user/.rvm/gems/ruby-2.1.0/gems/activerecord-4.0.2/lib/active_record/validations.rb:57:in `save!'
	from /Users/user/.rvm/gems/ruby-2.1.0/gems/activerecord-4.0.2/lib/active_record/attribute_methods/dirty.rb:41:in `save!'
	from /Users/user/.rvm/gems/ruby-2.1.0/gems/activerecord-4.0.2/lib/active_record/transactions.rb:275:in `block in save!'
	from /Users/user/.rvm/gems/ruby-2.1.0/gems/activerecord-4.0.2/lib/active_record/transactions.rb:326:in `block in with_transaction_returning_status'
	from /Users/user/.rvm/gems/ruby-2.1.0/gems/activerecord-4.0.2/lib/active_record/connection_adapters/abstract/database_statements.rb:202:in `block in transaction'
	from /Users/user/.rvm/gems/ruby-2.1.0/gems/activerecord-4.0.2/lib/active_record/connection_adapters/abstract/database_statements.rb:210:in `within_new_transaction'
	from /Users/user/.rvm/gems/ruby-2.1.0/gems/activerecord-4.0.2/lib/active_record/connection_adapters/abstract/database_statements.rb:202:in `transaction'
	from /Users/user/.rvm/gems/ruby-2.1.0/gems/activerecord-4.0.2/lib/active_record/transactions.rb:209:in `transaction'
	from /Users/user/.rvm/gems/ruby-2.1.0/gems/activerecord-4.0.2/lib/active_record/transactions.rb:323:in `with_transaction_returning_status'
	from /Users/user/.rvm/gems/ruby-2.1.0/gems/activerecord-4.0.2/lib/active_record/transactions.rb:275:in `save!'
	from /Users/user/.rvm/gems/ruby-2.1.0/gems/protected_attributes-1.0.8/lib/active_record/mass_assignment_security/validations.rb:17:in `create!'
	from (irb):10
	from /Users/user/.rvm/gems/ruby-2.1.0/gems/railties-4.0.2/lib/rails/commands/console.rb:90:in `start'
	from /Users/user/.rvm/gems/ruby-2.1.0/gems/railties-4.0.2/lib/rails/commands/console.rb:9:in `start'
	from /Users/user/.rvm/gems/ruby-2.1.0/gems/railties-4.0.2/lib/rails/commands.rb:62:in `<top (required)>'
```

## Question

Why won't this 