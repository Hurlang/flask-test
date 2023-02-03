from flask import Flask, request
import flask

app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello World!'

@app.route('/recording/analyze', methods=['GET'])
def analyze():
    speech = request.args.get('speech')
    res = flask.Response(speech)
    res.headers["Access-Control-Allow-Origin"] = "*"
    return res

if __name__ == '__main__':
    app.run(host='0.0.0.0')