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

### Add session controller for logging in and out
```bash
rails generate controller session new create destroy
```

app/controllers/session_controller.rb
```ruby
class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by_handle(params[:handle])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:chat_token] = @chat.create_token(user.handle)
      redirect_to root_url, noticed: "Logged in!"
    else
      flash.now[:alert] = "Handle or password is invalid"
      render "new"
    end
    
    def destroy
      session[:user_id] = nil
      session[:chat_token] = nil
      redirect_to root_url, noticed: "Logged out!"
  end
end
```

app/views/sessions/new.html.erb
```html
<p id="alert"><%= alert %></p>
<h1>Login</h1>

<%= form_tag session_path do |form| %>
  <div class="field">
    <%= label_tag :handle %>
    <%= text_field_tag :handle %>
  </div>
  <div class="field">
    <%= label_tag :password %>
    <%= password_field_tag :password %>
  </div>
  <div class="actions">
    <%= submit_tag "Login" %>
  </div>
<% end %>
```

config/routes.rb
```ruby
get 'signup', to: 'users#new', as: 'signup'
get 'login', to: 'sessions#new', as: 'login'
get 'logout', to: 'sessions#destroy', as: 'logout'
```


**Reference:**
* [Tutorial: Dialogflow Chatbot with Ruby on Rails](https://dev.to/mirceacosbuc/tutorial-dialogflow-chatbot-with-ruby-on-rails-3p87)
* [Rails Chat Dialogflow Example](https://github.com/GetStream/rails-chat-dialogflow-example)
* [Rails Check Sneak Peak Video](https://vimeo.com/346885809)