from flask import Flask, request
import flask

# 형태소 분석 라이브러리
from konlpy.tag import Okt
# Okt Class의 생성자를 이용하여 분석기를 생성 
okt = Okt()

app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello World!'

@app.route('/recording/analyze', methods=['GET'])
def analyze():
    # 생성된 객체를 이용하여 형태소를 분석합니다.
    
    speech = request.args.get('speech')
    speech = okt.nouns(speech)
    print(speech, type(speech))
    res = flask.Response(speech)
    res.headers["Access-Control-Allow-Origin"] = "*"
    return res

if __name__ == '__main__':
    app.run(host='0.0.0.0')