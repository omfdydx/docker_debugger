import os
from flask import Flask
from flask import make_response, jsonify
app = Flask(__name__)

@app.route('/')
def home():
    """
    Defines the route for the root URL ('/') and returns a simple "Hello World!" message.
    """
    return make_response(jsonify(res='Hello World!', code=200), 200)

@app.route('/<page_name>')
def other_page(page_name):
    """
    This function handles HTTP requests to pages that do not exist.

    Parameters:
        page_name (str): The name of the page that was requested.

    Returns:
        response: A 404 error response with a message indicating that the page does not exist.
    """
    response = make_response(f'The page named {page_name} does not exist.', 404)
    return response

if __name__ == '__main__':
    app.run(debug=True, port=os.environ.get('FLASK_RUN_PORT', 5000), host='0.0.0.0')
