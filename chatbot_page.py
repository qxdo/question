from flask import Flask, render_template, request, jsonify

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html', name='test')

@app.route('/api/chat', methods=['POST'])
def api_message():
    data = request.get_json()
    response_message = 'api接口出错啦，请排查一下吧'
    # write logic in there


    print('req:', data['message'],'resp:', response_message)

    return jsonify({'code': 0, 'message': 'success', 'data': response_message})


if __name__ == '__main__':
    app.run(debug=True, port=4999)
