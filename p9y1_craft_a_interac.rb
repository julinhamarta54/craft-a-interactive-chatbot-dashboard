require 'sinatra'
require 'json'

class ChatbotDashboard < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/chat' do
    input = params[:input]
    response = chatbot_response(input)
    { response: response }.to_json
  end

  def chatbot_response(input)
    # Simple chatbot logic, feel free to replace with your own AI-powered bot!
    case input.downcase
    when 'hello', 'hi'
      'Hey there! How can I assist you today?'
    when 'what is your purpose'
      'I am a chatbot designed to provide helpful and informative responses.'
    else
      'I didn\'t understand that. Can you please rephrase?'
    end
  end
end

__END__

@@ index
<!DOCTYPE html>
<html>
  <head>
    <title>Chatbot Dashboard</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <style>
      body {
        font-family: Arial, sans-serif;
      }
      #chat-log {
        width: 80%;
        margin: 20px auto;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      }
    </style>
  </head>
  <body>
    <h1>Chatbot Dashboard</h1>
    <div id="chat-log"></div>
    <input id="input" type="text" placeholder="Type a message...">
    <button id="send">Send</button>

    <script>
      $(document).ready(function() {
        $('#send').click(function() {
          var input = $('#input').val();
          $.post('/chat', { input: input }, function(data) {
            $('#chat-log').append('<p>You: ' + input + '</p>');
            $('#chat-log').append('<p>Bot: ' + data.response + '</p>');
            $('#input').val('');
          });
        });
      });
    </script>
  </body>
</html>