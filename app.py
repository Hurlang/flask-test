from flask import Flask, request

app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello World!'

@app.route('/recording/analyze', methods=['GET'])
def analyze():
    return request.args.get('speech')

if __name__ == '__main__':
    app.run()