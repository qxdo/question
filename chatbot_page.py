from flask import Flask, render_template, request, jsonify

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html', name='test')

@app.route('/api/chat', methods=['POST'])
def api_message():
    data = request.get_json()
    print(data['message'])
    # 在这里处理消息，例如发送电子邮件或保存到数据库
    return jsonify({'code': 0, 'message': 'success', 'data': '测试12345676'})

if __name__ == '__main__':
    app.run(debug=True)

