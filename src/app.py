# Importing flask module in the project is mandatory
from flask import Flask
from flask.logging import create_logger
import logging

# Flask constructor takes the name of
# current module (__name__) as argument.
app = Flask(__name__)

LOG = create_logger(app)
LOG.setLevel(logging.INFO)

app_version = "1.0"

# The route() function of the Flask class is a decorator,
# which tells the application which URL should call
# the associated function.
@app.route("/")
def home():
    html = f"<h3>Tom's DevOps Capstone Home</h3>\n Client on Hello! <a href='/hello'>Hello</a>"
    return html.format(format)

@app.route('/hello')
# �/hello� URL is bound with hello() function.
def hello():
    LOG.info(f"Hello World! Version[{app_version}]") 
    return 'Hello World! <br/>Version[' + app_version + ']'

# main driver function
if __name__ == '__main__':

    # run() method of Flask class runs the application
    # on the local development server.
    # app.run()
    app.run(host='0.0.0.0', port=80, debug=True)