# Practice Tutorial: Dialogflow Chatbot with Ruby on Rails

> In this tutorial, we will build a chatbot interaction to Stream Chat using Ruby on Rails.

## Prerequisities:
* Ruby on Rails
* Javascript and React
* Node
* RVM
* Ngrok
* PostgreSQL

## Steps:
### Install Ruby on Rails
    
```bash
rvm install 2.6.3
```

```bash
# Create a gemset for isolating the dependencies
rvm use --create 2.6.3@rails-chat
```

```bash
gem install rails 
```

### Build the Applicaiton Skeleton with React and PostgreSQL
```bash
rails new rails-chat --webpack=react --database=postgresql
```

```bash
cd rails-chat
```

### Add the dependencies to Gemfile
```ruby
gem 'webpacker'
gem 'react-rails'
gem 'stream-chat-ruby'
gem 'google-cloud-dialogflow'
gem 'bcrypt', '~> 3.1.7
```

```bash
bundle install
```

```bash
rails db:create
```

```bash
rails webpacker:install
rails webpacker:install:react
rails generate react:install
yarn add webpack-cli stream-chat-react
```

### Add User to the Application
```bash
rails generate scaffold User handle:string name:string password:digest
```

### Add User model validation in _app/models/user.rb_
```ruby
# ...
validates :handle, presence: true, uniqueness: true
validates :name, presence: true
```

```bash
rails db:migrate
```

```bash
rails server
```


**Reference:**
* [Tutorial: Dialogflow Chatbot with Ruby on Rails](https://dev.to/mirceacosbuc/tutorial-dialogflow-chatbot-with-ruby-on-rails-3p87)
* [Rails Chat Dialogflow Example](https://github.com/GetStream/rails-chat-dialogflow-example)
* [Rails Check Sneak Peak Video](https://vimeo.com/346885809)